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
        <tbody>
          <tr v-for="product in products" :key="product.productid">
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
              <button class="edit-button" @click="editProduct(product)">
                Edit
              </button>
              <button class="delete-button" @click="deleteProduct(product)">
                Delete
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>
  
  <script>
  import axios from "axios";
  
  export default {
    data() {
      return {
        products: [],
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
      editProduct(product) {
        console.log("Editing product:", product);
      },
      deleteProduct(product) {
        console.log("Deleting product:", product);
      },
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
  