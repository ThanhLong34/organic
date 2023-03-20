<template>
   <div class="view-cart">
      <TopPage :currentPage="'View Cart'" />

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
                              v-for="(item, index) in products"
                              :key="index"
                           >
                              <div class="view-cart-product-item">
                                 <ProductViewCart :product="item" />
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="view-cart-bottom">
            <div class="grid wide">
               <div class="row">
                  <div class="col l-6 m-6 s-12">
                     <div class="view-cart-coupon">
                        <InputV1 placeholder="Nhập mã giảm giá" />
                        <button-v-4>ÁP DỤNG MÃ</button-v-4>
                     </div>
                  </div>
                  <div class="col l-6 m-6 s-12">
                     <div class="view-cart-checkout">
                        <p class="view-cart-checkout-title">Tính tiền</p>
                        <div class="view-cart-checkout-row">
                           <div class="view-cart-checkout-label">
                              Tổng tiền sản phẩm:
                           </div>
                           <div
                              class="view-cart-checkout-value view-cart-checkout-subtotal-price"
                           >
                              240.000đ
                           </div>
                        </div>
                        <div class="view-cart-checkout-row">
                           <div class="view-cart-checkout-label">
                              Tổng tiền phải trả:
                           </div>
                           <div
                              class="view-cart-checkout-value view-cart-checkout-total-price"
                           >
                              197.000đ
                              <span class="counpon">&lpar;-30%&rpar;</span>
                           </div>
                        </div>
                        <router-link :to="{ name: 'checkout' }">
                           <button-v-4>TIẾN HÀNH THANH TOÁN</button-v-4>
                        </router-link>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
/* eslint-disable */
import TopPage from "@/components/TopPage.vue";
import HeadingSection from "@/components/HeadingSection.vue";
import ProductViewCart from "@/components/ProductViewCart.vue";
import InputV1 from "@/components/InputV1.vue";
import ButtonV4 from "@/components/ButtonV4.vue";

import { reactive } from "vue";

export default {
   name: "ViewCartPage",
   components: {
      TopPage,
      HeadingSection,
      ProductViewCart,
      InputV1,
      ButtonV4,
   },
   setup() {
      const products = reactive([
         {
				id: 1,
            category: "Fresh",
            image: "exp.png",
            name: "Vegan Egg Replacer",
            price: "280.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 4,
         },
         {
				id: 1,
            category: "Fresh",
            image: "exp1.png",
            name: "Vegan Egg Replacer",
            price: "280.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 5,
         },
         {
				id: 1,
            category: "Fresh",
            image: "exp6.png",
            name: "Vegan Egg Replacer",
            price: "280.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 4,
         },
         {
				id: 1,
            category: "Fresh",
            image: "exp7.png",
            name: "Vegan Egg Replacer",
            price: "280.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 5,
         },
      ]);

      return {
         products,
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
</style>
