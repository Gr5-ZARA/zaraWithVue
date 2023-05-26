<template>
  <div>
    <h2 v-for="product in data" :key="product.productid" @click="refrechPage">
      <router-link :to="`/products/${product['productsub-category']}`">
        {{ product['productsub-category'] }}
      </router-link>
    </h2>
    <div
                class="menuOption"
                v-if="display === 'OVERSAZE'"
                style="text-decoration: none; cursor: default;"
              >
              <Subwoman/>
            </div>
  </div>
</template>

<script lang="ts">
import { ref, onMounted, defineComponent } from 'vue';
import axios from 'axios';
import Subwoman from './Subwoman.vue';
import { RouterLink, RouterView, loadRouteLocation } from 'vue-router' 
interface Product {
  productid: number;
  productname: string;
  productprice: number;
  productquantity: number;
  productcolor: string;
  productcategory: string;
  'productsub-category': string;
  'productsub-sub-category': string;
  productimage: string;
}

export default defineComponent ({
  name: 'Subwoman',
  component:{Subwoman},
  
  methods:{
    refrechPage(){
    location.reload()
  }
  },
  setup() {
    const isMenuOpen = ref(false);
      const display = ref('');
      
      
      
      
    const data = ref<Product[]>([]);
    const fetchData = () => {
      axios
        .get<Product[]>(`http://localhost:5000/api/products/all/Woman`)
        .then((res) => {
          data.value = res.data;
          console.log(res.data, 'product');
        })
        .catch((err) => {
          console.log(err);
        });
    };

    onMounted(() => {
      fetchData();
    });
    console.log(data)
    return {
      data,
      isMenuOpen,
        display,
    };
   
  },
 
})
</script>
  