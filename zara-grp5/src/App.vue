<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
import Navbar from './views/Navbar.vue'
</script>

<template>
  <header>
    <Navbar/>
    <div class="wrapper">
      
      <nav>
        <RouterLink to="/">Home</RouterLink>
        
      </nav>
    </div>
  </header>

  <RouterView />
</template>

<style scoped>


</style>
