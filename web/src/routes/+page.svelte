<script type="ts">
	export let data;
	import { t } from '$lib/translations';
</script>

<div class="container">
	{#if data.aths}
		{#each data.aths as item}
			<div class="grid-item">
				<div class="item-header">
					<h1>{$t(`home.items.${item.name}.title`)}</h1>
					<p><small>{$t(`home.items.${item.name}.description`)}</small></p>
					<hr />
				</div>
				<div class="item-content">
					<h4>
						<a
							href={`https://blockbook.peercoin.net/block/${item.height}`}
							target="_blank"
							rel="noopener noreferrer"
							>{$t(`home.block`)}
							{item.height} ({new Date(item.timeBlock * 1000).toLocaleDateString()})
						</a>
					</h4>
					<h3 class="right-align">{item.value}</h3>
				</div>
			</div>
		{/each}
	{:else}
		<div>{$t(`home.noData`)}</div>
	{/if}
</div>
<div class="last-modified">
	{$t('home.lastModified')}{data.lastModified}
</div>

<style>
	.container {
		display: grid;
		grid-gap: 20px;
		grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
		@media (min-width: 1024px) {
			grid-template-columns: repeat(3, 1fr);
		}
	}
	.grid-item {
		padding: 1rem;
		background: var(--peercoin-green);
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
	.item-header {
		flex-basis: 11rem;
	}
	.right-align {
		text-align: right;
	}
	.last-modified {
		color: var(--peercoin-green);
		margin-top: 1.5rem;
	}
	hr {
		color: var(--peercoin-white);
		width: 33%;
		text-align: left;
		margin-left: 0;
	}
</style>
