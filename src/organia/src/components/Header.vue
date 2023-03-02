<template>
   <header class="header">
      <div class="grid wide">
         <div class="row">
            <div class="col l-3 m-9 s-6">
               <div class="categories">
                  <button
                     class="categories-btn"
                     @click="handleToggleShowCategoryBox"
                  >
                     <i class="fa-solid fa-bars"></i>
                     Các danh mục
                  </button>
                  <div
                     :class="{
                        'categories-box': true,
                        show: isShowCategoryBox && !isHideCategoryBox,
                     }"
                  >
                     <!-- list -->
                     <ul class="categories-list">
                        <!-- item -->
                        <li
                           class="categories-item"
                           v-for="(item, index) in categories"
                           :key="index"
                        >
                           <div class="categories-item-img">
                              <img
                                 :src="`${require(`@/assets/images/categories_icon/${item.icon}`)}`"
                                 alt="icon"
                              />
                           </div>
                           <h6 class="categories-item-name">{{ item.name }}</h6>
                           <p class="categories-item-total">
                              &lpar;30 sản phẩm&rpar;
                           </p>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
            <div class="col l-7 m-0 s-0">
               <!-- Navigator -->
               <Navigator />
            </div>
            <div class="col l-2 m-3 s-6">
               <div class="access">
                  <button
                     class="access-btn access-menu"
                     @click="handleOpenMenuSidebar"
                  >
                     <i class="fa-solid fa-bars"></i>
                  </button>
                  <router-link :to="{ name: 'wishlist' }">
                     <button class="access-btn access-wishlist">
                        <i class="fa-regular fa-heart"></i>
                        <p class="access-number">3</p>
                     </button>
                  </router-link>
                  <div class="access-btn access-viewcart">
                     <i class="fa-solid fa-cart-shopping"></i>
                     <p class="access-number">12</p>
                     <ViewCartBox />
                  </div>
               </div>
            </div>
         </div>
      </div>
   </header>
</template>

<script>
/* eslint-disable */
import Navigator from "@/components/Navigator.vue";
import ViewCartBox from "@/components/ViewCartBox.vue";

import { ref, computed, onMounted, reactive } from "vue";

