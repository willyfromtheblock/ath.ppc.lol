import 'package:feeder/feeder.dart' as feeder;
import 'package:dotenv/dotenv.dart';
import 'dart:io';

const envList = [
  "PING_PORT",
  "DB_PATH",
  "MINIMUM_BLOCK",
  "S3_ENDPOINT_URL",
  "S3_ACCESS_KEY",
  "S3_SECRET_KEY",
  "S3_BUCKET_NAME",
  "S3_FILE_NAME"
];

void main() {
  var env = DotEnv(includePlatformEnvironment: true)..load();

  if (env.isEveryDefined(envList) == false) {
    throw Exception('Error: Environment variables not found or incomplete');
  }

  HttpServer.bind(InternetAddress.loopbackIPv4, int.parse(env["PING_PORT"]!))
      .then((server) {
    server.listen((HttpRequest request) {
      feeder.run(env);
      request.response
        ..statusCode = HttpStatus.ok
        ..write('Server received request')
        ..close();
    });
  });
}
