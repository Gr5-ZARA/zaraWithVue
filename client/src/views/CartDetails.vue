<template>
    <div class="cart-detail">
      <img :src="e.productimage" style="width: 230px; height: 350px; margin-top: 150px;" />
      <div class="product-info">
        <h3>{{ e.productname }}</h3>
        <h3>{{ e.productprice }}</h3>
        <h3>{{ e.productcolor }}</h3>
      </div>
      <div class="details p2">
        <a class="blue text-decoration-none" href="#!"></a>
      </div>
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent, PropType } from 'vue';
  
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
  
  export default defineComponent({
    name: 'CartDetail',
    props: {
      e: {
        type: Object as PropType<Product>,
        required: true,
      },
    },
  });
  </script>
  