<template>
    <div class="conteneur-liste-equipe">
        <div class="contenue-liste" v-for="equipe in equipes">

            <div class="liste-equipe-liste">
                <router-link :to="{ name: 'equipes.show', params: { id: equipe.id } }">
                    <p class="equipe-nom">{{ equipe.nom }}</p>
                </router-link>
                <router-link :to="{ name: 'equipes.show', params: { id: equipe.id } }">
                    <img class="img-liste" :src="getEquipeImagePath(equipe.image)" width="75" height="75" alt="Logo equipe">
                </router-link>
            </div>

        </div>
    </div>
</template>

<script setup>

import { useRouter } from 'vue-router'

const props = defineProps({
    "equipes": {
        "type": Array,
        "default": () => []
    },
    "getEquipeImagePath": {
        "type": Function,

    },

})
const router = useRouter()



</script>

<style>
/* font-family: 'Bebas Neue', sans-serif;
font-family: 'Montserrat', sans-serif;
font-family: 'Roboto', sans-serif; */

p.equipe-nom {

    color: rgb(39, 39, 39);
    font-family: 'Roboto', sans-serif;
    font-size: 22px;
    margin-bottom: 0px;
    font-weight: 500;

}

p.equipe-nom:hover {

    color: rgb(60, 43, 188);


}

.liste-equipe-liste a {
    text-decoration: none;
    display: flex;
    align-items: center;
    text-transform: uppercase;
    padding-right: 15px;
    padding-left: 15px;

}

.liste-equipe-liste {
    display: flex;
    justify-content: space-between;
    width: 650px;
    margin-bottom: 5px;

    background-color: rgb(255, 255, 255);
    height: 93px;
    align-items: center;
    border-radius: 7px;
    box-shadow: 0px 0px 5px black;

}

.liste-equipe-liste:first-child {
    margin-top: 20px;
}

img.img-liste {
    border-radius: 4px;
}
</style>