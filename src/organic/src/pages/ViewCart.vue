<template>
   <div class="view-cart">
      <TopPage :currentPage="'Giỏ Hàng'" />

      <div class="view-cart-content">
         <div class="view-cart-product">
            <div class="grid wide">
               <div class="row">
                  <div class="col l-12 m-12 s-12">
                     <heading-section>
                        <template #strong>Giỏ hàng</template>
                        <template #default> của bạn</template>
                     </heading-section>
                  </div>
                  <div class="col l-12 m-12 s-12">
                     <div class="view-cart-product-list">
                        <div class="row">
                           <div
                              class="col l-6 m-12 s-12"
                              v-for="item in productList"
                              :key="item.id"
                           >
                              <div class="view-cart-product-item">
                                 <ProductViewCart
                                    :product="item"
                                    @onRemoveItemCart="handleRemoveItemCart"
                                 />
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div
                     v-if="productList.length <= 0"
                     class="col l-12 m-12 s-12"
                  >
                     <p class="product-list-none-data">Không có sản phẩm</p>
                  </div>
               </div>
            </div>
         </div>
         <div class="view-cart-bottom">
            <div class="grid wide">
               <div class="row">
                  <!-- <div class="col l-6 m-6 s-12">
                     <div class="view-cart-coupon">
                        <InputV1 placeholder="Nhập mã giảm giá" />
                        <button-v-4>ÁP DỤNG MÃ</button-v-4>
                     </div>
                  </div> -->
                  <div class="col l-3"></div>
                  <div v-if="productList.length > 0" class="col l-6 m-12 s-12">
                     <div class="view-cart-checkout">
                        <p class="view-cart-checkout-title">Tính tiền</p>
                        <div class="view-cart-checkout-row">
                           <div class="view-cart-checkout-label">
                              Tổng tiền sản phẩm:
                           </div>
                           <div
                              class="view-cart-checkout-value view-cart-checkout-subtotal-price"
                           >
                              {{ toVND(totalCost) }}
                           </div>
                        </div>
                        <div class="view-cart-checkout-row">
                           <div class="view-cart-checkout-label">
                              Tổng tiền phải trả:
                           </div>
                           <div
                              class="view-cart-checkout-value view-cart-checkout-total-price"
                           >
                              {{ toVND(totalCost) }}
                              <!-- <span class="counpon">&lpar;-30%&rpar;</span> -->
                           </div>
                        </div>
                        <router-link :to="{ name: 'checkout' }">
                           <button-v-4
                              >TIẾN HÀNH THANH TOÁN</button-v-4
                           >
                        </router-link>
                     </div>
                  </div>
                  <div class="col l-3"></div>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
import TopPage from "@/components/TopPage.vue";
import HeadingSection from "@/components/HeadingSection.vue";
import ProductViewCart from "@/components/ProductViewCart.vue";
import ButtonV4 from "@/components/ButtonV4.vue";

import { ref, reactive, onBeforeMount, computed, watchEffect } from "vue";
import { useStore } from "vuex";
import { toVND } from "@/helpers/functions";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "ViewCartPage",
   components: {
      TopPage,
      HeadingSection,
      ProductViewCart,
      ButtonV4,
   },
   setup() {
      const store = useStore();
      const cart = store.state.cart;
      const productList = ref([]);
      const totalCost = computed(() => {
         let result = 0;
         store.state.cart.forEach((i) => {
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

      function handleRemoveItemCart(productId) {
         const idx = productList.value.findIndex((i) => i.id === productId);
         if (idx > -1) {
            productList.value.splice(idx, 1);
         }
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
         handleRemoveItemCart,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.view-cart {
   .heading-section {
      margin-bottom: 50px;
   }

   &-content {
      padding: 50px 0;
   }

   &-coupon {
      padding: 30px;
      border-radius: 15px;
      box-shadow: $cardShadow;

      .input-v1 {
         font-weight: 700;
         &::placeholder {
            font-weight: 700;
         }
      }
   }

   &-checkout {
      margin-top: 42px;
      padding: 30px;
      border-radius: 15px;
      box-shadow: $cardShadow;
      color: $darkTextColor;

      &-title {
         font-size: 20px;
         text-transform: uppercase;
         font-weight: 800;
         margin-bottom: 30px;
      }

      &-row {
         display: flex;
         align-items: center;

         & + & {
            margin-top: 16px;
         }
      }

      &-label {
         width: 200px;
         font-size: 16px;
         font-weight: 600;
         text-transform: uppercase;
      }

      &-value {
         font-weight: 700;

         span.counpon {
            color: $red;
         }
      }

      &-subtotal-price {
         color: #8799a3;
         font-size: 18px;
      }

      &-total-price {
         color: #39b54a;
         font-size: 22px;
      }

      .button-v4 {
         margin-top: 30px;
      }
   }

   @media (max-width: $maxMobile) {
      &-coupon {
         margin-bottom: 30px;
      }
   }
}

.product-list-none-data {
   color: #bbbbbb;
   font-size: 1.8rem;
   text-align: center;
}
</style>
