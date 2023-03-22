<template>
   <div class="tracking-order">
      <TopPage :currentPage="'Tra cứu đơn hàng'" />

      <div class="tracking-order-content">
         <div class="grid wide">
            <div class="row">
               <div class="col l-12 m-12 s-12">
                  <div>
                     <heading-section>
                        <template #prefix>Tra cứu </template>
                        <template #strong>Đơn hàng của bạn</template>
                     </heading-section>

                     <div class="row">
                        <div class="col l-6 m-6 s-12">
                           <InputV2
                              label="Mã đơn hàng"
                              :required="true"
                              placeholder="Nhập mã đơn hàng"
                              v-model="order.id"
                           />
                        </div>
                        <div class="col l-6 m-6 s-12">
                           <InputV2
                              label="Email đơn hàng"
                              placeholder="Nhập email đơn hàng"
                              v-model="order.email"
                           />
                        </div>
                     </div>

                     <button-v-5 @click="handleSubmit">TÌM KIẾM</button-v-5>

                     <div
                        class="tracking-order-details"
                        v-if="isShowOrderDetails === true"
                     >
                        <OrderDetailsFull :orderId="+order.id" />
                     </div>
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
import InputV2 from "@/components/InputV2.vue";
import ButtonV5 from "@/components/ButtonV5.vue";

import * as API from "@/helpers/api.js";
import { ElNotification } from "element-plus";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "TrackingOrderComponent",
   components: {
      TopPage,
      HeadingSection,
      OrderDetailsFull,
      InputV2,
      ButtonV5,
   },
   data() {
      return {
         order: {
            id: "",
            email: "",
         },
         isShowOrderDetails: false,
      };
   },
   methods: {
      handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof this.order.id === "string") {
            this.order.id = this.order.id.trim();
         }

         if (typeof this.order.email === "string") {
            this.order.email = this.order.email.trim();
         }
      },

      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.order.id === "") {
            ElNotification({
               title: "Cảnh báo",
               message: "Bạn chưa nhập mã đơn hàng",
               type: "warning",
            });

            return false;
         }

         return true;
      },

      handleSubmit() {
         if (!this.validateBeforeSubmit()) return;

			this.isShowOrderDetails = false;

         return API.get(
            apiPath + `/order/get_item.php`,
            {
               id: +this.order.id,
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

                  this.isShowOrderDetails = true;
               } else {
                  ElNotification({
                     title: "Cảnh báo",
                     message: "Không tìm thấy thông tin đơn hàng",
                     type: "warning",
                  });
               }
            }
         );
      },
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

@keyframes show {
   0% {
      opacity: 0;
   }
   100% {
      opacity: 1;
   }
}

.tracking-order {
   &-content {
      padding: 50px 0;
   }

   &-details {
      animation: show ease 0.6s forwards;
      margin-top: 100px;
   }

   @media (max-width: $maxMobile) {
      &-details {
         margin-top: 50px;
      }
   }
}
</style>
