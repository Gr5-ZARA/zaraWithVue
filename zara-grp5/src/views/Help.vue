<template>
    <div>
      <div class="help">
        <h4 class="head">HOW CAN WE HELP YOU?</h4>
        <input
          type="text"
          v-model="searchText"
          class="searchbar"
          placeholder="look for"
          @input="handleSearchChange"
        />
      </div>
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent, ref } from 'vue';
  
  export default defineComponent({
    name: 'Help',
    setup() {
      const searchText = ref('');
  
      const handleSearchChange = (event: InputEvent) => {
        searchText.value = (event.target as HTMLInputElement).value;
      };
  
      return {
        searchText,
        handleSearchChange,
      };
    },
  });
  </script>
  
  <style scoped>
  .help {
    display: flex;
    justify-content: center;
    align-items: center;
    background-image: url('https://static.zara.net/photos///contents/mkt/spots/ss23-help-customer/subhome-xmedia-10-north//w/1839/IMAGE-landscape-web-27470945-8c31-433a-9eaf-392114b6a91d-default_0.jpg?ts=1682518360676');
    background-repeat: no-repeat;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin-top: 10px;
  }
  
  .head {
    margin-right: 1000px;
    margin-top: -120px;
  }
  
  .searchbar {
    margin-top: 1.6em;
    width: 40%;
    outline: none;
    border: none;
    border-bottom: 1px solid rgb(8, 8, 8);
    padding: 0.2em 0em;
    margin-left: -650px;
    background: none;
  }
  </style>
  