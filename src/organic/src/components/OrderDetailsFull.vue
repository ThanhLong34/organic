<template>
   <div class="order-details-full">
      <h6 class="order-details-full-row order-details-full-orther-number">
         <div class="order-details-full-label">Mã đơn hàng:</div>
         <div class="order-details-full-value">&#35;{{ order.id }}</div>
      </h6>
      <div class="order-details-full-row order-details-full-orther-number">
         <div class="order-details-full-label">Thời gian:</div>
         <div class="order-details-full-value">{{ order.createdAt }}</div>
      </div>
      <h6 class="order-details-full-row order-details-full-fullname">
         <div class="order-details-full-label">Họ tên:</div>
         <div class="order-details-full-value">{{ order.fullname }}</div>
      </h6>
      <div class="order-details-full-row order-details-full-street">
         <div class="order-details-full-label">Địa chỉ nhà:</div>
         <div class="order-details-full-value">{{ order.streetAddress }}</div>
      </div>
      <div class="order-details-full-row order-details-full-city">
         <div class="order-details-full-label">Thành phố:</div>
         <div class="order-details-full-value">{{ order.city }}</div>
      </div>
      <div class="order-details-full-row order-details-full-phone">
         <div class="order-details-full-label">Số điện thoại:</div>
         <div class="order-details-full-value">{{ order.phone }}</div>
      </div>
      <div class="order-details-full-row order-details-full-mail">
         <div class="order-details-full-label">Địa chỉ email:</div>
         <div class="order-details-full-value">{{ order.email }}</div>
      </div>
      <div class="order-details-full-row order-details-full-notes">
         <div class="order-details-full-label">Ghi chú:</div>
         <div class="order-details-full-value">
            {{ order.notes }}
         </div>
      </div>

      <OrderDetails
         :productList="productList"
         :couponCode="couponCode"
         :deliveryCost="0"
         :totalCost="order.totalCost"
         :paymentCost="order.paymentCost"
      />

      <div class="order-details-full-toshop-btn">
         <router-link :to="{ name: 'shop', params: { productCategoryId: 0 } }">
            <button-v-5>TIẾP TỤC MUA SẮM</button-v-5>
         </router-link>
      </div>
   </div>
</template>

<script>
import OrderDetails from "@/components/OrderDetails.vue";
import ButtonV5 from "./ButtonV5.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "OrderDetailsFullComponent",
   components: {
      OrderDetails,
      ButtonV5,
   },
	props: {
		orderId: Number
	},
   data() {
      return {
         order: {},
			couponCode: {},
         productList: [],
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
		getCouponCode() {
			return API.get(
            apiPath + `/coupon_code/get_item.php`,
            {
               id: this.order.couponCodeId,
            },
            (data) => {
               if (data.code === 1) {
                  this.couponCode = {
							...data.data,
							id: +data.data.id,
							percentValue: +data.data.percentValue
						};
               }
            }
         );
		},
      getProductOrder() {
         return API.get(
            apiPath + `/product_order/get_list_by_order_id.php`,
            {
               orderId: this.order.id,
            },
            (data) => {
               if (data.code === 1) {
                  this.productList = data.data.map((i) => ({
                     ...i,
							id: +i.id,
							featureImageId: +i.featureImageId,
                     originPrice: +i.originPrice,
                     promotionPrice: +i.promotionPrice,
                     isSpecial: +i.isSpecial == 1,
                     isNew: +i.isNew == 1,
                     isBestOffer: +i.isBestOffer == 1,
                     productCategoryId: +i.productCategoryId,
                     averageRating: +i.averageRating,
                     quantity: +i.quantity,
                  }));
               }
            }
         );
      },
   },
   async created() {
      this.order.id = this.$props.orderId;
      await this.getOrder();
      await this.getCouponCode();
      await this.getProductOrder();
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
