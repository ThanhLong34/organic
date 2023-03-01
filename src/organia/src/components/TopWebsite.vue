<template>
   <div class="top-website">
      <div class="grid wide">
         <div class="row">
            <div class="col l-3 m-3 s-12">
               <img
                  class="logo"
                  src="@/assets/images/logo_dark.png"
                  alt="logo"
               />
            </div>
            <div class="col l-7 m-9 s-0">
               <div class="search">
                  <input
                     class="search-input"
                     type="text"
                     placeholder="Tìm kiếm sản phẩm..."
                  />
                  <router-link
                     :to="{
                        name: 'shop_search',
                        params: { productName: 'product-name' },
                     }"
                     class="search-btn"
                  >
                     <i class="fa-solid fa-magnifying-glass"></i>
                  </router-link>
               </div>
            </div>
            <div class="col l-2 m-0 s-0">
               <div class="phone">
                  <div class="phone-img hide-on-tablet">
                     <i class="fa-solid fa-headset"></i>
                  </div>
                  <div class="phone-txt">
                     Liên hệ với tôi
                     <strong>0353292241</strong>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
/* eslint-disable */
export default {
   name: "TopPageComponent",
   setup() {},
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.top-website {
   padding-top: 4px;
   padding-bottom: 15px;

   @media (max-width: $maxMobile) {
      padding-bottom: 10px;
   }
}

.logo {
   width: 175px;

   @media (max-width: $maxMobile) {
      width: 135px;
      margin: 0 auto;
   }
}

.row {
   justify-content: space-between;
   align-items: flex-end;
}

.search {
   display: flex;
   align-items: center;
   position: relative;
   margin: 0 18px;

   &-input {
      padding: 12px 38px 12px 14px;
      border-radius: 28px;
      width: 100%;
      border: 2px solid $secondaryColor;

      &::placeholder {
         font-style: italic;
         font-weight: 400;
      }
   }

   &-btn {
      background-color: transparent;
      color: $primaryColor;
      position: absolute;
      top: 50%;
      right: 4px;
      transform: translateY(-50%);
      font-size: 16px;
      width: 35px;
      height: 35px;
      border-radius: 50%;
      transition: all ease 0.4s;
      text-align: center;
      line-height: 38px;

      &:hover {
         cursor: pointer;
         color: white;
         background-color: $primaryColor;
      }
   }

   @media (max-width: $maxTablet) {
      margin: 0 0 0 20px;
   }
}

.phone {
   display: flex;
   justify-content: flex-end;
   align-items: center;

   &-img {
      margin-right: 8px;
      font-size: 38px;
      color: $primaryColor;

      @media (max-width: $maxMobile) {
         margin-right: 6px;
         font-size: 28px;
      }
   }

   &-txt {
      font-weight: bold;
      font-size: 16px;

      strong {
         color: $primaryColor;
         font-size: 20px;
         display: block;
      }

      @media (max-width: $maxMobile) {
         font-size: 10px;

         strong {
            font-size: 15px;
         }
      }
   }
}
</style>
