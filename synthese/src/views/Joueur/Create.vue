<template>
    <div class="component">

        <h1 class="create-joueur">Ajouter un joueur!</h1>

        <!-- formulaire de creation d'un joueur -->
        <JoueursCreate :joueur="joueur" @submit="evt.submit" :texte="ajouter" />

        <router-link :to="{ name: 'joueurs.index' }" class="retour-create btn btn-primary">
            Liste des joueurs
        </router-link>
    </div>
</template>

<script setup>
import JoueursCreate from '@/components/Joueur/Form.vue'
import { onBeforeMount, ref } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'


const ajouter = ref("Ajouter")
const router = useRouter()

const joueur = ref({
    "prenom": "",
    "nom": "",
    "numero": "",
    "position": "",
    "equipe_id": "",
})

const evt = {

    submit: (formData) => {

        axios.post(`http://localhost:8000/api/joueurs`, formData).then((res) => {

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

h1.create-joueur {
    text-align: center;
    font-family: 'Bebas Neue', sans-serif;
    margin-top: 30px;
    margin-bottom: 30px;
    font-size: 48px;
}
</style>