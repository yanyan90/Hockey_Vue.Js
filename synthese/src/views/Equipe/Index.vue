<template>
    <div class="component">

        <div class="contenue-titre-recherche">

            <h1 class="equipeh1">Liste des Équipes</h1>
            <!-- barre de recherche -->
            <form @submit.prevent="">
                <input class="recherche-equipe" type="text" v-model="recherche"
                    placeholder="Rechercher votre équipe par nom">
            </form>
        </div>

        <!-- liste equipes -->
        <div class="equipe">
            <EquipeListe :equipes="filtrerEquipes" :getEquipeImagePath="getEquipeImagePath" />
        </div>

    </div>
</template>

<script setup>

import EquipeListe from '@/components/Equipe/Liste.vue'
import axios from 'axios'
import { ref, reactive, computed, onBeforeMount } from 'vue'

const equipes = ref([])
const recherche = ref('')

// path pour recuperer l'image dans sont dossier(equipe) relier au string de la bdd de la colone image dans table equipe 
const getEquipeImagePath = (nomImage) => {
    return `/img/equipes/${nomImage}`
}

// recuperer tout de la table equipe
onBeforeMount(() => {
    axios('http://localhost:8000/api/equipes').then(response => {
        equipes.value = response.data
    })
})

const filtrerEquipes = computed(() => {
    // Filtrer les equipes en fonction de la recherche
    return equipes.value.filter(equipe =>
        equipe.nom.toLowerCase().includes(recherche.value.toLowerCase()) ||
        equipe.ville.toLowerCase().includes(recherche.value.toLowerCase())
    )
})
</script>

<style lang="scss">
/* font-family: 'Bebas Neue', sans-serif;
font-family: 'Montserrat', sans-serif;
font-family: 'Roboto', sans-serif; */
.equipe {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    flex-direction: column;
    border-radius: 10px;
    width: 800px;
    margin-left: 50%;
    max-height: 600px;
    height: 600px;
    transform: translateX(-50%);
    background-color: rgb(255, 255, 255);
    margin-top: 5px;
    box-shadow: 0px 0px 14px black;
    overflow-y: scroll;

    /* Personnalisation de la barre de défilement */
    scrollbar-width: thin;
    /* Utilisé pour Firefox */
    scrollbar-color: transparent transparent;
    /* Utilisé pour Firefox */

    &::-webkit-scrollbar {
        width: 8px;
        /* Largeur de la barre de défilement */
    }

    &::-webkit-scrollbar-track {
        background: transparent;
        /* Couleur de fond de la piste */
    }

    &::-webkit-scrollbar-thumb {
        background: transparent;
        /* Couleur du "thumb" (poignée) */
        border-radius: 4px;
        /* Coins arrondis du thumb */
    }

    &:hover::-webkit-scrollbar-thumb {
        background: rgba(0, 0, 0, 0.3);
        /* Couleur du thumb lors du survol */
    }
}

h1.equipeh1 {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 48px;
}

.recherche-equipe {
    width: 300px;
    height: 50px;
    border-radius: 4px;
    border: 0.5px solid rgba(0, 0, 0, 0.268);
    margin-top: 10px;
    margin-bottom: 20px;
}

input.recherche-equipe {
    transition: 0.2s ease-in-out;

}

input.recherche-equipe:hover {
    border-color: black;
}

input.recherche-equipe::placeholder {
    font-family: 'Roboto', sans-serif;
    color: rgba(38, 38, 38, 0.292);
    padding-left: 3px;
}

.contenue-titre-recherche {
    display: flex;
    justify-content: space-between;
    width: 800px;
    align-items: center;
    margin-left: 50%;
    transform: translateX(-50%);
    margin-top: 30px;
}
</style>