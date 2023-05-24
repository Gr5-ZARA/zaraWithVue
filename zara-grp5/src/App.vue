<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
import Navbar from './views/Navbar.vue'
import type HomeViewVue from './views/HomeView.vue';

</script>

<template>
  <header>
    <Navbar/>
    <HomeViewVue />
   
  </header>

  <RouterView />
</template>

<style scoped>


</style>
