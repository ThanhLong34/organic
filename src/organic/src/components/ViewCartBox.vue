<template>
   <div class="viewcart-box">
      <ul v-if="productList.length > 0" class="viewcart-list">
         <li class="viewcart-item" v-for="item in productList" :key="item.id">
            <div class="viewcart-item-img">
               <img
                  :src="
                     item.featureImageUrl
                        ? item.featureImageUrl
                        : `${require('@/assets/images/no-image.jpg')}`
                  "
                  alt="product image"
               />
            </div>
            <div class="viewcart-item-txt">
               <p class="viewcart-item-name">
                  <router-link
                     :to="{
                        name: 'shop_details',
                        params: { id: item.id },
                     }"
                  >
                     {{ item.name }}
                  </router-link>
               </p>
               <p class="viewcart-item-price">
                  {{ $store.state.cart.find((i) => i.id === item.id)?.quantity ?? null }}
                  x <span>{{ toVND(item.promotionPrice) }}</span>
               </p>
            </div>
            <button
               class="viewcart-item-remove-btn"
               @click="() => $store.dispatch('removeItemCart', item.id)"
            >
               &times;
            </button>
         </li>
      </ul>
      <div class="viewcart-subtotal">
         <p>Tổng tiền:</p>
         <p>
            {{ toVND(totalCost) }}
         </p>
      </div>
      <div class="viewcart-btns">
         <button class="viewcart-btn">
            <router-link
               :to="{
                  name: 'viewcart',
               }"
            >
               Giỏ hàng
            </router-link>
         </button>
         <button class="checkout-btn">
            <router-link
               :to="{
                  name: 'checkout',
               }"
            >
               Thanh toán
            </router-link>
         </button>
      </div>
   </div>
</template>

<script>
import { ref, watchEffect, computed } from "vue";
import { useStore } from "vuex";

import { toVND } from "@/helpers/functions";
import * as API from "@/helpers/api.js";

const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "ViewCartBoxComponent",
   setup() {
      const store = useStore();

      const cart = store.state.cart;

      const productList = ref([]);
		const totalCost = computed(() => {
         let result = 0;
         cart.forEach((i) => {
            if (productList.value && productList.value.length > 0) {
               const p = productList.value.find((p) => p.id === i.id);
               if (p) {
                  result += p.promotionPrice * i.quantity;
               }
            }
         });
         return result;
      });

      function getProductItem(productId) {
         return API.get(
            apiPath + `/product/get_item.php`,
            {
               id: productId,
            },
            (data) => {
               if (data.code === 1) {
                  const product = {
                     ...data.data,
                     id: +data.data.id,
                     featureImageId: +data.data.featureImageId,
                     originPrice: +data.data.originPrice,
                     promotionPrice: +data.data.promotionPrice,
                     isSpecial: +data.data.isSpecial == 1,
                     isNew: +data.data.isNew == 1,
                     isBestOffer: +data.data.isBestOffer == 1,
                     productCategoryId: +data.data.productCategoryId,
                     averageRating: +data.data.averageRating,
                  };

                  productList.value.push(product);
               }
            }
         );
      }

      watchEffect(() => {
         if (Array.isArray(cart)) {
            productList.value = [];

            cart.forEach((i) => {
               getProductItem(i.id);
            });
         }
      });

      return {
         toVND,
         productList,
         totalCost,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

@keyframes showViewCart {
   0% {
      opacity: 0;
      right: -100px;
   }
   100% {
      opacity: 1;
      right: 0;
   }
}

.viewcart-box {
   display: none;
   position: absolute;
   z-index: $zIHeader;
   top: calc(100% + 16px);
   padding: 20px;
   background-color: white;
   border-radius: 0 0 10px 10px;
   box-shadow: 0 1px 20px rgb(0 0 0 / 10%);
   animation: showViewCart ease 0.8s forwards;
   min-width: 275px;

   &::before {
      content: "";
      background-color: transparent;
      position: absolute;
      bottom: 100%;
      left: 0;
      width: 100%;
      height: 20px;
   }
}

.viewcart-item {
   display: flex;
   justify-content: flex-start;
   align-items: flex-start;
   position: relative;
   border-bottom: 1px solid rgba(0, 0, 0, 0.1);
   padding: 15px 0;

   &:hover &-txt {
      color: $primaryColor;

      a {
         color: $primaryColor;
      }
   }

   &-img {
      margin-right: 10px;
      width: 60px;
      min-width: 60px;
   }

   &-txt {
      color: $darkTextColor;
      flex-grow: 1;
      padding-right: 26px;
      padding-top: 3px;
      padding-height: 3px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      transition: all ease 0.4s;
   }

   &-name {
      a {
         display: inline-block;
         font-weight: 600;
         font-size: 18px;
         margin-bottom: 5px;
         max-width: fit-content;
         line-height: 1.2;
         transition: all ease 0.4s;
         color: $darkTextColor;
      }
   }

   &-price {
      font-size: 16px;
      max-width: fit-content;

      span {
         color: $primaryColor;
      }
   }

   &-remove-btn {
      position: absolute;
      top: 12px;
      right: 0;
      color: rgb(161, 161, 161);
      width: 24px;
      height: 24px;
      background-color: transparent;
      border-radius: 50%;
      border: 1px solid rgb(207, 207, 207);
      font-size: 18px;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all ease 0.3s;

      &:hover {
         color: orangered;
         border-color: orangered;
      }
   }
}

.viewcart-subtotal {
   font-size: 20px;
   font-weight: 600;
   color: $darkTextColor;
   padding: 16px 0;
   display: flex;
   justify-content: space-between;
   align-items: center;

   p:first-child {
      text-transform: uppercase;
   }

   p:last-child {
      color: $primaryColor;
   }
}

.viewcart-btns {
   display: flex;
   justify-content: space-between;
   align-items: center;

   button {
      background-color: transparent;
      width: 112px;
   }

   a {
      width: 100%;
      height: 35px;
      line-height: 37px;
      background: $primaryColor;
      font-size: 14px;
      display: inline-block;
      text-transform: uppercase;
      text-align: center;
      border-radius: 3px;
      font-weight: 600;
      margin: 0;
      position: relative;
      z-index: 1;
      overflow: hidden;
      color: #fff;
      outline: none;
      border: none;
      transition: all ease 300ms;
      -moz-transition: all ease 300ms;
      -webkit-transition: all ease 300ms;

      &:hover {
         &::before {
            width: 100%;
            right: auto;
            left: 0;
         }
      }

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
      }
   }
}
</style>
