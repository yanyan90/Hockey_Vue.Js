<template>
	<nav>

		<router-link class="lien-nav" :to="{ name: 'accueil' }">Accueil</router-link>
		<router-link class="lien-nav" :to="{ name: 'evenements.index' }">Évenements</router-link>
		<router-link class="lien-nav" :to="{ name: 'equipes.index' }">Équipes</router-link>
		<router-link class="lien-nav" :to="{ name: 'joueurs.index' }">Joueurs</router-link>

	</nav>
</template>

<script setup>
import { RouterLink } from 'vue-router'
</script>

<style>
/* font-family: 'Bebas Neue', sans-serif;
font-family: 'Montserrat', sans-serif;
font-family: 'Roboto', sans-serif; */

body {
	margin: 0px;
}

nav {
	background-color: rgb(255, 255, 255);
	display: flex;
	justify-content: space-around;
	align-items: center;
	height: 75px;

}

a.lien-nav {
	margin: 0px;
	text-decoration: none;
	text-transform: uppercase;
	color: rgb(156, 156, 156);
	border: 0px 1px 0px 1px solid white;
	font-family: 'Bebas Neue', sans-serif;
	font-size: 30px;
	transition: 0.2s ease-in-out;
	border-left: 2px solid black;
	border-right: 2px solid black;
	padding-left: 10px;
	padding-right: 10px;
}

a.lien-nav:hover {
	font-size: 31px;
	color: rgb(54, 23, 23);
}
</style>