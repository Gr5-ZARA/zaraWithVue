<template>
    <div>
      <div v-if="products.length > 0">
        <div v-for="(product, index) in products" :key="index">
          <router-link :to="`/prod/${product.productname}`" style="margin-top: 200px; margin-left: 100px;">
            <img :src="product.productimage" style="margin-left: 420px; margin-top: 150px; width: 340px; height: 500px;" />
          </router-link>
          <div class="subdivproduct" style="margin-left: 520px; margin-top: 15px; font-family: 'Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif'; color: rgb(134, 134, 134); font-size: 15px;">
            <h6>{{ product.productname }}</h6>
            <h5 style="margin-left:100px">{{ product.productprice }}$</h5>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script lang="ts">
  import { ref, onMounted } from 'vue';
  // import router from '@/router';
  import axios from 'axios';

  
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
    name: 'OneProduct',
    setup() {
      var category = ref('');
      var products = ref<Product[]>([]);
      onMounted(async () => {
        // category.value=route.params.id
        category.value = window.location.pathname.split('/')[2];
        console.log(category.value, 'this is 1');
  
        if (category.value) {
          try {
            const response = await axios.get<Product[]>(`http://localhost:5000/api/products/all/sub/${category.value}`);
            products.value = response.data;
          } catch (error) {
            console.log(error);
          }
        }
      });
  
      return {
        category,
        products,
      };
    },
  };
  </script>
  
  <style scoped>
  .subdivproduct{
    display: flex;
    font-size: 70%;
    /* justify-content: space-between; */
    color: black;
    text-decoration: none;


}
.cart-price{
    text-decoration: none;
}

.render-data{
    display: grid;
    grid-template-columns:repeat(4,1fr);
    gap:14px;

    width: 100%;
    margin: auto;

}

.Main{
    width: 90vw;
    /* border: 1px solid blue; */
    margin: auto;
    margin-top: 2%;
}

.Product_image_tri{
    width: 100%;
}

  </style>