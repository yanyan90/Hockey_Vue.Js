<template>
    <div>
        <vueper-slides autoplay>
            <vueper-slide v-for="(slide, i) in slides" :key="slide.id" :title="slide.title"
                :style="'background-image: url(' + slide.backgroundImage + ');'" />
            <template #pause>
                <i class="icon pause_circle_outline"></i>
            </template>
        </vueper-slides>
    </div>
</template>
  
<script setup>

import { VueperSlides, VueperSlide } from 'vueperslides'
import 'vueperslides/dist/vueperslides.css'
import { ref } from "vue"


const pauseOnHover = ref(true)
const autoPlaying = ref(true)
const internalAutoPlaying = ref(true)

const slides = ref([
    {
        id: 1,
        // title: '<b style="font-size:45px;color: white">LES JOUEURS ÉLITES</b>',
        backgroundImage: '../img/358598904_847374266806785_7312159955409602774_n.png',
    },
    {
        id: 2,
        title: '<b style="font-size: 45px;color: white; background-color: rgba(0, 0, 0, 0.600); padding-left:10px; padding-right:10px; border-radius:4px;">LES JEUNES PRODIGES</b>',
        backgroundImage: '../img/1-13-joueurs-dek-hockey-Autriche.jpg',
    },
    {
        id: 3,
        title: '<b style="font-size: 45px;color: white; background-color: rgba(0, 0, 0, 0.600); padding-left:10px; padding-right:10px; border-radius:4px;">LES ÉTOILES CANADIENNES</b>',
        backgroundImage: '../img/Capture-décran-le-2022-04-29-à-14.28.23.png'
    },

])
</script>

<style lang="scss"></style>