<template>
    <form @submit.prevent="evt.submit">

        <div>

            <span><input class="edit" type="text" id="nom" name="prenom" placeholder="Prénom"
                    v-model="joueur.prenom"></span>
        </div>

        <div>

            <span><input class="edit" type="text" id="nom_en" name="nom" placeholder="Nom" v-model="joueur.nom"></span>
        </div>

        <div>

            <span><input class="edit" type="number" id="numero" name="numero" placeholder="Numéro"
                    v-model="joueur.numero"></span>
        </div>


        <div>

            <span><input class="edit" type="text" id="position" name="position" placeholder="Position"
                    v-model="joueur.position"></span>
        </div>
        <div>

            <span><input class="edit" type="number" id="but" name="but" placeholder="But" v-model="joueur.but"></span>
        </div>
        <div>

            <span><input class="edit" type="number" id="passe" name="passe" placeholder="Passe"
                    v-model="joueur.passe"></span>
        </div>


        <div>
            <label class="label" for="equipe">Équipe</label>
            <select class="form-select" aria-label="Default select example" id="equipe" name="equipe_id"
                v-model="joueur.equipe_id">

                <option selected v-for="equipe in equipes" :key="equipe.id" :value="equipe.id">
                    {{ equipe.nom }}
                </option>

            </select>
        </div><br>

        <div>
            <span><input class=" form-control" type="file" id="image" name="image"></span>
        </div>

        <div>
            <slot><button class="submit-create btn btn-light" type="submit">{{ texte }}</button></slot>
        </div>

    </form>
</template>

<script setup>

import { defineProps, defineEmits, ref, computed, onMounted } from 'vue'
import axios from 'axios'


const props = defineProps({
    joueur: {
        type: Object,
        default: () => ({})
    },
    texte: {
        type: String,

    },
})

const emit = defineEmits(['submit'])


const evt = {
    submit: () => {
        emit('submit', new FormData(document.forms[0]))
    }
}

const joueur = ref(props.joueur)
const equipes = ref([])

onMounted(() => {
    axios.get('http://localhost:8000/api/equipes').then(response => {
        equipes.value = response.data

    })
})


</script>

<style lang="scss">
/* font-family: 'Bebas Neue', sans-serif;
font-family: 'Montserrat', sans-serif;
font-family: 'Roboto', sans-serif; */
input.edit {
    width: 300px;
    height: 50px;
    margin-bottom: 10px;
    border-radius: 7px;
    border: 0.5px solid rgba(0, 0, 0, 0.24);
    font-family: 'Roboto', sans-serif;
    padding-left: 10px;
    color: rgb(0, 0, 0);
}


form {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

button.submit-create {
    width: 300px;
    height: 50px;
    transition: 0.2s ease-in-out;
    border: 0.5px solid rgba(0, 0, 0, 0.126);
}

button.submit-create:hover {
    background-color: blue;
    color: white;
}

label.label {
    margin-left: 50%;
    transform: translateX(-50%);
    font-family: 'Roboto', sans-serif;
}

input.form-control {
    margin-bottom: 15px;
    width: 300px;
}
</style>