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
                  v-for="item in productCategoryList"
                  :class="{
                     'sidebar-category-item': true,
                     active: item.id === 1,
                  }"
                  :key="item.id"
               >
                  <a href="javascript:;">
                     <i class="fa-solid fa-caret-right"></i>
                     {{ item.name }}
                  </a>
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
                  v-for="(item, index) in productListIsBestOffer"
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

import { ref, reactive } from "vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "SidebarShopComponent",
   components: {
      ProductV2,
      Swiper,
      SwiperSlide,
   },
   setup() {
      const modulesSwiper = [Autoplay];
      const productCategoryList = ref([]);
      const productListIsBestOffer = ref([]);

      getProductCategoryList();
      getProductListIsBestOffer();

      function getProductCategoryList() {
         return API.get(
            apiPath + `/product_category/get_list.php`,
            {},
            (data) => {
               if (data.code === 1) {
                  productCategoryList.value = data.data.map((item) => ({
                     ...item,
                     id: +item.id,
                  }));
               }
            }
         );
      }

      function getProductListIsBestOffer() {
         return API.get(
            apiPath + `/product/get_list.php`,
            {
               limit: 5,
               offset: 0,
               fillType: "isBestOffer",
               fillValue: 1,
            },
            (data) => {
               if (data.code === 1) {
                  productListIsBestOffer.value = data.data.map((item) => ({
                     ...item,
                     id: +item.id,
                     originPrice: +item.originPrice,
                     promotionPrice: +item.promotionPrice,
                     quantityReview: +item.quantityReview,
                     productCategoryId: +item.productCategoryId,
                  }));
               }
            }
         );
      }

      return {
         modulesSwiper,
         productCategoryList,
         productListIsBestOffer,
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