export default {
   name: "HeaderComponent",
   components: {
      Navigator,
      ViewCartBox,
   },
   props: {
      isHideCategoryBox: {
         type: Boolean,
         default: true,
      },
   },
   emits: ["openMenuSidebar", "showOverlayMain", "hideOverlayMain"],
   setup(props, { emit }) {
      const isShowCategoryBox = ref(false);
      const categories = reactive([
         { name: "Vegetables", icon: "vegetables.png" },
         { name: "Fresh Fruits", icon: "fresh_fruits.png" },
         { name: "Beverages", icon: "beverages.png" },
         { name: "Babies & Kids", icon: "babies_and_kids.png" },
         { name: "Frozen Foods", icon: "frozen_foods.png" },
         { name: "Superfoods & Greens", icon: "superfoods_and_greens.png" },
         { name: "Fresh Tomatoes", icon: "fresh_tomatoes.png" },
         { name: "Fresh Nut & Seed", icon: "fresh_nut_and_seed.png" },
         { name: "Fresh Organic", icon: "fresh_organic.png" },
      ]);

      function handleToggleShowCategoryBox() {
         if (props.isHideCategoryBox) {
            isShowCategoryBox.value = false;
         }
         isShowCategoryBox.value = !isShowCategoryBox.value;

         if (isShowCategoryBox.value) {
            emit("showOverlayMain");
         } else {
            emit("hideOverlayMain");
         }
      }

      function handleOpenMenuSidebar() {
         emit("openMenuSidebar");
      }

      return {
         isShowCategoryBox,
         categories,
         handleToggleShowCategoryBox,
         handleOpenMenuSidebar,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

@keyframes showCategoryBox {
   0% {
      opacity: 0;
      top: calc(100% + 50px);
   }
   100% {
      opacity: 1;
      top: calc(100% + 12px);
   }
}

.header {
   padding: 12px 0;
   background-color: #313131;
   color: white;
   z-index: $zIHeader;

   .row {
      justify-content: space-between;
      align-items: center;
   }

   @media (max-width: 460px) {
      padding: 12px 0;
   }
}

.categories {
   position: relative;
   z-index: $zIHeader;

   &-btn {
      background: linear-gradient(-90deg, #92c64e 0%, #4baf50 100%);
      height: 52px;
      line-height: 52px;
      padding: 0 38px;
      color: #fff;
      font-weight: bold;
      text-align: center;
      font-size: 18px;
      border-radius: 50px;
      display: inline-block;
      position: relative;
      z-index: 100;

      i {
         margin-right: 4px;
         @media (max-width: 340px) {
            display: none;
         }
      }

      @media (max-width: 460px) {
         height: 42px;
         line-height: 42px;
         padding: 0 22px;
         font-size: 14px;
      }
   }

   &-box {
      display: none;
      position: absolute;
      left: 0;
      width: max-content;
      animation: showCategoryBox ease 0.4s forwards;
      background-color: white;
      box-shadow: 0 1px 20px rgb(0 0 0 / 10%);
      border-radius: 0 0 20px 20px;

      &.show {
         display: block;
      }
   }

   &-list {
      padding: 10px 20px;
      max-height: calc(100vh - 100px);
      overflow: auto;

      &::-webkit-scrollbar {
         width: 5px;
      }

      &::-webkit-scrollbar-track {
         -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
         background-color: $bodyColor;
      }

      &::-webkit-scrollbar-thumb {
         border-radius: 20px;
         background-image: linear-gradient(45deg, #92c64e 0%, #4baf50 100%);
      }
   }

   &-item {
      display: flex;
      align-items: center;
      color: $darkTextColor;
      min-width: 300px;
      padding: 14px 0;
      transition: all ease 0.5s;

      &:hover {
         cursor: pointer;
         color: $primaryColor;
      }

      &:hover &-img {
         box-shadow: 0 1px 8px 1px rgb(0 0 0 / 15%);
      }

      & + & {
         border-top: 1px solid #f3f3f3;
      }

      &-img {
         padding: 6px 7px;
         background-color: #f3f3f3;
         border-radius: 50%;
         margin-right: 10px;
         transition: all ease 0.5s;

         img {
            width: 24px;
         }
      }

      &-name {
         font-size: 16px;
         font-weight: 600;
         margin-right: 8px;
      }

      &-total {
         margin-left: auto;
         font-size: 14px;
         min-width: max-content;
      }
   }

   @media (max-width: $maxMobile) {
      &-list {
         padding: 6px 12px;
      }

      &-item {
         min-width: 240px;
         padding: 8px 0;

         &-name {
            font-size: 12px;
            max-width: fit-content;
         }

         &-total {
            font-size: 10px;
         }

         &-img {
            padding: 5px 6px;
            img {
               width: 18px;
            }
         }
      }
   }
}

.access {
   display: flex;
   align-items: center;
   justify-content: flex-end;

   &-btn {
      padding: 12px 14px;
      border-radius: 5px;
      background-color: #575757;
      box-shadow: 0 0 20px rgb(0 0 0 / 4%);
      transition: all ease 0.4s;
      min-width: 46px;
      position: relative;

      &:hover {
         color: white;
         background-color: $primaryColor;
      }

      &:hover .access-number {
         background: linear-gradient(-90deg, #92c64e 0%, #4baf50 100%);
      }

      & + & {
         margin-left: 14px;
      }

      @media (max-width: 460px) {
         padding: 10px 12px;
         font-size: 14px;
         min-width: 40px;
         & + & {
            margin-left: 10px;
         }
      }
   }

   &-wishlist {
      display: inline-block;
      color: white;
      margin: 0 14px;

      @media (max-width: 460px) {
         font-size: 14px;
         margin: 0 10px;
      }
   }

   &-number {
      width: 20px;
      height: 20px;
      position: absolute;
      bottom: 70%;
      left: 68%;
      border-radius: 50%;
      font-size: 14px;
      background: black;
      display: flex;
      justify-content: center;
      align-items: center;

      @media (max-width: 460px) {
         padding: 5px 0 4px 0;
         min-width: 20px;
         font-size: 12px;
         & + & {
            margin-left: 10px;
         }
      }
   }

   &-menu {
      display: none;
   }

   &-viewcart {
      display: block;
      position: relative;

      &:hover .viewcart-box {
         display: block;
      }
   }

   @media (max-width: 1023px) {
      &-menu {
         display: block;
      }
   }
}
</style>
