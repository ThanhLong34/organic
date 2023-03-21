<template>
  <button class="button-v4">
    <slot></slot>
  </button>
</template>

<script>

export default {
  name: "ButtonV4Component",
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.button-v4 {
  min-width: 200px;
  height: 60px;
  line-height: 62px;
  background: #252525;
  font-size: 16px;
  text-align: center;
  border-radius: 50px;
  font-weight: 700;
  margin: 0;
  padding: 0 42px;
  color: #fff;
  -webkit-box-shadow: 0 10px 30px 0 rgb(37 37 37 / 40%);
  -moz-box-shadow: 0 10px 30px 0 rgba(37, 37, 37, 0.4);
  box-shadow: 0 10px 30px 0 rgb(37 37 37 / 40%);
  outline: none;
  border: none;
  transition: all ease 300ms;
  -moz-transition: all ease 300ms;
  -webkit-transition: all ease 300ms;

  &:hover {
    box-shadow: none;
    background: $primaryColor;
  }

  @media (max-width: $maxMobile) {
    font-size: 14px;
    min-width: auto;
    height: 52px;
    line-height: 54px;
    padding: 0 34px;
  }
}
</style>
