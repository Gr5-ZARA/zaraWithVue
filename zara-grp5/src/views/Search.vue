<template>
    <div style="background-color: white">
      <input
        style="font-family: 'Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif; color: rgb(134, 134, 134); font-size: 15px; margin-top: 200px"
        class="searchbar"
        type="text"
        placeholder="Search for an item"
        v-model="search"
        @input="handleSearch"
      />
  
      <div v-for="result in filteredItems" :key="result.productId">
        <img :src="result.productimage" alt="image" style="width: 230px; height: 350px" />
        <div>Product Name: {{ result.productname }}</div>
        <div>Product Price: {{ result.productprice }}</div>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        search: '',
        results: [],
        filteredItems: [],
      };
    },
    methods: {
      handleSearch() {
        const filtered = this.results.filter((item) =>
          item.productname.toLowerCase().includes(this.search.toLowerCase())
        );
        this.filteredItems = filtered;
        console.log(this.filteredItems, 'this is data');
      },
      fetchData(searchTerm) {
        axios
          .get(`http://localhost:5000/api/products/`)
          .then((response) => {
            this.results = response.data;
            console.log(response.data);
            console.log('hi');
          })
          .catch((error) => {
            console.error(error);
          });
      },
    },
    watch: {
      search: {
        handler(value) {
          clearTimeout(this.searchTimer);
          this.searchTimer = setTimeout(() => {
            this.fetchData(value);
          }, 300);
        },
        immediate: true,
      },
    },
  };
  </script>
  
  <style scoped>
  /* Add your CSS styles here */
  </style>
  