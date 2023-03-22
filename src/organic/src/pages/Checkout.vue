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
                           label="Địa chỉ nhận hàng"
                           placeholder="Nhập địa chỉ nhận hàng"
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
                              ref="couponCodeCodeRef"
                              label="Mã giảm giá"
                              placeholder="Nhập mã giảm giá"
                              v-model="couponCode.code"
                           />
                           <button-v-5
                              class="coupon-code-btn"
                              :isDisable="isClickedSubmit"
                              @click="handleApplyCouponCode"
                              >ÁP DỤNG</button-v-5
                           >
                           <button-v-5
                              v-if="order.couponCodeId"
                              class="coupon-code-btn remove"
                              :isDisable="isClickedSubmit"
                              @click="handleRemoveCouponCode"
                              >GỠ BỎ</button-v-5
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
                     <button-v-5
                        v-if="$store.state.cart.length > 0"
                        class="checkout-order-btn"
                        :isDisable="isClickedSubmit"
                        @click="handleSubmit"
                        >{{
                           isClickedSubmit ? "VUI LÒNG CHỜ..." : "ĐẶT HÀNG"
                        }}</button-v-5
                     >
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
import { ElNotification } from "element-plus";
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
         isClickedSubmit: false,
      };
   },
   methods: {
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

      handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof this.order.fullname === "string") {
            this.order.fullname = this.order.fullname.trim();
         }

         if (typeof this.order.streetAddress === "string") {
            this.order.streetAddress = this.order.streetAddress.trim();
         }

         if (typeof this.order.city === "string") {
            this.order.city = this.order.city.trim();
         }

         if (typeof this.order.phone === "string") {
            this.order.phone = this.order.phone.trim();
         }

         if (typeof this.order.email === "string") {
            this.order.email = this.order.email.trim();
         }

         if (typeof this.order.notes === "string") {
            this.order.notes = this.order.notes.trim();
         }
      },

      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.order.fullname === "") {
            ElNotification({
               title: "Cảnh báo",
               message: "Bạn chưa nhập họ tên",
               type: "warning",
            });

            return false;
         }

         if (this.order.streetAddress === "") {
            ElNotification({
               title: "Cảnh báo",
               message: "Bạn chưa nhập địa chỉ nhận hàng",
               type: "warning",
            });

            return false;
         }

         if (this.order.city === "") {
            ElNotification({
               title: "Cảnh báo",
               message: "Bạn chưa nhập thành phố / tỉnh",
               type: "warning",
            });

            return false;
         }

         if (this.order.phone === "") {
            ElNotification({
               title: "Cảnh báo",
               message: "Bạn chưa nhập số diện thoại",
               type: "warning",
            });

            return false;
         }

         if (this.order.email === "") {
            ElNotification({
               title: "Cảnh báo",
               message: "Bạn chưa nhập email",
               type: "warning",
            });

            return false;
         }

         return true;
      },

      handleSubmitProductListForOrder(orderId) {
         return API.post(
            apiPath + `/product_order/add_list.php`,
            {
               orderId,
               productListInCart: this.$store.state.cart,
            },
            (data) => {
               if (data.code === 1) {
                  ElNotification({
                     title: "Thành công",
                     message: "Đặt hàng thành công, hãy kiểm tra email của bạn",
                     type: "success",
                  });

                  this.$store.dispatch("resetCart");

                  this.$router.push({
                     name: "checkout_success",
                     params: { orderId },
                  });
               } else {
                  ElNotification({
                     title: "Có lỗi",
                     message: data.message,
                     type: "warning",
                  });
                  this.isClickedSubmit = false;
               }
            }
         );
      },

      handleSubmit() {
         if (!this.validateBeforeSubmit()) return;

         this.isClickedSubmit = true;

         ElNotification({
            title: "Thông báo",
            message: "Quý khách vui lòng đợi cho hệ thống xử lý",
            type: "info",
         });

         return API.post(apiPath + `/order/add.php`, this.order, (data) => {
            if (data.code === 1) {
               // Thêm sản phẩm vào product_order
               this.handleSubmitProductListForOrder(+data.data.id);
            } else {
               ElNotification({
                  title: "Có lỗi",
                  message: data.message,
                  type: "warning",
               });
               this.isClickedSubmit = false;
            }
         });
      },

      handleApplyCouponCode() {
         if (typeof this.couponCode.code === "string") {
            this.couponCode.code = this.couponCode.code.trim();
         }

         if (this.couponCode.code === "") {
            ElNotification({
               title: "Cảnh báo",
               message: "Bạn chưa nhập mã giảm giá",
               type: "warning",
            });
            return;
         }

         return API.post(
            apiPath + `/coupon_code/get_item_by_code.php`,
            {
               code: this.couponCode.code,
            },
            (data) => {
               if (data.code === 1) {
                  ElNotification({
                     title: "Thành công",
                     message: "Áp dụng mã giảm giá thành công",
                     type: "success",
                  });

                  this.couponCode.percentValue = +data.data.percentValue;
                  this.order.couponCodeId = +data.data.id;
               } else {
                  ElNotification({
                     title: "Cảnh báo",
                     message: data.message,
                     type: "warning",
                  });
               }
            }
         );
      },

      handleRemoveCouponCode() {
         this.couponCode.code = "";
         this.couponCode.percentValue = 0;
         this.order.couponCodeId = null;

         this.$refs.couponCodeCodeRef?.resetValue();
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

   &-btn.remove {
      background-color: #3c3c3c;
      margin-left: 24px;
   }
}
</style>
