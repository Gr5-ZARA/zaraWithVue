<template>
    <div>
      <h2 v-for="product in data" :key="product.productid" @click="refrechPage">
        <router-link :to="`/products/${product['productsub-sub-category']}`">
          {{ product['productsub-sub-category'] }}
        </router-link>
      </h2>
    </div>
  </template>
  
  <script lang="ts">
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
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
  
  export default {
    name: 'Woman',
    methods:{
      refrechPage(){
      location.reload()
    }
    },
    setup() {
      const data = ref<Product[]>([]);
      const fetchData = () => {
        axios
          .get<Product[]>(`http://localhost:5000/api/products/all/subsub/OVERSIZE`)
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
      };
    },
  };
  </script>
   