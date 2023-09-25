<script setup>
import { RouterView } from 'vue-router'
import MainNav from './components/Nav.vue'
</script>

<template>
    <header>
        <main-nav />
    </header>
    <RouterView />

    <!-- Footer -->
    <footer>

        <div class="logo-footer">
            <img src="../public/img/pngegg.png" width="150" height="150" alt="">
        </div>
        <div class="nav">
            <router-link class="lien-nav" :to="{ name: 'accueil' }">Accueil</router-link>
            <router-link class="lien-nav" :to="{ name: 'evenements.index' }">Évenements</router-link>
            <router-link class="lien-nav" :to="{ name: 'equipes.index' }">Équipes</router-link>
            <router-link class="lien-nav" :to="{ name: 'joueurs.index' }">Joueurs</router-link>
        </div>
        <p class="adresse">coordonnées de la Fédération</p>
        <address class="adresse"> 29 QC-125, Saint-Esprit, QC J0K 2L0</address>
        <p class="adresse">(819) 442-3603</p>
        <div class="reseau">
            <a class="reseau-sociaux" href="https://www.facebook.com/"><img src="../public/img/facebook.png" width="50"
                    height="50" alt=""></a>
            <a class="reseau-sociaux" href="https://www.instagram.com/"><img src="../public/img/instagram.png" width="50"
                    height="50" alt=""></a>
            <a class="reseau-sociaux" href="https://twitter.com/"><img src="../public/img/twitter.png" width="50"
                    height="50" alt=""></a>
        </div>
        <p class="copyright">&copy; Le pied de page</p>

    </footer>
</template>

<style>
/* $dsn = 'mysql://root@127.0.0.1:3306/hockey/'; */
footer {
    background-color: black;
    margin-top: 80px;
    height: 350px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    flex-direction: column;
    position: relative;
}

.logo-footer img {
    background-color: white;
    margin-bottom: 20px;
}

.copyright {
    color: rgb(144, 144, 144);
    margin-top: 12px;
}

.adresse {
    line-height: 2px;
    color: rgb(144, 144, 144);
}

.nav {
    margin-bottom: 10px;

}

.reseau {
    display: flex;
    justify-content: space-around;

}

a.reseau-sociaux {
    margin-right: 10px;
}

a.reseau-sociaux:first-child {
    margin-left: 10px;
}

a.reseau-sociaux img {
    width: 20px;
    height: 20px;

}
</style>
