<template>
  <button class="button-icon">
    <slot></slot>
  </button>
</template>

<script>
export default {
  name: "ButtonIconComponent",
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.button-icon {
  width: 44px;
  height: 44px;
  line-height: 48px;
  border-radius: 50%;
  text-align: center;
  font-weight: 400;
  transition: all ease 0.4s;
  font-size: 17px;
  background-color: #f2f2f2;
  position: relative;
  overflow: hidden;
  z-index: 1;

  &:hover {
    cursor: pointer;
    color: white;
    &::after {
      opacity: 1;
    }
  }

  &::after {
    content: "";
    position: absolute;
    inset: 0;
    background-image: linear-gradient(-90deg, #92c64e 0%, #4baf50 100%);
    z-index: -1;
    opacity: 0;
    transition: opacity ease 0.4s;
  }
}
</style>
