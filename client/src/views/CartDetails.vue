<template>
  <div>
    <div>
      <div>
        <img :src="product.productimage" style="width: 230px; height: 350px; margin-top: 150px" />
      </div>
      <div>
        <h3>{{ product.productname }}</h3>
        <h3>{{ product.productprice }}</h3>
        <h3>{{ product.productcolor }}</h3>
      </div>
      <div class="sm-col sm-col-6">
        <div class="details p2">
          <a class="blue text-decoration-none" href="#!"></a>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
export default {
  props: {
    product: {
      type: Object,
      required: true,
    },
  },
};
</script>

<style>
/* Add your styles here */
</style>
