<template>
   <div class="checkout">
      <TopPage :currentPage="'Thanh Toán'" />

      <div class="checkout-content">
         <div class="grid wide">
            <div class="row">
               <div class="col l-7 m-5 s-12">
                  <div class="checkout-billing">
                     <h6 class="checkout-title">Chi tiết đơn hàng</h6>
                     <div class="checkout-billing-form">
                        <div class="row">
                           <div class="col l-6 m-12 s-12">
                              <InputV2 label="Tên của bạn" :required="true" />
                           </div>
                           <div class="col l-6 m-12 s-12">
                              <InputV2 label="Họ và tên lót" :required="true" />
                           </div>
                        </div>
                        <InputV2 label="Địa chỉ nhà" :required="true" />
                        <InputV2 label="Thành phố" :required="true" />
                        <InputV2 label="Số điện thoại" :required="true" />
                        <InputV2 label="Địa chỉ email" :required="true" />
                        <TextAreaV2 label="Ghi chú đơn hàng" :required="true" />
                     </div>
                  </div>
               </div>
               <div class="col l-5 m-7 s-12">
                  <div class="checkout-order">
                     <h6 class="checkout-title">Đơn hàng của bạn</h6>
                     <OrderDetails />
                     <router-link :to="{ name: 'checkout_success' }">
                        <button-v-5 class="checkout-order-btn"
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
/* eslint-disable */
import TopPage from "@/components/TopPage.vue";
import InputV2 from "@/components/InputV2.vue";
import TextAreaV2 from "@/components/TextAreaV2.vue";
import OrderDetails from "@/components/OrderDetails.vue";
import ButtonV5 from "@/components/ButtonV5.vue";

export default {
   name: "CheckoutPage",
   components: {
      TopPage,
      InputV2,
      TextAreaV2,
      OrderDetails,
      ButtonV5,
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
</style>
