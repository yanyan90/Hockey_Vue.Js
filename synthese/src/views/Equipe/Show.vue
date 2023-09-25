<template>
    <div class="component">
        <div>
            <img class="equipe-show" :src="getEquipeImagePath(equipe.image)" width="50" height="50" alt="">
            <div>
                <div>
                    <h1 class="equipe-show">{{ equipe.nom }}</h1>
                    <h2 class="equipe-show">{{ equipe.ville }}</h2>
                    <p class="equipe-show" v-if="joueurs.length"><strong>Joueurs</strong></p>
                    <div class="contenue-show-equipe">
                        <div class="show" v-if="joueurs.length">
                            <div class="show-equipe-joueur" v-for="joueur in joueurs" :key="joueur.id">


                                <strong>{{ joueur.prenom }} {{ joueur.nom }}</strong>
                                <img :src="`/img/joueurs/${joueur.id}/512x512.webp`" width="50" height="50" alt="">

                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <router-link class="btn btn-primary" :to="{ name: 'equipes.index' }">Retour aux équipes</router-link>

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

const joueurs = ref([])
const equipe = ref({})


const getEquipeImagePath = (nomImage) => {
    return `/img/equipes/${nomImage}`
}

onBeforeMount(async () => {
    try {
        const equipeResponse = await axios.get(`http://localhost:8000/api/equipes/${props.id}`)
        equipe.value = equipeResponse.data

        const joueursResponse = await axios.get('http://localhost:8000/api/joueurs')
        joueurs.value = joueursResponse.data.filter(joueur => joueur.equipe_id === equipe.value.id)
    } catch (error) {
        console.error('Error fetching team details:', error)
    }
})
</script>
  
<style lang="scss">
/* font-family: 'Bebas Neue', sans-serif;
font-family: 'Montserrat', sans-serif;
font-family: 'Roboto', sans-serif; */

.component {
    background-color: #fff;
}

h1.equipe-show {
    text-align: center;
    font-family: 'Bebas Neue', sans-serif;
    margin-bottom: 0px;
}

h2.equipe-show {
    text-align: center;
    font-family: 'Bebas Neue', sans-serif;
    color: rgb(38, 39, 136);
}

img.equipe-show {
    margin-left: 50%;
    transform: translateX(-50%);
    width: 280px;
    height: 280px;
}

p.equipe-show {
    margin-left: 50%;
    transform: translateX(-50%);
    background-color: rgb(39, 39, 39);
    width: 150px;
    text-align: center;
    color: white;
    font-family: 'Bebas Neue', sans-serif;
    font-size: 35px;
    letter-spacing: 2px;
    border-radius: 2px;
    padding-top: 2px;

}

div.show {
    width: 400px;
    display: flex;
    justify-content: center;
    flex-direction: column;
    align-items: center;
    margin-left: 50%;
    transform: translateX(-50%);



}

div.show img {
    border-radius: 50%;
}

div.show-equipe-joueur {
    margin-bottom: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 300px;
    margin-bottom: 10px;
    background-color: rgb(255, 255, 255);
    padding: 10px 18px;
    box-shadow: 0px 0px 6px black;
    border-radius: 7px;
}
</style>