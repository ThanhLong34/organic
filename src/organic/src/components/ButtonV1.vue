<template>
   <button class="button-v1">
      <slot></slot>
   </button>
</template>

<script>
export default {
   name: "ButtonV1Component",
};
</script>

<style lang="scss" scoped>
.button-v1 {
   display: inline-block;
   height: 38px;
   line-height: 38px;
   background: #fff;
   color: #1e1e1e;
   text-align: center;
   font-size: 12px;
   font-weight: 600;
   border-radius: 30px;
   padding: 0 26px;
   position: relative;
   z-index: 2;
   overflow: hidden;
   transition: all ease 400ms;
   -webkit-transition: all ease 400ms;
   box-shadow: 0 2px 24px -1px rgb(0 0 0 / 3%);
   &::before {
      position: absolute;
      left: auto;
      right: 0;
      height: 100%;
      content: "";
      z-index: -1;
      width: 0;
      overflow: hidden;
      border-radius: inherit;
      background: #457500;
      transition: width 0.5s cubic-bezier(0.25, 0.8, 0.25, 1) 0s;
      -moz-transition: width 0.5s cubic-bezier(0.25, 0.8, 0.25, 1) 0s;
      -webkit-transition: width 0.5s cubic-bezier(0.25, 0.8, 0.25, 1) 0s;
      border-color: transparent;
      background: linear-gradient(-90deg, #92c64e 0%, #4baf50 100%);
   }
   &:hover {
      color: white;
      &::before {
         width: 100%;
         left: 0;
         right: auto;
      }
   }
}
</style>
