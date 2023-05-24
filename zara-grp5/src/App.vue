<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
import Navbar from './views/Navbar.vue'
import HomeView from './views/HomeView.vue';
</script>

<template>
  <header>
    <Navbar/>
   
  </header>

  <RouterView />
</template>

<style scoped>


</style>
