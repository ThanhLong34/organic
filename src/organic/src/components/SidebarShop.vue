<template>
   <div class="sidebar-shop">
      <div class="sidebar">
         <div class="sidebar-sort">
            <p class="sidebar-title">Sắp xếp theo:</p>
            <div class="sidebar-sort-checkboxs">
               <label>
                  <input type="radio" name="radio" checked />
                  <span>Mặc định</span>
               </label>
               <label>
                  <input type="radio" name="radio" />
                  <span>Sản phẩm mới nhất</span>
               </label>
               <label>
                  <input type="radio" name="radio" />
                  <span>Sản phẩm được đánh giá cao</span>
               </label>
               <label>
                  <input type="radio" name="radio" />
                  <span>Giá: thấp tới cao</span>
               </label>
               <label>
                  <input type="radio" name="radio" />
                  <span>Giá: cao tới thấp</span>
               </label>
            </div>
         </div>
         <div class="sidebar-category">
            <p class="sidebar-title">Danh mục:</p>
            <ul class="sidebar-category-list">
               <li
                  :class="{
                     'sidebar-category-item': true,
                     active: i === 1,
                  }"
                  v-for="i in 5"
                  :key="i"
               >
                  <router-link
                     :to="{
                        name: 'shop',
                        params: { categoryName: 'show-all' },
                     }"
                  >
                     <i class="fa-solid fa-caret-right"></i>
                     Rau củ
                  </router-link>
               </li>
            </ul>
         </div>
         <div class="sidebar-best-seller">
            <p class="sidebar-title">Ưu đãi hấp dẫn:</p>
            <swiper
               :speed="600"
               :loop="true"
               :spaceBetween="25"
               :autoplay="{
                  delay: 1800,
                  disableOnInteraction: false,
                  pauseOnMouseEnter: true,
               }"
               :breakpoints="{
                  0: {
                     slidesPerView: 1,
                  },
                  740: {
                     slidesPerView: 3,
                  },
                  1024: {
                     slidesPerView: 1,
                  },
               }"
               :modules="modulesSwiper"
            >
               <swiper-slide
                  v-for="(item, index) in productsSeller"
                  :key="index"
               >
                  <ProductV2 :product="item" />
               </swiper-slide>
            </swiper>
         </div>
      </div>
   </div>
</template>

<script>
/* eslint-disable */

import ProductV2 from "@/components/ProductV2.vue";

//#region Slider Swiper
// Import Swiper Vue.js components
import { Swiper, SwiperSlide } from "swiper/vue";
// import required modules
import { Autoplay } from "swiper";
//#endregion

import { reactive } from "vue";

export default {
   name: "SidebarShopComponent",
   components: {
      ProductV2,
      Swiper,
      SwiperSlide,
   },
   setup() {
      const modulesSwiper = [Autoplay];
      const productsSeller = reactive([
         {
            category: "Fresh",
            image: "exp.png",
            name: "Vegan Egg Replacer",
            priceOld: "280.00",
            priceNew: "180.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 4,
         },
         {
            category: "Fresh",
            image: "exp1.png",
            name: "Vegan Egg Replacer",
            priceOld: "280.00",
            priceNew: "180.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 5,
         },
         {
            category: "Fresh",
            image: "exp2.png",
            name: "Vegan Egg Replacer",
            priceOld: "280.00",
            priceNew: "180.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 4,
         },
         {
            category: "Fresh",
            image: "exp3.png",
            name: "Vegan Egg Replacer",
            priceOld: "280.00",
            priceNew: "180.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 5,
         },
      ]);

      return {
         modulesSwiper,
         productsSeller,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.sidebar {
   color: $darkTextColor;

   &-title {
      text-transform: uppercase;
      font-size: 22px;
      font-weight: 600;
      margin-bottom: 20px;
      background-color: #f9f9f9;
      padding: 14px 14px;
      font-weight: 700;
   }

   @media (max-width: $maxMobile) {
      &-title {
         font-size: 20px;
      }
   }
}

.sidebar-sort {
   margin-bottom: 35px;

   &-checkboxs {
      padding: 0 8px;
   }

   label {
      display: flex;
      cursor: pointer;
      font-weight: 500;
      position: relative;
      overflow: hidden;
      margin-bottom: 0.375em;
      /* Accessible outline */
      /* Remove comment to use */
      /*
		&:focus-within {
				outline: .125em solid $primaryColor;
		}
	*/
      input {
         position: absolute;
         left: -9999px;
         &:checked + span {
            background-color: mix(#fff, $primaryColor, 84%);
            &:before {
               box-shadow: inset 0 0 0 0.4375em $primaryColor;
            }
         }
      }
      span {
         display: flex;
         align-items: center;
         padding: 0.375em 0.75em 0.375em 0.375em;
         border-radius: 99em; // or something higher...
         transition: 0.25s ease;
         &:hover {
            background-color: mix(#fff, $primaryColor, 84%);
         }
         &:before {
            display: flex;
            flex-shrink: 0;
            content: "";
            background-color: #fff;
            width: 1.4em;
            height: 1.4em;
            border-radius: 50%;
            margin-right: 10px;
            transition: 0.25s ease;
            box-shadow: inset 0 0 0 0.125em $primaryColor;
         }
      }
   }
}

.sidebar-category {
   margin-bottom: 35px;

   &-item {
      transition: background-color ease 0.4s;

      i {
         margin-right: 5px;
      }

      a {
         padding: 8px 12px;
         display: block;
         color: $darkTextColor;
         font-size: 20px;
         transition: all ease 0.4s;
      }

      &.active,
      &:hover {
         background-color: $primaryColor;
         a {
            color: white;
            transform: translateX(10px);
         }
      }
   }
}

.sidebar-best-seller {
   @media (max-width: $maxTablet) {
      padding-bottom: 20px;
   }
}
</style>
