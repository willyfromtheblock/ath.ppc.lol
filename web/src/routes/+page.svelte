<script type="ts">
	export let data;
	console.log(data);
</script>

{#if data}
	{#each Object.entries(data) as [key, value]}
		<div>{key} {value['id']}</div>
	{/each}
{/if}
