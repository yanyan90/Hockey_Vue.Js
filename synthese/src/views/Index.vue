<template>
    <main>

        <div class="entete">
            <img src="img/pngegg.png" width="50" height="50" alt="Logo Dek Hockey">

            <h1 class="entete">Fédération Dek Hockey du Canada</h1>
        </div>

        <!-- caroussel page accueil -->
        <Caroussel />

        <h2 class="entete">joueurs et Équipes vedettes</h2>

        <div class="joueur-equipe-elite">

            <!-- affichage joueurs vedette -->
            <div v-for="joueur in joueurs" class="nom-joueur">
                <p class="joueur-nom">{{ joueur.prenom }} {{ joueur.nom }}</p>
                <img :src="`/img/joueurs/${joueur.id}/512x512.webp`" width="150" height="150" alt="image joueur vedette">
            </div>

            <!-- affichage equipes vedette -->
            <div v-for="equipe in equipes" class="nom-equipe">
                <p class="joueur-nom">{{ equipe.nom }}</p>
                <img :src="getEquipeImagePath(equipe.image)" width="150" height="150" alt="image equipe vedette">
            </div>

        </div>

    </main>
</template>

<script setup>
import Caroussel from '@/components/Caroussel.vue'
import axios from 'axios'
import { ref, onBeforeMount } from 'vue'
import { useRouter } from 'vue-router'


const joueurs = ref([])
const equipes = ref([])



const getEquipeImagePath = (nomImage) => {
    return `/img/equipes/${nomImage}`
}

onBeforeMount(() => {
    axios('http://localhost:8000/api/joueurs?limit=3&by=rand').then(response => {
        joueurs.value = response.data
    })
})
onBeforeMount(() => {
    axios('http://localhost:8000/api/equipes?limit=3&by=rand').then(response => {
        equipes.value = response.data
    })
})

</script>

<style>
/* font-family: 'Bebas Neue', sans-serif;
font-family: 'Montserrat', sans-serif;
font-family: 'Roboto', sans-serif; */

body {
    margin: 0px;
}

h1.entete {
    text-align: center;
    font-family: 'Bebas Neue', sans-serif;
    font-size: 50px;

}

h2.entete {
    text-align: center;
    font-family: 'Bebas Neue', sans-serif;
    margin-top: 30px;
    margin-bottom: 30px;
    font-size: 45px;
}

div.entete {
    display: flex;
    justify-content: center;
    margin-top: 15px;
    margin-bottom: 15px;
}

.joueur-equipe-elite {
    display: flex;
    justify-content: space-around;
}

p.joueur-nom {
    text-align: center;
    font-family: 'Bebas Neue', sans-serif;
}
</style>
