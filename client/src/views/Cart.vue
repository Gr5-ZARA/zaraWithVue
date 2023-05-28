<template>
  <div class="cart-container">
   
    <CartDetail
  v-for="product in products"
  :key="product.orderid"
  :product="product"
  @delete="deleteCartItem"
  :delete-cart-item="deleteCartItem"
/>
  </div>
</template>

<script lang="ts">
import axios from 'axios';
import CartDetail from './CartDetails.vue';

export default {
  data() {
    return {
      products: [],
      orderId: 0,
    };
  },
  created() {
    const storedData = window.localStorage.getItem('User');
    console.log(storedData)
    if (storedData) {
      const parsedData = JSON.parse(storedData);
      const username = parsedData.user?.[0].username;
      axios
        .get(`http://localhost:5000/api/user/one/${username}`)
        .then((res) => {
          console.log(res.data)
          this.orderId = res.data[0].orderid;
          this.fetchData(this.orderId);
        })
        .catch((err) => {
          console.log(err);
        });
    }
  },
  methods: {
  fetchData(orderId: any) {
    axios
      .get(`http://localhost:5000/api/products/${orderId}`)
      .then((res) => {
        this.products = res.data;
      })
      .catch((err) => {
        console.log(err);
      });
  },
 
  deleteCartItem(orderId:any) {
    // Make a DELETE request to the backend API to delete the cart item
    axios
      .delete(`http://localhost:5000/api/orders/${orderId}`)
      .then(() => {
        // Fetch the updated data after deletion
        this.fetchData(this.orderId);
      })
      .catch((err) => {
        console.log(err);
      });
  },
},
  components: {
    CartDetail,
  },
  

};
</script>

<style>
.cart-container {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 20px; 
}
</style>


  
 
  

  