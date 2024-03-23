export async function load({ fetch }): Promise<{ aths: Ath[] } | {}> {
	try {
		const response = await fetch(`https://ath-bucket.ppc.lol/aths.json`);
		const data: Ath[] = await response.json();
		return { aths: data };
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
