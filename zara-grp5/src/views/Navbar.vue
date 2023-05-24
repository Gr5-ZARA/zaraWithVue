
<template>
    <header style="
          width: '100%';
          padding: '12px 24px 20px 24px';
          position: 'fixed';
          margin: '0px';"
          
        >
      <div id="headerContents" >
        <div id="headerLeft" style="display: flex ;">
          <div>
            <input
              type="image"
              name="menu"
              src="https://icon-library.com/images/menu-icon-png-3-lines/menu-icon-png-3-lines-14.jpg"
              id="menu"
              style="width: 30px; height: 30px; margin-right: 30px ; "
              @click="toggleMenu"
            />
          </div>
          <RouterLink to="/">
            <img
              src="https://upload.wikimedia.org/wikipedia/commons/f/fd/Zara_Logo.svg"
              alt="Zara_Logo"
              id="logo"
              style=" width: 212px"
            />
          </RouterLink>
        </div>
        <div id="headerRight">
          <div id="headerRightLeft">
            
            <RouterLink
              to="/search"
              style="padding: 0% 60% 0% 0%; font-size: 13px; text-decoration: none; border-bottom: 1px solid black; color: rgb(41, 41, 41); font-weight: 700; font-family: Neue-Helvetica, Helvetica, Arial, Sans-Serif; font-stretch: ultra-condensed;"
            >
              <span class="menuLink">SEARCH</span>
            </RouterLink>
          </div>
          <div id="headerRightRight">
            <RouterLink
              to="/login"
              style="text-decoration: none; padding: 0px 10px 0px 10px; font-size: 13px; color: rgb(41, 41, 41); font-weight: 100; font-family: Neue-Helvetica, Helvetica, Arial, Sans-Serif; font-stretch: ultra-condensed;"
            >
              <span class="menuLink">LOG IN</span>
            </RouterLink>
  
            <RouterLink
              to="/help"
              style="text-decoration: none; padding: 0px 10px 0px 10px; font-size: 13px; color: rgb(41, 41, 41); font-weight: 100; font-family: Neue-Helvetica, Helvetica, Arial, Sans-Serif; font-stretch: ultra-condensed;"
            >
              <span class="menuLink">HELP</span>
            </RouterLink>
  
            <RouterLink
              to="/cart"
              style="text-decoration: none; padding: 0px 10px; font-size: 13px; color: rgb(41, 41, 41); font-weight: 100; font-family: Neue-Helvetica, Helvetica, Arial, Sans-Serif; font-stretch: ultra-condensed;"
            >
              <img
                style= "width: 22px; height: 19px;"
                src="https://cdn-icons-png.flaticon.com/512/3110/3110065.png"
                alt="Cart"
              />
            </RouterLink>
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
<HomeView/>
<script lang="ts">
import { RouterLink, RouterView } from 'vue-router'
import { defineComponent, ref } from 'vue';
import Woman from './Woman.vue';
import Men from './Men.vue';
import Kid from './Kid.vue';
import Beauty from './Beauty.vue';
import HomeView from './HomeView.vue';

export default defineComponent({
  name: 'Header',
  components: {
    Woman,
    Men,
    Kid,
    Beauty,
    HomeView
    
},
    setup() {
      const isMenuOpen = ref(false);
      const display = ref('');
      
      const toggleMenu = () => {
        isMenuOpen.value = !isMenuOpen.value;
      };
      
      const handleShow = (option:any  ) => {
        display.value = option;
      };
      
      return {
        isMenuOpen,
        display,
        toggleMenu,
        handleShow
      };
    }
});
</script>

<style scoped>

/* Header container */
#headerContents {
  
  display: flex;
  justify-content: space-between;
  width: 100%;
  position: fixed;
}

/* Logo */
#logo {
  margin-left: 80px;
  width: 212px;
}

/* Menu icon */
/* #menu {
  
  width: 30px;
  height: 30px;
  margin-right: 30px;
  cursor: pointer;
} */

/* Header right section */
#headerRight {
  width: 30%;
  display: flex;
  margin-right: 30px;
  padding: 10px;
  justify-content: space-between;
}

/* Header right links */

 #headerRightRight {
  display: flex;
}  

/* Header right link */
.menuLink {
 
  text-decoration: none;
  padding: 0px 10px;
  font-size: 13px;
  color: rgb(41, 41, 41);
  font-weight: 100;
  font-family: 'Neue-Helvetica', Helvetica, Arial, Sans-Serif;
  font-stretch: ultra-condensed;
}

/* Cart icon */
#cartIcon {
  width: 22px;
  height: 19px;
}

/* Menu modal */
/* #menuModal {
  position: fixed;
  overflow: hidden;
  background-color: rgba(0, 0, 0, 0.5);
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
} */

/* Menu content */
/* .menuContent {
  position: relative;
  background-color: white;
  width: 470px;
  padding: 20px;
} */

/* Close button */
.close {
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 21px;
  color: grey;
  cursor: pointer;
}

/* Menu options */
/* #menuOptions {
  position: relative;
  overflow: hidden;
  height: 4000px;
  width: 470px;
  background-color: white;
  margin-top: -30px;
  margin-left: -20px;
} */

/* Menu options list */
/* .menuOptionsList {
  display: flex;
  flex-direction: column;
  margin-top: 90px;
  margin-bottom: 25px;
} */

/* Menu option */ 
/* .menuOption {
  margin-left: -10px;
  margin-top: -40px;
  font-family: Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif;
  color: grey;
  font-size: 11px;
  cursor: pointer;
}

/* Active menu option */
/* .menuOption.active {
  color: black;
} */

/* Extra options */
/* #menuExtraOptions ul {
  list-style: none;
  margin: 0;
  padding: 0;
} */

/* Extra options list item */
/* #menuExtraOptions ul li {
  margin-top: 10px;
} */
.menuOption {
    text-decoration: none !important;
    cursor: default !important;
     color: grey; 
    font-size: x-small;
  }
</style>