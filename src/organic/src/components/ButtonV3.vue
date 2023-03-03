<template>
   <button class="button-v3">
      <slot></slot>
   </button>
</template>

<script>
export default {
   name: "ButtonV3Component",
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.button-v3 {
   display: inline-block;
   height: 42px;
   line-height: 42px;
   text-align: center;
   font-size: 16px;
   font-weight: 600;
   border-radius: 30px;
   padding: 0 26px;
   transition: all ease 400ms;
   -webkit-transition: all ease 400ms;
   box-shadow: 0 2px 24px -1px rgb(0 0 0 / 3%);
   background-color: $primaryColor;
   color: white;

   &:hover {
      background-color: darken($primaryColor, 10);
   }
}
</style>
