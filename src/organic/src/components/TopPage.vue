<template>
   <div class="top-page">
      <h6 class="top-page-name">{{ currentPage }}</h6>
      <div class="top-page-breadcrumb">
         <div class="top-page-breadcrumb-icon">
            <i class="fa-solid fa-house-chimney"></i>
         </div>
         <router-link :to="{ name: 'home' }">
            <div class="top-page-breadcrumb-parent">Trang chủ</div>
         </router-link>
         <i class="fa-solid fa-angle-right arrow-icon"></i>
         <div class="top-page-breadcrumb-child">{{ currentPage }}</div>
      </div>
   </div>
</template>

<script>
/* eslint-disable */
export default {
   name: "TopPageComponent",
   props: {
      currentPage: String,
   },
   setup() {},
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.top-page {
   overflow: hidden;
   padding: 100px 0 80px;
   position: relative;
   background-size: cover;
   background-repeat: no-repeat;
   background-position: center center;
   background-color: #f0f0f0;
   background-image: url("@/assets/images/top_page/bg.jpg");
   display: flex;
   flex-direction: column;
   justify-content: center;
   align-items: center;

   &-name {
      display: block;
      font-size: 56px;
      font-weight: bold;
      margin-bottom: 16px;
      text-transform: capitalize;
   }

   &-breadcrumb {
      display: flex;
      align-items: center;
      color: $darkTextColor;

      &-icon {
         color: white;
         background-color: $primaryColor;
         width: 46px;
         height: 46px;
         line-height: 48px;
         text-align: center;
         border-radius: 50%;
         font-size: 16px;
         margin-right: 12px;
      }

      &-parent,
      &-child {
         font-size: 22px;
         color: $darkTextColor;
         font-weight: 600;
         transition: color ease 0.4s;
         text-transform: capitalize;
      }

      &-parent:hover {
         color: $primaryColor;
      }

      .arrow-icon {
         margin: 0 12px;
         color: #828282;
      }
   }

   @media (max-width: $maxMobile) {
      padding: 55px 0 40px;

      &-name {
         font-size: 34px;
      }

      &-breadcrumb {
         &-icon {
            width: 38px;
            height: 38px;
            line-height: 40px;
            font-size: 12px;
         }

         &-parent,
         &-child {
            font-size: 18px;
         }
      }
   }
}
</style>
