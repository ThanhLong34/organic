<template>
   <div class="product-wishlist">
      <div class="product-wishlist-img">
         <img
            :src="`${require(`@/assets/images/product/${product.image}`)}`"
            alt="product image"
         />
      </div>
      <div class="product-wishlist-info">
         <button class="product-wishlist-remove-btn">
            <i class="fa-solid fa-xmark"></i>
         </button>
         <h6 class="product-wishlist-category">{{ product.category }}</h6>
         <h5 class="product-wishlist-name">
            <router-link
               :to="{
                  name: 'shop_details',
                  params: { id: 1 },
               }"
            >
               {{ product.name }}
            </router-link>
         </h5>
         <p class="product-wishlist-price">
            <span>{{ product.price }}đ</span>
            / Kg
         </p>
         <p class="product-wishlist-desc">
            {{ product.description }}
         </p>
         <div class="product-wishlist-rating">
            <div class="product-wishlist-rating-stars">
               <i
                  v-for="i in 5"
                  :key="i"
                  :class="{
                     'fa-solid fa-star': true,
                     active: i <= product.star,
                  }"
               ></i>
            </div>
            <div class="product-wishlist-rating-total">&lpar;01&rpar;</div>
         </div>
         <div class="product-wishlist-ctrl">
            <div class="product-wishlist-ctrl-quantity">
               <button
                  class="product-wishlist-ctrl-sub-btn"
                  @click="handleSubQuantity"
               >
                  &minus;
               </button>
               <span>{{ info.quantity }}</span>
               <button
                  class="product-wishlist-ctrl-add-btn"
                  @click="handleAddQuantity"
               >
                  &plus;
               </button>
            </div>
            <div class="product-wishlist-ctrl-other">
               <button-v-3 class="product-wishlist-addtocart-btn">
                  Thêm vào giỏ
               </button-v-3>
            </div>
         </div>
      </div>
   </div>
</template>

<script>

import ButtonV3 from "@/components/ButtonV3.vue";

import { ref, reactive } from "vue";

export default {
   name: "ProductWishlistComponent",
   components: {
      ButtonV3,
   },
   props: {
      product: Object,
   },
   setup() {
      const info = reactive({
         quantity: 1,
      });

      function handleSubQuantity() {
         if (info.quantity > 1) {
            info.quantity -= 1;
         }
      }

      function handleAddQuantity() {
         if (info.quantity < 99) {
            info.quantity += 1;
         }
      }

      return {
         info,
         handleSubQuantity,
         handleAddQuantity,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.product-wishlist {
   display: flex;
   align-items: center;
   margin-bottom: 50px;

   &-remove-btn {
      position: absolute;
      top: 8px;
      right: 8px;
      width: 30px;
      height: 30px;
      line-height: 30px;
      text-align: center;
      font-size: 16px;
      border-radius: 50%;
      background-color: transparent;
      border: 2px solid #bbbbbb;
      color: #9b9b9b;
      transition: all ease 0.4s;
      cursor: pointer;

      &:hover {
         color: orangered;
         border-color: orangered;
      }
   }

   &-img {
      z-index: 1;
      margin-right: -60px;
   }

   &-info {
      background-color: white;
      border-radius: 15px;
      padding: 36px 20px 36px 68px;
      box-shadow: $cardShadow;
      flex-grow: 1;
      position: relative;
   }

   &-category {
      background: linear-gradient(-90deg, #92c64e 0%, #4baf50 100%);
      padding: 8px 14px;
      border-radius: 20px;
      display: inline-block;
      color: white;
      text-transform: uppercase;
      font-size: 12px;
      margin-bottom: 18px;
   }

   &-name {
      a {
         display: block;
         font-size: 24px;
         font-weight: 600;
         color: $darkTextColor;
         margin-bottom: 12px;
         line-height: 1.2;
         transition: color ease 0.4s;

         &:hover {
            color: $primaryColor;
         }
      }
   }

   &-price {
      font-size: 20px;
      color: $primaryColor;
      margin-bottom: 18px;

      span {
         font-weight: bold;
      }
   }

   &-desc {
      color: #828282;
      font-size: 18px;
      line-height: 1.2;
   }

   &-rating {
      margin: 18px 0;
      display: flex;
      align-items: flex-end;
      color: #c9c9c9;

      &-stars {
         i {
            font-size: 14px;

            &.active {
               color: #ffa900;
            }
         }
      }

      &-total {
         margin-left: 8px;
         color: #818181;
      }
   }

   &-ctrl {
      display: flex;
      align-items: center;
      justify-content: space-between;
      color: $darkTextColor;

      &-quantity {
         position: relative;
         padding: 3px 3px;
         border-radius: 20px;
         background-color: #f2f2f2;
         display: flex;
         align-items: center;
         justify-content: space-between;

         span {
            font-size: 20px;
            font-weight: 600;
            width: 62px;
            text-align: center;
         }
      }

      &-sub-btn,
      &-add-btn {
         width: 36px;
         height: 36px;
         line-height: 36px;
         border-radius: 50%;
         text-align: center;
         font-size: 26px;
         background-color: white;
         font-weight: 400;
         transition: all ease 0.4s;

         &:hover {
            background-color: $primaryColor;
            color: white;
         }
      }
   }

   @media (max-width: $maxMobile) {
      flex-direction: column;
      align-items: center;

      &-remove-btn {
         width: 38px;
         height: 38px;
         line-height: 38px;
      }

      &-img {
         margin-right: 0;
         position: relative;
         top: 25px;
      }

      &-info {
         padding: 36px 20px;
      }
   }

   @media (min-width: $maxTablet + 1px) and (max-width: 1135px),
      (max-width: 400px) {
      &-ctrl {
         flex-direction: column;
         align-items: flex-start;
      }

      &-addtocart-btn {
         margin-top: 20px;
      }
   }
}
</style>
