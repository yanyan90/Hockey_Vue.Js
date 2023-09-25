import { createRouter, createWebHistory } from 'vue-router'
import IndexView from '../views/Index.vue'
import EvenementsIndex from '../views/Evenement/Index.vue'
import EquipesIndex from '../views/Equipe/Index.vue'
import EquipesShow from '../views/Equipe/Show.vue'
import JoueursIndex from '../views/Joueur/Index.vue'
import JoueursShow from '../views/Joueur/Show.vue'
import JoueursEdit from '../views/Joueur/Edit.vue'
import JoueursCreate from '../views/Joueur/Create.vue'

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: '/',
            name: 'accueil',
            component: IndexView
        },
        {
            path: '/evenements',
            name: 'evenements.index',
            component: EvenementsIndex
        },
        // ***********************************equipe*********************************************
        {
            path: '/equipes',
            name: 'equipes.index',
            component: EquipesIndex
        },
        {
            path: '/equipes/:id',
            name: 'equipes.show',
            component: EquipesShow,
            props: true,
        },


        // ************************************joueurs********************************************
        {
            path: '/joueurs',
            name: 'joueurs.index',
            component: JoueursIndex
        },
        {
            path: '/joueurs/:id',
            name: 'joueurs.show',
            component: JoueursShow,
            props: true,
        },
        {
            path: '/joueurs/create',
            name: 'joueurs.create',
            component: JoueursCreate,

        },
        {
            path: '/joueurs/:id/edit',
            name: 'joueurs.edit',
            component: JoueursEdit,
            props: true,
        },
    ]
})

export default router
