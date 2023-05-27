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
          <button @click="deleteCart" class="delete-button">Delete</button>
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
  methods: {
  deleteCart() {
    // Emit the custom 'delete' event and pass the product's orderid as the payload
    this.$emit('delete', this.product.orderid);
  },
},
};
</script>

<style>
.delete-button {
  margin-top: 10px;
}
/* Add your additional styles here */
</style>
