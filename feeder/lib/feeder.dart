import 'dart:convert';
import 'dart:io';

import 'package:aws_s3_api/s3-2006-03-01.dart';
import 'package:dotenv/dotenv.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:sqlite_async/sqlite_async.dart';

final logger = SimpleLogger();

void run(DotEnv env) async {
  late SqliteDatabase db;

  try {
    db = SqliteDatabase(path: env['DB_PATH']);
    await db.initialize();
    final res = await db.getAll('SELECT * FROM chain');
    if (res.isEmpty) {
      throw Exception('No data found');
    }
  } catch (e) {
    if (e.toString().contains('no such table')) {
      throw Exception('Error: Database not found');
    }
    throw Exception('Error: $e');
  }

  //db initialization successful

  //get aths
  //ignore all values before this block (we will start with the first PoS block since all data before is skewed)
  final minimumBlock = env['MINIMUM_BLOCK'];

  //coins created ath (proof of work)
  final powCoinsCreatedAth = await db.get(
      'SELECT id, mint, timeBlock FROM blocks WHERE type = "proof-of-work" ORDER BY mint DESC LIMIT 1');
  //coins created ath (proof of stake)
  final posCoinsCreatedAth = await db.get(
      'SELECT id, mint, timeBlock FROM blocks WHERE (type = "proof-of-stake" OR type = "proof-of-stake stake-modifier") AND id >= $minimumBlock ORDER BY mint DESC LIMIT 1');

  //difficulty ath (proof of work)
  final powDifficultyAth = await db.get(
      'SELECT id, difficulty, timeBlock FROM blocks WHERE type = "proof-of-work" ORDER BY difficulty DESC LIMIT 1');

  //difficulty ath (proof of stake)
  final posDifficultyAth = await db.get(
      'SELECT id, difficulty, timeBlock FROM blocks WHERE (type = "proof-of-stake" OR type = "proof-of-stake stake-modifier") AND id >= $minimumBlock ORDER BY difficulty DESC LIMIT 1');

  //coinsupply ath
  final coinsupplyAth = await db.get(
      'SELECT id, coinsupply, timeBlock FROM blocks ORDER BY coinsupply DESC LIMIT 1');

  //txfee ath
  final txfeeAth = await db.get(
      'SELECT id, txfee, timeBlock FROM blocks ORDER BY txfee DESC LIMIT 1');

  //realtx ath
  final realtxAth = await db.get(
      'SELECT id, RealTX, timeBlock FROM blocks ORDER BY RealTX DESC LIMIT 1');

  //realvout ath
  final realvoutAth = await db.get(
      'SELECT id, RealVOUT, timeBlock FROM blocks ORDER BY RealVOUT DESC LIMIT 1');

  //blocksize ath
  final blocksizeAth = await db.get(
      'SELECT id, blockSize, timeBlock FROM blocks ORDER BY blockSize DESC LIMIT 1');

  // Create a JSON with the values above
  var aths = {
    'powCoinsCreatedAth': powCoinsCreatedAth,
    'posCoinsCreatedAth': posCoinsCreatedAth,
    'powDifficultyAth': powDifficultyAth,
    'posDifficultyAth': posDifficultyAth,
    'coinsupplyAth': coinsupplyAth,
    'txfeeAth': txfeeAth,
    'realtxAth': realtxAth,
    'realvoutAth': realvoutAth,
    'blocksizeAth': blocksizeAth,
  };

//write aths to aths.json
  final jsonContent = jsonEncode(aths);

// Read the existing file
  final tempFilePath = './aths.json';
  final tempFile = File(tempFilePath);
  bool fileExists = await tempFile.exists();

  if (!fileExists ||
      (fileExists && await tempFile.readAsString() != jsonContent)) {
    // If the file doesn't exist or the content is different, upload to S3
    final newFileContent = utf8.encode(jsonContent);

    //upload to s3
    final service = S3(
      region: 'auto',
      endpointUrl: env['S3_ENDPOINT_URL'],
      credentials: AwsClientCredentials(
        accessKey: env['S3_ACCESS_KEY']!,
        secretKey: env['S3_SECRET_KEY']!,
      ),
    );

    await service.putObject(
      bucket: env['S3_BUCKET_NAME']!,
      key: env['S3_FILE_NAME']!,
      body: newFileContent,
      contentType: 'application/json',
    );

    // Update the temp file with the new content
    await tempFile.writeAsBytes(newFileContent);
    logger.info(aths);
  } else {
    logger.info('No changes detected');
  }

  //close db
  await db.close();
}
