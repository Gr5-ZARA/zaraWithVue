<template>
  <div>
    <div class="help">
      <h4 class="head">HOW CAN WE HELP YOU?</h4>
      <input
        type="text"
        v-model="searchText"
        class="searchbar"
        placeholder="Search"
        @input="handleSearchChange"
      />
      <ul v-if="searchResults.length > 0" class="dropdown">
        <li v-for="result in searchResults" :key="result.id" @click="handleResultClick(result)">
          {{ result.question }}
        </li>
      </ul>
      <div v-if="selectedQuestion">
        <h4 class="selected-question">{{ selectedQuestion.question }}</h4>
        <p class="answer">{{ selectedQuestion.answer }}</p>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import axios from 'axios';

interface Question {
  id: number;
  question: string;
}

interface SelectedQuestion {
  question: string;
  answer: string;
}

export default defineComponent({
  name: 'Help',
  setup() {
    const searchText = ref('');
    const searchResults = ref<Question[]>([]);
    const selectedQuestion = ref<SelectedQuestion | null>(null);

    const handleSearchChange = async () => {
      try {
        const response = await axios.get(`http://localhost:5000/api/help`, {
          params: {
            searchTerm: searchText.value
          }
        });
        searchResults.value = response.data;
      } catch (error) {
        console.error(error);
      }
    };

    const handleResultClick = async (result: Question) => {
      try {
        const response = await axios.get(`http://localhost:5000/api/help/${result.id}`);
        selectedQuestion.value = {
          question: result.question,
          answer: response.data.answer
        };
        searchResults.value = [];
      } catch (error) {
        console.error(error);
      }
    };

    return {
      searchText,
      searchResults,
      selectedQuestion,
      handleSearchChange,
      handleResultClick
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
  background-position: center;
  background-size: cover;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: flex-start;
  padding-top: 300px;
  padding-left: 20px; 
}

.head {
  margin-bottom: 20px;
  font-family: 'Neue Helvetica', Arial, sans-serif;
}

.searchbar {
  width: 40%;
  outline: none;
  border: none;
  border-bottom: 1px solid rgb(8, 8, 8);
  padding: 0.2em 0em;
  background: none;
  font-family: 'Neue Helvetica', Arial, sans-serif;
}

.dropdown {
  position: relative;
  margin-top: 10px;
  padding: 0;
  list-style: none;
  border: none;
  max-height: 200px;
  overflow-y: auto;
  z-index: 10;
}

.dropdown li {
  padding: 5px 10px;
  cursor: pointer;
  font-family: 'Neue Helvetica', Arial, sans-serif;
}

.dropdown li:hover {
  background-color: #f2f2f2;
}

.selected-question {
  margin-top: 20px;
  font-family: 'Neue Helvetica', Arial, sans-serif;
}

.answer {
  font-size: medium;
  margin-top: 10px;
  font-family: 'Neue Helvetica', Arial, sans-serif;
}
</style>
