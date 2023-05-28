<template>
  <div class="fullscreen-container">
    <div class="slideshow-container">
      <img
        :src="currentImagePath"
        :alt="`Slide ${activeIndex + 1}`"
        class="fullscreen-image"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { ref, onMounted } from "vue";

export default {
  setup() {
    const imagePaths = [
      "https://static.zara.net/photos///contents/mkt/spots/ss23-north-woman-new/subhome-xmedia-21//w/1920/IMAGE-landscape-fill-8d9e274f-93da-4343-af1d-1e546f4d902f-default_0.jpg?ts=1684940939176",
      "https://static.zara.net/photos///contents/mkt/spots/ss23-north-woman-collection/subhome-xmedia-21-2//w/1920/IMAGE-landscape-fill-b9592208-cde2-4805-a60e-e9ba66b6c01e-default_0.jpg?ts=1684941302182",
      "https://static.zara.net/photos///contents/mkt/spots/ss23-north-woman-jeans/subhome-xmedia-21-2//w/1920/IMAGE-landscape-fill-c72baacb-0d13-4e4e-b2d0-83bfe8ae84a7-default_0.jpg?ts=1684941605187",
      "https://static.zara.net/photos///contents/mkt/spots/ss23-north-beauty-new/subhome-xmedia-16//w/1920/IMAGE-landscape-default-fill-d06d0c41-fb7d-423f-96be-d9a4510cdab8-default_0.jpg?ts=1682077253385",
      "https://static.zara.net/photos///contents/mkt/spots/ss23-north-woman-accesories/subhome-xmedia-21-2//w/1920/IMAGE-landscape-fill-79ca3793-4421-43d7-9450-87a544a3465c-default_0.jpg?ts=1684941996804",
      "https://static.zara.net/photos///contents/mkt/spots/ss23-north-woman-join-life/subhome-xmedia-11//w/1920/IMAGE-landscape-default-fill-53c67ecf-62ae-4087-a1a7-2c575c06c8f2-default_0.jpg?ts=1679057887005",
      "https://www.linkpicture.com/q/Screenshot-2023-05-28-130524.png"
      
    ];

    const activeIndex = ref(0);

    const currentImagePath = ref(imagePaths[activeIndex.value]);

    const updateImage = () => {
      activeIndex.value = (activeIndex.value + 1) % imagePaths.length;
      currentImagePath.value = imagePaths[activeIndex.value];
    };

    onMounted(() => {
      const interval = setInterval(updateImage, 3000);

      // Clean up the interval when the component is unmounted
      return () => clearInterval(interval);
    });

    return {
      currentImagePath,
      activeIndex,
    };
  },
};
</script>

<style scoped>
html,
body {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.fullscreen-container {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.slideshow-container {
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.fullscreen-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>
