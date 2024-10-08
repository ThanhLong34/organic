<template>
   <div class="product-v1">
      <div class="product-v1-img">
         <img
            :src="
               product.featureImageUrl
                  ? product.featureImageUrl
                  : `${require('@/assets/images/no-image.jpg')}`
            "
            alt="product image"
         />
      </div>
      <div class="product-v1-info">
         <h6 class="product-v1-category">{{ product.productCategoryName }}</h6>
         <h5 class="product-v1-name">
            <router-link
               :to="{
                  name: 'shop_details',
                  params: { id: product.id },
               }"
               >{{ product.name }}</router-link
            >
         </h5>
         <p class="product-v1-price">
            <span>{{ toVND(product.promotionPrice) }}</span>
            / {{ product.unit }}
         </p>
         <p class="product-v1-desc">
            {{ product.shortDescription }}
         </p>
         <div class="product-v1-rating">
            <div class="product-v1-rating-stars">
               <i
                  v-for="i in 5"
                  :key="i"
                  :class="{
                     'fa-solid fa-star': true,
                     active:
                        i <=
                        (product.averageRating ? product.averageRating : 0),
                  }"
               ></i>
            </div>
            <div class="product-v1-rating-total">
               &lpar;{{ product.quantityReview }}&rpar;
            </div>
         </div>
         <div class="product-v1-ctrl">
            <div class="product-v1-ctrl-quantity">
               <button
                  class="product-v1-ctrl-sub-btn"
                  @click="handleSubQuantity"
               >
                  &minus;
               </button>
               <span>{{ info.quantity }}</span>
               <button
                  class="product-v1-ctrl-add-btn"
                  @click="handleAddQuantity"
               >
                  &plus;
               </button>
            </div>
            <div class="product-v1-ctrl-other">
               <button-icon
                  :class="{
                     'product-v1-ctrl-wishlist-btn': true,
                     active: checkItemExistWishlistStore(product.id),
                  }"
                  @click="() => handleToggleWishlist(product.id)"
               >
                  <i class="fa-regular fa-heart"></i>
               </button-icon>
               <button-icon
                  :class="{
                     'product-v1-ctrl-addtocart-btn': true,
                     active: checkItemExistCartStore(product.id),
                  }"
                  @click="() => handleToggleCart(product.id)"
               >
                  <i class="fa-solid fa-cart-plus"></i>
               </button-icon>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
import { ref, reactive } from "vue";
import { useStore } from "vuex";

import ButtonIcon from "@/components/ButtonIcon.vue";
import { ElNotification } from "element-plus";

import { toVND, checkItemExistWishlistStore, checkItemExistCartStore } from "@/helpers/functions";

export default {
   name: "ProductV1Component",
   components: {
      ButtonIcon,
   },
   props: {
      product: {
         type: Object,
         required: true,
      },
   },
   setup(props) {
      const store = useStore();

      const info = reactive({
         quantity: 1,
      });

      function handleSubQuantity() {
         if (info.quantity > 1) {
            info.quantity -= 1;
         }
      }

      function handleAddQuantity() {
         if (info.quantity < 99) {
            info.quantity += 1;
         }
      }

      function handleToggleWishlist(productId) {
         if (!checkItemExistWishlistStore(productId)) {
            ElNotification({
               title: "Thông báo",
               message: "Đã thêm sản phẩm vào danh sách thích",
               type: "success",
            });

            store.dispatch("addItemWishlist", productId);
         } else {
            ElNotification({
               title: "Thông báo",
               message: "Đã xóa sản phẩm khỏi danh sách thích",
               type: "info",
            });

            store.dispatch("removeItemWishlist", productId);
         }
      }

      function handleToggleCart(productId) {
         if (!checkItemExistCartStore(productId)) {
            ElNotification({
               title: "Thông báo",
               message: "Đã thêm sản phẩm vào giỏ hàng",
               type: "success",
            });

            store.dispatch("addItemCart", {
               id: productId,
               quantity: info.quantity,
            });
         } else {
            ElNotification({
               title: "Thông báo",
               message: "Đã xóa sản phẩm khỏi giỏ hàng",
               type: "info",
            });

            store.dispatch("removeItemCart", productId);
         }
      }

      return {
         toVND,
         info,
         checkItemExistWishlistStore,
         checkItemExistCartStore,
         handleSubQuantity,
         handleAddQuantity,
         handleToggleWishlist,
         handleToggleCart,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.product-v1 {
   display: flex;
   align-items: center;
   margin-bottom: 50px;

   &-img {
      z-index: 1;
      margin-right: -48px;
      width: 200px;

      img {
         object-fit: contain;
      }
   }

   &-info {
      flex: 1;
      background-color: white;
      border-radius: 15px;
      padding: 36px 20px 20px 68px;
      box-shadow: $cardShadow;
   }

   &-category {
      background: linear-gradient(-90deg, #92c64e 0%, #4baf50 100%);
      padding: 8px 14px;
      border-radius: 20px;
      display: inline-block;
      color: white;
      font-size: 12px;
      margin-bottom: 18px;
   }

   &-name {
      a {
         display: block;
         font-size: 24px;
         font-weight: 600;
         color: $darkTextColor;
         margin-bottom: 12px;
         line-height: 1.2;
         transition: color ease 0.4s;

         &:hover {
            color: $primaryColor;
         }
      }
   }

   &-price {
      font-size: 20px;
      color: $primaryColor;
      margin-bottom: 18px;

      span {
         font-weight: bold;
      }
   }

   &-desc {
      color: #828282;
      font-size: 18px;
      line-height: 1.2;
   }

   &-rating {
      margin: 18px 0;
      display: flex;
      align-items: flex-end;
      color: #c9c9c9;

      &-stars {
         i {
            font-size: 14px;

            &.active {
               color: #ffa900;
            }
         }
      }

      &-total {
         margin-left: 8px;
         color: #818181;
      }
   }

   &-ctrl {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      color: $darkTextColor;

      &-quantity {
         position: relative;
         padding: 3px 3px;
         border-radius: 20px;
         background-color: #f2f2f2;
         display: flex;
         align-items: center;
         justify-content: space-between;
         margin-right: 16px;
         margin-bottom: 16px;

         span {
            font-size: 20px;
            font-weight: 600;
            width: 62px;
            text-align: center;
         }
      }

      &-sub-btn,
      &-add-btn {
         width: 36px;
         height: 36px;
         line-height: 36px;
         border-radius: 50%;
         text-align: center;
         font-size: 26px;
         background-color: white;
         font-weight: 400;
         transition: all ease 0.4s;

         &:hover {
            background-color: $primaryColor;
            color: white;
         }
      }

      &-other {
         margin-bottom: 16px;
      }

      &-wishlist-btn {
         margin-right: 8px;
      }
   }

   @media (max-width: $maxMobile) {
      flex-direction: column;
      align-items: center;

      &-img {
         margin-right: 0;
         position: relative;
         top: 52px;
         max-width: unset;
      }

      &-info {
         width: 100%;
         padding: 36px 20px;
      }
   }
}
</style>
