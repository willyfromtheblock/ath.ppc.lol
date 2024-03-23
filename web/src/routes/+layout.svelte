<script type="ts">
	import { t } from '$lib/translations';
</script>

<header>
	<img src="/peercoin.svg" alt="Logo" height="200px" />
	<h2>{$t('home.title')}</h2>
</header>
<main>
	<slot />
</main>

<footer>
	<hr />
	<p>{$t('home.footer.disclaimer')}</p>
	<div>
		<a href="https://ppc.lol/charts" target="_blank" rel="noopener noreferrer"
			>{$t('home.footer.charts')}
		</a>
		<a href="https://ppc.lol/dotnet" target="_blank" rel="noopener noreferrer"
			>{$t('home.footer.website')}
		</a>
		<span>Donations: PM7jjBUPjzpkZy1UZtD7mvmHoXJ2BGvbx9</span>
	</div>
</footer>

<style>
	:global(body) {
		font-family: 'Roboto';
		background: rgb(60, 176, 84);
		color: white;
		padding: 0.5rem;
		margin-left: 2rem;
		margin-right: 2rem;
	}
	:global(hr) {
		color: #dff0d8;
	}

	:global(a) {
		color: lightgrey;
		text-decoration: none;
	}

	header {
		display: flex;
		align-items: center;
		flex-wrap: wrap;
	}
	footer {
		margin-top: 1.5rem;
		text-align: center;
	}
	footer > div {
		margin-top: 1.5rem;
		font-size: 1.5rem;
		display: flex;
		justify-content: space-evenly;
		flex-wrap: wrap;
	}
	footer > div > a {
		color: white;
	}
</style>
