<template>
    <div>
      <div id="cartPage">
        <Cart/>
      </div>
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent } from 'vue';
  import Cart from './Cart.vue';
  
  export default defineComponent({
    name: 'CartPage',
    components: {
      Cart,
    },
  });
  </script>
  