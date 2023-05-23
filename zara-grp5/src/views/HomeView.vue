<template>
  <div class="slideshow-container">
    <transition-group name="slide" tag="div">
      <img
        :key="activeIndex"
        :src="imagePaths[activeIndex]"
        :alt="`Slide ${activeIndex + 1}`"
        style="height: 100%; width: 100%"
      />
    </transition-group>
  </div>
</template>

<script lang="ts">
import { ref, onMounted } from "vue";

export default {
  setup() {
    const imagePaths = ref([
    "https://static.zara.net/photos///contents/mkt/spots/ss23-north-woman-new/subhome-xmedia-20//w/1366/IMAGE-landscape-fill-c858f95e-9272-423c-a1ee-40e7dfd5b638-default_0.jpg?ts=1684136380997",
      "https://www.swaggermagazine.com/home/wp-content/uploads/2023/03/Zara-HomePage-Landscape_W-1.jpg",
      "https://static.zara.net/photos//contents/mkt/spots/ss23-help-customer/subhome-xmedia-10-north//landscape-web-27470945-8c31-433a-9eaf-392114b6a91d_0.jpg?ts=1682518360676",
      "https://cache.marieclaire.fr/data/photo/w1200_h630_c17/1mm/histoire-zara-fast-fashion-mode.jpg",
      "https://cdn.mos.cms.futurecdn.net/4HTRrzjb6FVy9gagXeXH9P.jpg",
      "https://static.zara.net/photos///contents/mkt/spots/ss23-north-man-new/subhome-xmedia-19-2//w/1366/IMAGE-landscape-fill-7c8c1a5b-ce41-46df-94ea-8f45d2bd772f-default_0.jpg?ts=1683800443276",
    ]);

    const activeIndex = ref(0);

    onMounted(() => {
      const interval = setInterval(() => {
        activeIndex.value = (activeIndex.value + 1) % imagePaths.value.length;
      }, 3000);

      // Clean up the interval when the component is unmounted
      return () => clearInterval(interval);
    });

    return {
      imagePaths,
      activeIndex,
    };
  },
};
</script>

<style scoped>
.slideshow-container {
  
  width: 100vw;
  height: 100vh;
  overflow: hidden;
}

.slide-enter {
  opacity: 0;
  transform: translateX(100%);
}

.slide-enter-active {
  opacity: 1;
  transform: translateX(0%);
  transition: opacity 500ms ease-in-out, transform 500ms ease-in-out;
}

.slide-exit {
  opacity: 1;
  transform: translateX(0%);
}

.slide-exit-active {
  opacity: 0;
  transform: translateX(-100%);
  transition: opacity 500ms ease-in-out, transform 500ms ease-in-out;
}
</style>