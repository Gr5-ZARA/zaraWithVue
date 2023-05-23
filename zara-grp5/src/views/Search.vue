<template>
    <div style="background-color: white">
      <input
        class="searchbar"
        type="text"
        placeholder="Search for an item"
        v-model="search"
        @input="handleSearch"
      />
  
      <div v-if="searchedItem">
        <img :src="searchedItem.productimage" alt="image" style="width: 230px; height: 350px" />
        <div>Product Name: {{ searchedItem.productname }}</div>
        <div>Product Price: {{ searchedItem.productprice }}</div>
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
        searchedItem: null,
      };
    },
    methods: {
      handleSearch() {
        const filtered = this.results.find((item) =>
          item.productname.toLowerCase().includes(this.search.toLowerCase())
        );
        this.searchedItem = filtered;
        console.log(this.searchedItem, 'this is data');
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
  .searchbar {
    margin-top: 1.6em;
    width: 98%;
    outline: none;
    border: none;
    border-bottom: 1px solid rgb(8, 8, 8);
    padding: 0.2em 0em;
  }
  
  .searchbar::placeholder {
    color: rgb(30, 80, 95);
    margin-bottom: 20px;
  }
  </style>
  