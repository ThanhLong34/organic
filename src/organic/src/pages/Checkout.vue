<template>
   <div class="checkout">
      <TopPage :currentPage="'Thanh Toán'" />

      <div class="checkout-content">
         <div class="grid wide">
            <div class="row">
               <div class="col l-7 m-5 s-12">
                  <div class="checkout-billing">
                     <h6 class="checkout-title">Thông tin đơn hàng</h6>
                     <div class="checkout-billing-form">
                        <InputV2
                           label="Họ và tên"
                           placeholder="Nhập họ và tên"
                           :required="true"
                           v-model="order.fullname"
                        />
                        <InputV2
                           label="Địa chỉ nhà"
                           placeholder="Nhập địa chỉ nhà"
                           :required="true"
                           v-model="order.streetAddress"
                        />
                        <InputV2
                           label="Thành phố / Tỉnh"
                           placeholder="Nhập thành phố / tỉnh"
                           :required="true"
                           v-model="order.city"
                        />
                        <InputV2
                           label="Số điện thoại"
                           placeholder="Nhập số điện thoại"
                           :required="true"
                           v-model="order.phone"
                        />
                        <InputV2
                           label="Địa chỉ email"
                           placeholder="Nhập địa chỉ email"
                           :required="true"
                           v-model="order.email"
                        />
                        <TextAreaV2
                           label="Ghi chú đơn hàng"
                           placeholder="Nhập ghi chú"
                           v-model="order.notes"
                        />

                        <div class="coupon-code">
                           <InputV2
                              label="Mã giảm giá"
                              placeholder="Nhập mã giảm giá"
                              v-model="couponCode.code"
                           />
                           <button-v-5
                              class="coupon-code-btn"
                              @click="handleApplyCouponCode"
                              >ÁP DỤNG</button-v-5
                           >
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col l-5 m-7 s-12">
                  <div class="checkout-order">
                     <h6 class="checkout-title">Chi tiết đơn hàng</h6>
                     <OrderDetails
                        :productList="productList"
                        :couponCode="couponCode"
                        :deliveryCost="0"
                        :totalCost="order.totalCost"
                        :paymentCost="paymentCost"
                     />
                     <router-link :to="{ name: 'checkout_success' }">
                        <button-v-5
                           class="checkout-order-btn"
                           @click="handleSubmit"
                           >ĐẶT HÀNG</button-v-5
                        >
                     </router-link>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
import TopPage from "@/components/TopPage.vue";
import InputV2 from "@/components/InputV2.vue";
import TextAreaV2 from "@/components/TextAreaV2.vue";
import OrderDetails from "@/components/OrderDetails.vue";
import ButtonV5 from "@/components/ButtonV5.vue";

import { toVND } from "@/helpers/functions";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "CheckoutPage",
   components: {
      TopPage,
      InputV2,
      TextAreaV2,
      OrderDetails,
      ButtonV5,
   },
   data() {
      return {
         productList: [],
         order: {
            fullname: "",
            streetAddress: "",
            city: "",
            phone: "",
            email: "",
            notes: "",
            couponCodeId: null,
            deliveryCost: 0,
            totalCost: 0,
         },
         couponCode: {
            code: "",
            percentValue: 0,
         },
      };
   },
   methods: {
      handleApplyCouponCode() {},
      handleSubmit() {},
      getProductItem(productId) {
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

                  this.productList.push(product);

                  const quantity = this.$store.state.cart.find(
                     (i) => i.id === productId
                  ).quantity;

                  this.order.totalCost += quantity * product.promotionPrice;
               }
            }
         );
      },
   },
   computed: {
      paymentCost() {
         let result = this.order.deliveryCost + this.order.totalCost;

         if (this.couponCode.percentValue > 0) {
            return (
               result -
               (this.order.totalCost / 100) * this.couponCode.percentValue
            );
         }

         return result;
      },
   },
   created() {
      this.$store.state.cart.forEach((i) => {
         this.getProductItem(i.id);
      });
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.checkout {
   &-content {
      padding: 80px 0;
   }

   &-title {
      margin-bottom: 32px;
      font-size: 24px;
      color: $darkTextColor;
      font-weight: 600;
      text-transform: uppercase;
      border-bottom: 2px solid $primaryColor;
      padding-bottom: 8px;
      display: inline-block;
   }

   &-order {
      &-btn {
         margin-top: 30px;
         width: 100%;
      }
   }

   @media (max-width: $maxMobile) {
      &-billing {
         margin-bottom: 80px;
      }
   }
}

.coupon-code {
   margin-top: 32px;
}
</style>
