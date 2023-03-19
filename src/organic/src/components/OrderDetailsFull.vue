<template>
   <div class="order-details-full">
      <h6 class="order-details-full-row order-details-full-orther-number">
         <div class="order-details-full-label">Mã đơn hàng:</div>
         <div class="order-details-full-value">#001</div>
      </h6>
      <div class="order-details-full-row order-details-full-orther-number">
         <div class="order-details-full-label">Thời gian:</div>
         <div class="order-details-full-value">16/05/2022</div>
      </div>
      <h6 class="order-details-full-row order-details-full-fullname">
         <div class="order-details-full-label">Họ tên:</div>
         <div class="order-details-full-value">Thành Long</div>
      </h6>
      <div class="order-details-full-row order-details-full-street">
         <div class="order-details-full-label">Địa chỉ nhà:</div>
         <div class="order-details-full-value">24 Vạn Xuân</div>
      </div>
      <div class="order-details-full-row order-details-full-city">
         <div class="order-details-full-label">Thành phố:</div>
         <div class="order-details-full-value">Đà Lạt</div>
      </div>
      <div class="order-details-full-row order-details-full-phone">
         <div class="order-details-full-label">Số điện thoại:</div>
         <div class="order-details-full-value">0353292241</div>
      </div>
      <div class="order-details-full-row order-details-full-mail">
         <div class="order-details-full-label">Địa chỉ email:</div>
         <div class="order-details-full-value">dragondevshop@gmail.com</div>
      </div>
      <div class="order-details-full-row order-details-full-notes">
         <div class="order-details-full-label">Ghi chú:</div>
         <div class="order-details-full-value">
            Shop giao hàng sớm nhé, giao vào buổi chiều lúc 1h đến 5h em mới có
            ở nhà nhé.
         </div>
      </div>

      <OrderDetails />

      <div class="order-details-full-toshop-btn">
         <router-link
            :to="{ name: 'shop', params: { categoryName: 'show-all' } }"
         >
            <button-v-5>TIẾP TỤC MUA SẮM</button-v-5>
         </router-link>
      </div>
   </div>
</template>

<script>
/* eslint-disable */
import OrderDetails from "@/components/OrderDetails.vue";
import ButtonV5 from "./ButtonV5.vue";

export default {
   name: "OrderDetailsFullComponent",
   components: {
      OrderDetails,
      ButtonV5,
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.order-details-full {
   &-row {
      display: flex;
      align-items: flex-start;
      padding: 20px 15px;
      font-size: 24px;
      line-height: 1.4;

      &:nth-child(even) {
         background-color: rgba($primaryColor, 0.06);
      }
   }

   &-label {
      font-weight: 700;
      min-width: 200px;
      color: $primaryColor;
   }

   &-value {
      font-weight: 500;
      color: $darkTextColor;
   }

   &-mail &-value {
      word-break: break-all;
   }

   &-toshop-btn {
      display: flex;
      justify-content: center;
      align-items: center;
   }

   .order-details {
      margin: 50px 0;
   }

   @media (max-width: $maxMobile) {
      &-row {
         flex-direction: column;
         align-items: flex-start;
         font-size: 20px;
      }
   }
}
</style>
