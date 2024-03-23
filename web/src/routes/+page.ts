export async function load({
	fetch
}): Promise<{ [key: string]: { id: string; timeBlock: number } } | null> {
	try {
		const response = await fetch(`https://ath-bucket.ppc.lol/aths.json`);
		const data = await response.json();
		return data;
	} catch (error) {
		console.error(error);
		return null;
	}
}
