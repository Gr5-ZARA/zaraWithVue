<template>
    <div class="admin-dashboard">
      <h1>Admin Dashboard</h1>
      <table class="product-table">
        <thead>
          <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Product Price</th>
            <th>Product Quantity</th>
            <th>Product Color</th>
            <th>Product Category</th>
            <th>Product Sub-category</th>
            <th>Product Sub-sub-category</th>
            <th>Product Image</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody v-for="product in products" :key="product.productid">
          <tr >
            <td>{{ product.productid }}</td>
            <td>{{ product.productname }}</td>
            <td>{{ product.productprice }} TND</td>
            <td>{{ product.productquantity }}</td>
            <td>{{ product.productcolor }}</td>
            <td>{{ product.productcategory }}</td>
            <td>{{ product['productsub-category'] }}</td>
            <td>{{ product['productsub-sub-category'] }}</td>
            <td>
              <img
                :src="product.productimage"
                alt="Product Image"
                class="product-image"
              />
            </td>
            <td>
              <button class="edit-button" @click="handleShow">
                Edit
              </button>
              <button class="delete-button" @click="deleteProduct(product.productid)">
                Delete
              </button>
            </td>
          </tr>
          <tr v-if="show">
            <td>{{ product.productid }}</td>
            <td><input type="text" v-model="product.productname" ></td>
            <td><input type="number" v-model="product.productprice"></td>
            <td><input type="number" v-model="product.productquantity"></td>
            <td><input type="text" v-model="product.productcolor"></td>
            <td><input type="text" v-model="product.productcategory"></td>
            <td>{{ product['productsub-category'] }}</td>
            <td>{{ product['productsub-sub-category'] }}</td>
            <td><input type="text" v-model="product.productimage"></td>
            <td><button @click="editProduct(product.productid,product)">update</button></td>
            </tr>
        </tbody>
      </table>
    </div>
  </template>
  
  <script lang="ts">
  import axios from "axios";
  interface Product {
  productid:number;
  productname: string;
  productprice: number;
  productquantity: number;
  productcolor: string;
  productcategory: string;
  'productsub-category': string;
  'productsub-sub-category': string;
  productimage: string;
  orderid: number;
}
  export default {
    
    data() {
      return {
        products: [],
        show:false,
        productname:'',
        productprice:'',
        productquantity:'',
        productcategory:'',
        productimage:'',
        productcolor:''
      };
    },
    mounted() {
      this.fetchProducts();
    },
    methods: {
      fetchProducts() {
        axios
          .get("http://localhost:5000/api/products")
          .then((response) => {
            this.products = response.data;
          })
          .catch((error) => {
            console.error(error);
          });
      },
      async editProduct(id:number,productUpdated:Object) {
        
        await axios.put(`http://localhost:5000/api/products/${id}`,productUpdated);
        location.reload()
      },
      async deleteProduct(id:number) {
        await axios.delete(`http://localhost:5000/api/products/${id}`)
        location.reload()
      },
      handleShow(){
        this.show=!this.show
      }
    },
  };
  </script>
  
  <style scoped>
  .admin-dashboard {
    padding: 20px;
    margin-top: 200px;
    font-family: "Neue Helvetica", Arial, sans-serif;
  }
  
  .product-table {
    width: 100%;
    border-collapse: collapse;
  }
  
  .product-table th,
  .product-table td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
  }
  
  .product-table th:last-child,
  .product-table td:last-child {
    border-right: none;
  }
  
  .product-image {
    width: 50px;
    height: 50px;
    object-fit: cover;
  }
  
  .edit-button,
  .delete-button {
    padding: 5px 10px;
    margin-right: 5px;
    border: none;
    background-color: #4caf50;
    color: #fff;
    cursor: pointer;
  }
  
  .delete-button {
    background-color: #f44336;
  }
  </style>
  