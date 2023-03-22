<template>
   <div class="checkout-success">
      <TopPage :currentPage="'Đặt đơn hàng thành công'" />

      <div class="checkout-success-content">
         <div class="grid wide">
            <div class="row">
               <div class="col l-12 m-12 s-12">
                  <p class="checkout-success-thank">
                     Đặt hàng thành công!
                     <br />
                     <span class="note"
                        >Trong vòng 15 phút sẽ có bộ phận CSKH gọi tới số
                        <span>{{ order.phone }}</span> để xác nhận đơn hàng của
                        bạn.</span
                     >
                     <br />
                     Cảm ơn bạn đã mua hàng của chúng tôi.
                     <br />
                     <i class="fa-solid fa-check"></i>
                  </p>
                  <div class="checkout-success-order-details">
                     <heading-section>
                        <template #strong>Chi tiết </template>
                        <template #default>đơn hàng</template>
                     </heading-section>
                     <OrderDetailsFull :orderId="+order.id" />
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
import TopPage from "@/components/TopPage.vue";
import HeadingSection from "@/components/HeadingSection.vue";
import OrderDetailsFull from "@/components/OrderDetailsFull.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "CheckoutSuccess",
   components: {
      TopPage,
      HeadingSection,
      OrderDetailsFull,
   },
   data() {
      return {
         order: {},
      };
   },
   methods: {
      getOrder() {
         return API.get(
            apiPath + `/order/get_item.php`,
            {
               id: this.order.id,
            },
            (data) => {
               if (data.code === 1) {
                  this.order = {
                     ...data.data,
                     id: +data.data.id,
                     couponCodeId: +data.data.couponCodeId,
                     deliveryCost: +data.data.deliveryCost,
                     totalCost: +data.data.totalCost,
                     paymentCost: +data.data.paymentCost,
                     orderStatusId: +data.data.orderStatusId,
                  };
               }
            }
         );
      },
   },
   created() {
		this.order.id = this.$route.params.orderId;
      this.getOrder();
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.checkout-success {
   &-content {
      padding: 0 0 50px 0;
   }

   &-thank {
      margin-top: 50px;
      font-size: 28px;
      font-weight: 600;
      letter-spacing: 1px;
      text-align: center;
      color: $darkTextColor;
      line-height: 1.3;

      i {
         margin: 30px auto 0;
         display: block;
         color: $primaryColor;
         font-size: 50px;
         width: 100px;
         height: 100px;
         line-height: 102px;
         text-align: center;
         border-radius: 50%;
         outline: 4px solid $primaryColor;
      }

      .note {
         font-size: 20px;
         color: $primaryColor;

         span {
            color: $darkTextColor;
         }
      }
   }

   &-order-details {
      margin-top: 60px;
   }

   @media (max-width: $maxMobile) {
      &-thank {
         font-size: 24px;

         i {
            margin: 20px auto 0;
            font-size: 30px;
            width: 60px;
            height: 60px;
            line-height: 62px;
         }
      }

      &-order-details {
         margin-top: 50px;
      }
   }
}
</style>
