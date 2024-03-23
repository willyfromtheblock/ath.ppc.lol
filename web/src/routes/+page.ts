export async function load({ fetch }): Promise<{ aths: Ath[]; lastModified: string } | {}> {
	try {
		const response = await fetch(`https://ath-bucket.ppc.lol/aths.json`);
		const data: Ath[] = await response.json();
		return { aths: data, lastModified: response.headers.get('last-modified') };
	} catch (error) {
		console.error(error);
		return {};
	}
}

type Ath = {
	name: string;
	height: number;
	timeBlock: number;
	value: number;
};
