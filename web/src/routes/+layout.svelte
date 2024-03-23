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
	</div>
</footer>

<style>
	:global(body) {
		font-family: 'Roboto';
		background: rgb(60, 176, 84);
		color: white;
		padding: 1rem;
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
		margin-bottom: 0.5rem;
		flex-wrap: wrap;
	}
	footer {
		margin-top: 2rem;
		text-align: center;
	}
	footer > div {
		margin-top: 1rem;
		font-size: 1.5rem;
		display: flex;
		justify-content: space-around;
	}

	footer > div > a {
		color: white;
	}
</style>
