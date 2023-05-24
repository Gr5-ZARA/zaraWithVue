<template>
    <div>
      <h2 v-for="product in data" :key="product.productid">
        <RouterLink :to="`/products/${product['productsub-category']}`">
          {{ product['productsub-category'] }}
        </RouterLink>
      </h2>
    </div>
  </template>
  
  <script lang="ts">
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  import { RouterLink, RouterView } from 'vue-router' 
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
    name: 'Men',
    setup() {
      const data = ref<Product[]>([]);
  
      const fetchData = () => {
        axios
          .get<Product[]>(`http://localhost:5000/api/products/all/Men`)
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