<template>
   <table class="order-details">
      <thead>
         <tr>
            <th>#</th>
            <th class="hide-on-400">Ảnh sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Giá</th>
         </tr>
      </thead>
      <tbody v-if="productList && productList.length > 0">
         <tr v-for="(item, index) in productList" :key="item.id">
            <td>
               <p class="order-details-product-no">{{ index + 1 }}</p>
            </td>
            <td class="hide-on-400">
               <div class="order-details-product-img">
                  <img
                     :src="
                        item.featureImageUrl
                           ? item.featureImageUrl
                           : `${require('@/assets/images/no-image.jpg')}`
                     "
                     alt="product image"
                  />
               </div>
            </td>
            <td>
               <h6 class="order-details-product-name">{{ item.name }}</h6>
            </td>
            <td>
               <div class="order-details-product-quantity">
                  {{
                     item.quantity
                        ? item.quantity
                        : $store.state.cart.find((i) => i.id === item.id)
                             ?.quantity ?? null
                  }}
               </div>
            </td>
            <td>
               <div class="order-details-product-price">
                  {{ toVND(item.promotionPrice) }}
               </div>
            </td>
         </tr>
      </tbody>
      <tfoot>
         <tr class="order-details-subtotal">
            <td colspan="2">
               <div class="order-details-subtotal-label">Tổng tiền:</div>
            </td>
            <td colspan="4">
               <div class="order-details-subtotal-value">
                  {{ toVND(totalCost) }}
               </div>
            </td>
         </tr>
         <tr class="order-details-coupon">
            <td colspan="2">
               <div class="order-details-coupon-label">Giảm giá:</div>
            </td>
            <td colspan="4">
               <div class="order-details-coupon-value">
                  &#45;{{ couponCode.percentValue }}&#37;
               </div>
            </td>
         </tr>
         <tr class="order-details-coupon">
            <td colspan="2">
               <div class="order-details-coupon-label">Phí vận chuyển:</div>
            </td>
            <td colspan="4">
               <div class="order-details-coupon-value">
                  {{ toVND(deliveryCost) }}
               </div>
            </td>
         </tr>
         <tr class="order-details-total">
            <td colspan="2">
               <div class="order-details-total-label">Tổng tiền trả:</div>
            </td>
            <td colspan="4">
               <div class="order-details-total-value">
                  {{ toVND(paymentCost) }}
               </div>
            </td>
         </tr>
         <tr class="order-details-shipping">
            <td colspan="5">
               <p class="order-details-shipping-para">
                  Hiện tại chúng tôi chỉ hỗ trợ hình thức thanh toán
                  <br />
                  trả tiền mặt khi nhận hàng
               </p>
            </td>
         </tr>
      </tfoot>
   </table>
</template>

<script>
import { toVND } from "@/helpers/functions";

export default {
   name: "OrderDetailsComponent",
   props: {
      productList: {
         type: Array,
         default() {
            return [];
         },
      },
      couponCode: Object,
      deliveryCost: Number,
      totalCost: Number,
      paymentCost: Number,
   },
   methods: {
      toVND,
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.order-details {
   font-size: 18px;
   border: none;
   border-collapse: collapse;
   width: 100%;
   white-space: wrap;
   max-width: 100%;

   td,
   th {
      text-align: center;
      padding: 10px;
   }

   td {
      border: 1px solid #f1f1f1;
      font-size: 16px;
   }

   thead th {
      color: white;
      background: rgba($primaryColor, 0.6);
   }

   thead th:nth-child(odd) {
      color: white;
      background: $primaryColor;
   }

   tbody {
      tr:nth-child(even) {
         background: rgba($primaryColor, 0.06);
      }
   }

   &-product {
      &-img {
         max-width: 100px;
         margin: 0 auto;
      }

      &-no,
      &-name,
      &-quantity,
      &-price {
         font-size: 16px;
         color: $darkTextColor;
         font-weight: 400;
         line-height: 1.2;
      }

      &-name {
         font-weight: 500;
      }

      &-price {
         font-weight: 600;
         color: $primaryColor;
      }
   }

   &-subtotal,
   &-coupon,
   &-total {
      &-label {
         text-align: left;
         font-weight: 600;
         text-transform: uppercase;
      }

      &-value {
         text-align: right;
      }
   }

   &-subtotal {
      &-value {
         color: #8799a3;
         font-weight: 500;
         font-size: 18px;
      }
   }

   &-coupon {
      &-value {
         font-weight: 400;
         font-size: 18px;
      }
   }

   &-total {
      &-value {
         color: #ff0404;
         font-weight: 700;
         font-size: 20px;
      }
   }

   &-shipping {
      background: rgba($primaryColor, 0.03);

      &-para {
         color: #ff5e00;
         line-height: 1.2;
      }
   }

   @media (max-width: 450px) {
      font-size: 16px;

      td,
      th {
         text-align: center;
         padding: 8px;
      }

      td {
         border: 1px solid #f1f1f1;
         font-size: 14px;
      }
   }
}

.hide-on-400 {
   @media (max-width: 400px) {
      display: none;
   }
}
</style>
