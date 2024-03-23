<script type="ts">
	export let data;
	import { t } from '$lib/translations';
</script>

<main>
	{#if data.aths}
		{#each data.aths as item}
			<div class="grid-item">
				<h1>{$t(`home.items.${item.name}`)}</h1>
				<div class="item-content">
					<span>
						{$t(`home.block`)}
						{item.height} ({new Date(item.timeBlock * 1000).toLocaleDateString()})
					</span>
					<span>{$t(`home.value`)} {item.value}</span>
				</div>
			</div>
		{/each}
	{:else}
		<div>{$t(`home.noData`)}</div>
	{/if}
</main>

<style>
	main {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
		grid-gap: 20px;
	}
	.grid-item {
		padding: 1rem;
		border-radius: 5px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		display: flex;
		flex-direction: column;
	}
	.item-content {
		flex-grow: 1;
		display: flex;
		flex-direction: column;
		justify-content: space-evenly;
	}
</style>
