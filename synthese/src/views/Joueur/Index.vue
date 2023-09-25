<template>
    <div class="component">
        <div>
            <div class="recherche-lien">

                <h1 class="liste-joueur">Liste des joueurs</h1>

                <!-- filtre barre de recherche -->
                <form @submit.prevent="">
                    <input type="text" v-model="rechercheParPrenom" placeholder="Rechercher par nom du joueur">
                </form>

            </div>

            <!-- liste joueur -->
            <JoueursListe :joueurs="filtrerJoueurs" />

            <router-link class="btn btn-primary" :to="{ name: 'joueurs.create' }">
                Ajouter un joueur!
            </router-link>
        </div>
    </div>
</template>
  
<script setup>
import JoueursListe from '@/components/Joueur/Liste.vue'
import axios from 'axios'
import { ref, onBeforeMount, computed } from 'vue'

const joueurs = ref([])
const rechercheParPrenom = ref('') // Champ de recherche par prénom

// const getJoueurImagePath = (nomImage) => {
//     return `/img/joueurs/${nomImage}`
// }

onBeforeMount(() => {
    axios('http://localhost:8000/api/joueurs').then(response => {
        joueurs.value = response.data
    })
})

const filtrerJoueurs = computed(() => {
    // Filtrer les joueurs en fonction de la recherche
    return joueurs.value.filter(joueur =>
        joueur.prenom.toLowerCase().includes(rechercheParPrenom.value.toLowerCase()) ||
        joueur.nom.toLowerCase().includes(rechercheParPrenom.value.toLowerCase())
    )
})
</script>
  
<style lang="scss">
/* font-family: 'Bebas Neue', sans-serif;
font-family: 'Montserrat', sans-serif;
font-family: 'Roboto', sans-serif; */


h1.liste-joueur {
    text-align: center;
    font-family: 'Bebas Neue', sans-serif;
    // margin-top: 25px;
    font-size: 50px;
}

div.recherche-lien {
    display: flex;
    justify-content: space-between;
    width: 933px;
    margin-left: 50%;
    transform: translateX(-50%);
    align-items: center;
    margin-top: 25px;
}

div.recherche-lien form input {
    width: 300px;
    height: 50px;
    border-radius: 4px;
    border: 0.5px solid rgba(0, 0, 0, 0.268);
    margin-top: 10px;
    margin-bottom: 20px;
    transition: 0.2s ease-in-out;
}

div.recherche-lien form input:hover {
    border-color: black;
}

div.recherche-lien form input::placeholder {
    font-family: 'Roboto', sans-serif;
    color: rgba(38, 38, 38, 0.292);
    padding-left: 3px;
}

a.btn.btn-primary {
    height: 40px;
    margin-left: 50%;
    transform: translateX(-50%);
    margin-top: 25px;

}

a.btn.btn-light {
    border: 1px solid rgba(0, 0, 0, 0.07);
    transition: 0.2s ease-in-out;
}

a.btn.btn-light:hover {
    color: white;
    background-color: blue;
}
</style>