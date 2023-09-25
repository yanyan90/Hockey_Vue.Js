<template>
    <div class="component">
        <h1 class="edit">Modification de <span class="blue-text">{{ joueur.prenom }}</span> <span class="blue-text">{{
            joueur.nom }}</span></h1>

        <!-- formulaire joueur -->
        <JoueurForm v-if="joueur" :joueur="joueur" @submit="evt.submit" :texte="modifier" />

        <router-link :to="{ name: 'joueurs.index' }" class="retour btn btn-primary">Retour au
            joueurs</router-link>
    </div>
</template>

<script setup>
import { onBeforeMount, ref } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'
import JoueurForm from '@/components/Joueur/Form.vue'

const router = useRouter()

const props = defineProps({
    id: {
        type: [Number, String],
        required: true,
    },
})

const modifier = ref("Modifier")
const joueur = ref("")

// recupere un joueur avec son id
axios.get('http://localhost:8000/api/joueurs/' + props.id)
    .then(response => {
        console.log(response.data)
        joueur.value = response.data
    })
    .catch(error => {
        console.log(error)
    })


const evt = {
    // evenement qui soummet le formulaire a la bdd et soummet la photo du joueur dans son dossier
    submit: (formData) => {
        console.log("edit")
        axios.post(`http://localhost:8000/api/joueurs/${joueur.value.id}`, formData).then((res) => {
            router.push({ name: 'joueurs.index' })

        }).catch(error => {
            console.log(error)
        })
    },
}
</script>

<style lang="scss">
/* font-family: 'Bebas Neue', sans-serif;
font-family: 'Montserrat', sans-serif;
font-family: 'Roboto', sans-serif; */
h1.edit {
    text-align: center;
    font-family: 'Bebas Neue', sans-serif;
    margin-top: 30px;
    margin-bottom: 30px;
}

.blue-text {
    font-size: 48px;
    color: rgb(114, 114, 255);
}
</style>