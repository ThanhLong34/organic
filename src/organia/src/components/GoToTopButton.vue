<template>
  <button
    :class="{
      'gototop-btn': true,
      show: isShowGoToTopBtn,
    }"
    @click="handleGoToTop"
  >
    <i class="fa-solid fa-chevron-up"></i>
  </button>
</template>

<script>
/* eslint-disable */
export default {
  name: "GoToTopButtonComponent",
  props: {
    isShowGoToTopBtn: Boolean,
  },
  setup() {
    function handleGoToTop() {
      document.body.scrollTop = 0;
      document.documentElement.scrollTop = 0;
    }
    return { handleGoToTop };
  },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;
.gototop-btn {
  position: fixed;
  right: 20px;
  z-index: $zIGoToTopBtn;
  background-image: linear-gradient(360deg, #92c64e, #4baf50);
  box-shadow: 0 1px 12px rgb(0 0 0 / 25%);
  color: white;
  padding: 10px 12px;
  border-radius: 50%;
  transition: all ease 0.3s;
  bottom: 0;
  opacity: 0;
  visibility: hidden;

  i {
    position: relative;
    top: 1px;
  }

  &.show {
    bottom: 15px;
    opacity: 1;
    visibility: visible;
  }
}
</style>
