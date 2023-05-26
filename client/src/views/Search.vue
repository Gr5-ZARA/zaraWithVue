<template>
  <div style="background-color: white">
    <input
      style="font-family: 'Neue Helvetica', Helvetica, Arial, Lucida Grande, sans-serif; color: rgb(134, 134, 134); font-size: 15px; margin-top: 200px"
      class="searchbar"
      type="text"
      placeholder="Search for an item"
      v-model="search"
      @input="handleSearch"
    />

    <div v-if="filteredItems.length > 0">
      <div v-for="result in filteredItems" :key="result.productId">
        <img :src="result.productimage" alt="image" style="width: 230px; height: 350px" />
        <div>Product Name: {{ result.productname }}</div>
        <div>Product Price: {{ result.productprice }}</div>
      </div>
    </div>
    <div v-else-if="search !== ''">
      No results found.
    </div>
  </div>
</template>

<script lang="ts">
import axios from 'axios';

export default {
  data(): {
    search: string;
    results: any[];
    filteredItems: any[];
    searchTimer: ReturnType<typeof setTimeout> | null;
  } {
    return {
      search: '',
      results: [],
      filteredItems: [],
      searchTimer: null,
    };
  },
  methods: {
    handleSearch(): void {
      if (this.search === '') {
        this.filteredItems = [];
      } else {
        const filtered = this.results.filter((item: { productname: string }) =>
          item.productname.toLowerCase().includes(this.search.toLowerCase())
        );
        this.filteredItems = filtered;
      }
      console.log(this.filteredItems, 'this is data');
    },
    fetchData(searchTerm: string): void {
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
      handler(value: string): void {
        clearTimeout(this.searchTimer!);
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
  font-family: 'Neue Helvetica', Helvetica, Arial, Lucida Grande, sans-serif;
}

.searchbar::placeholder {
  color: rgb(30, 80, 95);
  margin-bottom: 20px;
}
</style>
