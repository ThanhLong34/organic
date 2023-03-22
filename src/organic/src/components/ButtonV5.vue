<template>
   <button :class="{
		'button-v5': true,
		'disable': isDisable
	}">
      <slot></slot>
   </button>
</template>

<script>
export default {
   name: "ButtonV5Component",
   props: {
		isDisable: Boolean
	},
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.button-v5 {
   min-width: 200px;
   height: 55px;
   line-height: 57px;
   background: $primaryColor;
   font-size: 16px;
   text-align: center;
   font-weight: 700;
   margin: 0;
   padding: 0 42px;
   color: #fff;
   -webkit-box-shadow: 0 10px 30px 0 rgb(37 37 37 / 30%);
   -moz-box-shadow: 0 10px 30px 0 rgba(37, 37, 37, 0.3);
   box-shadow: 0 10px 30px 0 rgb(37 37 37 / 30%);
   outline: none;
   border: none;
   transition: all ease 300ms;
   -moz-transition: all ease 300ms;
   -webkit-transition: all ease 300ms;

   &:hover {
      box-shadow: none;
      background: #252525;
   }

   @media (max-width: $maxMobile) {
      font-size: 14px;
      min-width: auto;
      height: 52px;
      line-height: 54px;
      padding: 0 34px;
   }

   &.disable {
		pointer-events: none !important;
		background: #8d8d8d;
   }
}
</style>
