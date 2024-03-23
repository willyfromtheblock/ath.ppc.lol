<script type="ts">
	import { t } from '$lib/translations';
</script>

<header>
	<img src="/peercoin.svg" alt="Logo" height="150px" />
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
		<span class="donations">Donations: PM7jjBUPjzpkZy1UZtD7mvmHoXJ2BGvbx9</span>
	</div>
</footer>

<style>
	:global(body) {
		font-family: 'Roboto';
		background: var(--peercoin-white);
		color: white;
		padding: 0.5rem;
		margin-left: 1rem;
		margin-right: 1rem;
		display: flex;
		flex-direction: column;
		justify-content: center;
		@media (min-width: 768px) {
			padding: 1rem;
			margin-left: 3rem;
			margin-right: 3rem;
		}
	}
	:global(hr) {
		color: var(--peercoin-white);
	}

	:global(a) {
		color: lightgrey;
		text-decoration: none;
	}
	:global(:root) {
		--peercoin-green: rgb(60, 176, 84);
		--peercoin-white: var(--peercoin-white);
	}
	.donations {
		font-size: 1rem;
		@media (min-width: 768px) {
			font-size: 1.5rem;
		}
	}

	header {
		color: var(--peercoin-green);
		display: flex;
		align-items: center;
		flex-wrap: wrap;
		justify-content: center;
		margin-bottom: 2rem;
		gap: 1rem;
		@media (min-width: 768px) {
			justify-content: unset;
			gap: 3rem;
		}
	}
	footer {
		color: var(--peercoin-green);
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
		color: var(--peercoin-green);
	}
</style>
