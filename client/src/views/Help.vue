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
  font-family: 'Neue Helvetica', Arial, sans-serif;
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
  font-family: 'Neue Helvetica', Arial, sans-serif;
}

.dropdown {
  position: absolute;
  margin-top: 2px;
  padding: 0;
  list-style: none;
  background-color: #fff;
  border: 1px solid #ccc;
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
  margin-right: 1000px;
  margin-top: 200px;
  font-family: 'Neue Helvetica', Arial, sans-serif;
}

.answer {
  margin-top: 0px;
  font-family: 'Neue Helvetica', Arial, sans-serif;
}
</style>
