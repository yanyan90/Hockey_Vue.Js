<template>
    <div class="component">
        <div class="conteneur-show">

            <h1 class="show-joueur">{{ joueur.prenom }} {{ joueur.nom }}</h1>

            <div class="contenue-show-joueur">

                <div class="infos">
                    <img :src="`/img/joueurs/${joueur.id}/512x512.webp`" width="75" height="75" alt="joueur image">
                    <p class="show-joueur"><strong>Numero:</strong> {{ joueur.numero }}</p>
                    <p class="show-joueur"><strong>Position:</strong> {{ joueur.position }}</p>
                    <p class="show-joueur" v-if="equipe"><strong>Équipe:</strong> {{ equipe.nom }}</p>
                    <p class="show-joueur"><strong>Buts saisons 2023:</strong> {{ joueur.but }}</p>
                    <p class="show-joueur"><strong>Passe saisons 2023:</strong> {{ joueur.passe }}</p>
                </div>
            </div>

            <router-link class="btn btn-light show-joueur" :to="{ name: 'joueurs.index' }">Retour au joueurs</router-link>

        </div>
    </div>
</template>

<script setup>
import { ref, defineProps, onBeforeMount } from 'vue'
import axios from 'axios'

const props = defineProps({
    id: {
        type: [Number, String],
        required: true,
    },
})

const joueur = ref({})
const equipe = ref(null)
// const getEquipeImagePath = (nomImage) => {
//     return `/img/joueurs/${nomImage}`
// }

onBeforeMount(async () => {
    try {
        const joueurResponse = await axios.get(`http://localhost:8000/api/joueurs/${props.id}`)
        joueur.value = joueurResponse.data



        if (joueur.value.equipe_id) {
            const equipeResponse = await axios.get(`http://localhost:8000/api/equipes/${joueur.value.equipe_id}`)
            equipe.value = equipeResponse.data
        }
    } catch (error) {
        console.error('Error fetching player details:', error)
    }
})
</script>

<style lang="scss">
/* font-family: 'Bebas Neue', sans-serif;
font-family: 'Montserrat', sans-serif;
font-family: 'Roboto', sans-serif; */
h1.show-joueur {
    text-align: center;
    font-family: 'Bebas Neue', sans-serif;
    margin-top: 50px;
}

.infos {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.infos img {
    width: 300px;
    height: 300px;
    border-radius: 50%;
}

.contenue-show-joueur {
    width: 600px;
    margin-left: 50%;
    transform: translateX(-50%);
}

p.show-joueur {
    font-family: 'Roboto', sans-serif;
    font-size: 22px;
}

a.show-joueur {
    display: block;
    margin-left: 50%;
    transform: translateX(-50%);
    width: 200px;
}
</style>

