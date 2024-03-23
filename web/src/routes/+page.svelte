<script type="ts">
	export let data;
	import { t } from '$lib/translations';
</script>

{#if data.aths}
	{#each data.aths as item}
		<div>{$t(`home.${item.name}`)}</div>
	{/each}
{:else}
	<div>no data</div>
{/if}
