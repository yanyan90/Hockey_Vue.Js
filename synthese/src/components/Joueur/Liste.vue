<template>
    <div class="conteneur-liste-joueur">
        <table class="table table-striped table-light">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Prénom</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Profil</th>
                    <th scope="col">Modifier</th>
                    <th scope="col">Supprimer</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="joueur in joueurs">

                    <td>
                        <router-link :to="{ name: 'joueurs.show', params: { id: joueur.id } }">
                            <p> {{ joueur.numero }}</p>
                        </router-link>
                    </td>
                    <td>
                        <router-link :to="{ name: 'joueurs.show', params: { id: joueur.id } }">
                            <p> {{ joueur.prenom }}</p>
                        </router-link>
                    </td>
                    <td>
                        <router-link :to="{ name: 'joueurs.show', params: { id: joueur.id } }">
                            <p>{{ joueur.nom }}</p>
                        </router-link>
                    </td>
                    <td>
                        <router-link :to="{ name: 'joueurs.show', params: { id: joueur.id } }">
                            <img :src="`/img/joueurs/${joueur.id}/512x512.webp`" width="75" height="75" alt="joueur hockey">
                        </router-link>
                    </td>
                    <td>
                        <router-link class="btn btn-light" :to="{ name: 'joueurs.edit', params: { id: joueur.id } }">
                            Modifier
                        </router-link>
                    </td>
                    <td>
                        <button class="btn btn-danger" @click="evt.click_delete(joueur.id)">Supprimer</button>
                    </td>
                </tr>

            </tbody>
        </table>

    </div>
</template>

<script setup>
import axios from 'axios'
import { useRouter } from 'vue-router'

const props = defineProps({
    "joueurs": {
        "type": Array,
        "default": () => []
    },
    // "getJoueurImagePath": {
    //     "type": Function,

    // },

})
const router = useRouter()

const evt = {

    "click_delete": (id) => {
        if (!confirm("suprimer")) return
        axios.delete('http://localhost:8000/api/joueurs/' + id).then(response => {
            router.go()
        })
    }
}

</script>
<style>
/* font-family: 'Bebas Neue', sans-serif;
font-family: 'Montserrat', sans-serif;
font-family: 'Roboto', sans-serif; */
.conteneur-liste-joueur {
    height: 500px;
    max-height: 500px;
    overflow-y: scroll;
    overflow-x: hidden;
    width: 950px;
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

.table {
    width: 1000px;
    margin-left: 50%;
    transform: translateX(-50%);


}

td:first-child {
    padding-left: 75px;
}

th:first-child {
    padding-left: 75px;
}

th:last-child {
    padding: 8px;
}

td p {
    color: rgb(38, 38, 38);
    font-family: 'Roboto', sans-serif;
    transition: 0.2s ease-in-out;
}

td p:hover {
    color: rgb(49, 67, 255);

}

td a {
    text-decoration: none;
}

td img {
    border-radius: 50%;
    width: 50px;
    height: 50px;
}
</style>