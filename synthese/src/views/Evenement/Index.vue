<template>
    <div class="conteneur">

        <h1 class="evenement">Événements</h1>

        <!-- barre de recherche -->
        <form class="evenement" @submit.prevent="">
            <input class="evenement" type="text" v-model="rechercheParVille" placeholder="Rechercher par ville">
        </form>
    </div>

    <div class="component-liste-evenement">

        <table class="table table-striped table-light">
            <thead>
                <tr>
                    <th scope="col">Lieux de match</th>
                    <th scope="col">Date</th>
                    <th scope="col">heure</th>
                    <th scope="col">Équipe #1</th>
                    <th scope="col">Équipe #2</th>
                    <th scope="col">Logo</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="partie in filtrerEquipes" :key="partie.id">
                    <td>
                        <p class="evenement">{{ partie.ville }}</p>
                    </td>
                    <td>
                        <p class="evenement">{{ partie.date }}</p>
                    </td>
                    <td>
                        <p class="evenement">{{ partie.heure }}</p>
                    </td>
                    <td>
                        <p class="evenement">{{ findEquipeById(partie.equipe1_id).nom }}</p>
                    </td>
                    <td>
                        <p class="evenement">{{ findEquipeById(partie.equipe2_id).nom }}</p>
                    </td>
                    <td>
                        <div class="evenement">
                            <img class="evenement" :src="getEquipeImagePath(findEquipeById(partie.equipe1_id).image)"
                                width="50" height="50" alt="image equipe">
                            <strong> vs</strong>
                            <img class="evenement2" :src="getEquipeImagePath(findEquipeById(partie.equipe2_id).image)"
                                width="50" height="50" alt="image equipe">
                        </div>
                    </td>
                </tr>

            </tbody>
        </table>




    </div>
</template>
  
<script setup>
import { ref, onBeforeMount, computed } from 'vue'
import axios from 'axios'

const parties = ref([])
const equipes = ref([])
const rechercheParVille = ref('')

const getEquipeImagePath = (nomImage) => {
    return `/img/equipes/${nomImage}`
}

// afficher tout les infos de la table parties
onBeforeMount(async () => {
    await axios('http://localhost:8000/api/parties')
        .then(response => {
            parties.value = response.data
        })


    // recuperer info de table equipes
    await axios('http://localhost:8000/api/equipes')
        .then(response => {
            equipes.value = response.data
        })

})

// fonction qui recupere le ID de la bonne equipe associer a l'equipe_id1 et l'equipe_id2 dans la table parties
const findEquipeById = equipeId => {
    return equipes.value.find(equipe => equipe.id === equipeId)
}


// Filtrer les equipes en fonction de la recherche
const filtrerEquipes = computed(() => {
    return parties.value.filter(partie =>
        partie.ville.toLowerCase().includes(rechercheParVille.value.toLowerCase()) ||
        partie.heure.toLowerCase().includes(rechercheParVille.value.toLowerCase()) ||
        partie.date.toLowerCase().includes(rechercheParVille.value.toLowerCase())
    )
})
</script>
  
<style lang="scss">
/* font-family: 'Bebas Neue', sans-serif;
font-family: 'Montserrat', sans-serif;
font-family: 'Roboto', sans-serif; */

.component-liste-evenement {

    height: 500px;
    max-height: 500px;
    overflow-y: scroll;
    overflow-x: hidden;
    width: 933px;
    margin-left: 50%;
    transform: translateX(-50%);

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

p.evenement {
    margin-bottom: 0px;
    display: inline;
    vertical-align: -webkit-baseline-middle;
}


h1.evenement {

    font-family: 'Bebas Neue', sans-serif;
}

input.evenement {
    width: 300px;
    height: 50px;
    border-radius: 7px;
    border: 0.5px solid rgba(0, 0, 0, 0.192);
    margin-bottom: 15px;
}

input.evenement::placeholder {
    padding-left: 10px;
    font-family: 'Roboto', sans-serif;
    color: rgba(0, 0, 0, 0.249);
}

.evenement-conteneur {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 800px;
    background-color: rgb(170, 170, 170);
}

.evenement {
    display: flex;

    align-items: center;
}

.conteneur {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 915px;
    margin-left: 50%;
    margin-top: 30px;
    transform: translateX(-50%);

}

th:last-child {
    padding-left: 47px;
}

.evenement img.evenement {
    margin-right: 5px;
}

.evenement img.evenement2 {
    margin-left: 5px;
}
</style>