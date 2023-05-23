
<template>
    <header>
      <div id="headerContents">
        <div id="headerLeft">
          <div>
            <input
              type="image"
              name="menu"
              src="https://icon-library.com/images/menu-icon-png-3-lines/menu-icon-png-3-lines-14.jpg"
              id="menu"
              style="width: 30px; height: 30px; margin-right: 30px"
              @click="toggleMenu"
            />
          </div>
          <router-link to="/">
            <img
              src="https://upload.wikimedia.org/wikipedia/commons/f/fd/Zara_Logo.svg"
              alt="Zara_Logo"
              id="logo"
              style="width: 212px"
            />
          </router-link>
        </div>
        <div id="headerRight">
          <div id="headerRightLeft">
            <router-link
              to="/search"
              style="padding: 0% 60% 0% 0%; font-size: 13px; text-decoration: none; border-bottom: 1px solid black; color: rgb(41, 41, 41); font-weight: 700; font-family: Neue-Helvetica, Helvetica, Arial, Sans-Serif; font-stretch: ultra-condensed;"
            >
              <span class="menuLink">SEARCH</span>
            </router-link>
          </div>
          <div id="headerRightRight">
            <router-link
              to="/login"
              style="text-decoration: none; padding: 0px 10px 0px 10px; font-size: 13px; color: rgb(41, 41, 41); font-weight: 100; font-family: Neue-Helvetica, Helvetica, Arial, Sans-Serif; font-stretch: ultra-condensed;"
            >
              <span class="menuLink">LOG IN</span>
            </router-link>
  
            <router-link
              to="/help"
              style="text-decoration: none; padding: 0px 10px 0px 10px; font-size: 13px; color: rgb(41, 41, 41); font-weight: 100; font-family: Neue-Helvetica, Helvetica, Arial, Sans-Serif; font-stretch: ultra-condensed;"
            >
              <span class="menuLink">HELP</span>
            </router-link>
  
            <router-link
              to="/cart"
              style="text-decoration: none; padding: 0px 10px; font-size: 13px; color: rgb(41, 41, 41); font-weight: 100; font-family: Neue-Helvetica, Helvetica, Arial, Sans-Serif; font-stretch: ultra-condensed;"
            >
              <img
                style="width: 22px; height: 19px;"
                src="https://cdn-icons-png.flaticon.com/512/3110/3110065.png"
                alt="Cart"
              />
            </router-link>
          </div>
        </div>
      </div>
      <div v-if="isMenuOpen" id="menuModal" class="menuOpacity animatedMenuShow">
        <div class="menuContent">
          <header id="headerRight" style="width: 1000%; display: flex; margin-right: 30px; padding: 10px; justify-content: space-between;">
            <div id="menuTop"></div>
          </header>
          <div
          id="menuOptions"
          style="position: fixed; overflow: hidden; height: 4000px; width: 470px; background-color: white; margin-top: -30px; margin-left: -20px;"
        >
          <div id="menuMainOptions" style="display: flex;">
            <ul class="menuOptionsList">
              <ul class="close" @click="toggleMenu" style="margin-right: 100px; margin-left: -41px; font-size: 21px; color: grey;">
                ✕
              </ul>

              <div style="margin-top: 90px; display: flex; flex-wrap: wrap; margin-bottom: 25px;">
                <p class="menuOption" style="margin-left: -10px; margin-top: -40px; font-family: Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif; color: grey; font-size: 11px; cursor: pointer;" @click="handleShow('woman')">
                  WOMAN
                </p>
                <p class="menuOption" style="margin-right: 20px; margin-top: -40px; margin-left: 25px; font-family: Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif; color: rgb(134, 134, 134); font-size: 11px; cursor: pointer;" @click="handleShow('men')">
                  MEN
                </p>
                <p class="menuOption" style="margin-right: 20px; margin-top: -40px; font-family: Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif; color: rgb(134, 134, 134); font-size: 11px; cursor: pointer;" @click="handleShow('kid')">
                  CHILDREN
                </p>
                <p class="menuOption" style="margin-right: 10px; margin-top: -40px; font-family: Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif; color: rgb(134, 134, 134); font-size: 11px; cursor: pointer;" @click="handleShow('beauty')">
                  BEAUTY
                </p>
              </div>
              <li class="menuOption" style="margin-top: -20px; font-size: 20px;">NEW</li>
              <div class="menuOption" v-if="display === 'men'">
                <Men />
              </div>
              <div class="menuOption" v-if="display === 'woman'">
                <Woman />
              </div>
              <div class="menuOption" v-if="display === 'kid'">
                <Kid />
              </div>
              <div class="menuOption" v-if="display === 'beauty'" style="text-decoration: none; cursor: default;">
                <Beauty />
              </div>
              <div id="menuExtraOptions">
                <ul>
                  <li>JOIN LIFE</li>
                  <li>+ INFO</li>
                </ul>
              </div>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </header>
</template>
<script lang="ts">
// import { defineComponent, ref } from 'vue';


// export default defineComponent({
//   name: 'Header',
//   components: {
//       Woman,
//       Men,
//       Kid,
//       Beauty
//     },
//     setup() {
//       const isMenuOpen = ref(false);
//       const display = ref('');
      
//       const toggleMenu = () => {
//         isMenuOpen.value = !isMenuOpen.value;
//       };
      
//       const handleShow = (option) => {
//         display.value = option;
//       };
      
//       return {
//         isMenuOpen,
//         display,
//         toggleMenu,
//         handleShow
//       };
//     }
// });
</script>

<style scoped>
/* Add your CSS styles here */
</style>