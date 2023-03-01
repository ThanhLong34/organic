<template>
  <div class="error-404">
    <TopPage :currentPage="'404'" />
    <div class="error-404-content">
      <p class="error-404-title">404</p>
      <p class="error-404-para">
        The link you folowed probably broken
        <br />
        or the page has been removed...
      </p>
      <router-link :to="{ name: 'home' }">
        <button-v-2>Return To Home</button-v-2>
      </router-link>
    </div>
  </div>
</template>

<script>
/* eslint-disable */
import TopPage from "@/components/TopPage.vue";
import ButtonV2 from "@/components/ButtonV2.vue";

export default {
  name: "Error404Page",
  components: {
    TopPage,
    ButtonV2,
  },
  setup() {},
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.error-404 {
  &-content {
    padding: 120px 0 100px;
    text-align: center;
  }

  &-title {
    font-size: 260px;
    font-weight: bold;
    color: $primaryColor;
  }

  &-para {
    font-size: 38px;
    line-height: 1.2;
    color: #252525;
    font-weight: 400;
    margin-bottom: 50px;
  }
}
</style>
