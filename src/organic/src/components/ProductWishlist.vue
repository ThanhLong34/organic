<template>
   <div class="product-wishlist">
      <div class="product-wishlist-img">
         <img
            :src="
               product.featureImageUrl
                  ? product.featureImageUrl
                  : `${require('@/assets/images/no-image.jpg')}`
            "
            alt="product image"
         />
      </div>
      <div class="product-wishlist-info">
         <button
            class="product-wishlist-remove-btn"
            @click="handleRemoveItemWishlist"
         >
            <i class="fa-solid fa-xmark"></i>
         </button>
         <h6 class="product-wishlist-category">
            {{ product.productCategoryName }}
         </h6>
         <h5 class="product-wishlist-name">
            <router-link
               :to="{
                  name: 'shop_details',
                  params: { id: product.id },
               }"
            >
               {{ product.name }}
            </router-link>
         </h5>
         <p class="product-wishlist-price">
            <span>{{ toVND(product.promotionPrice) }}</span>
            / {{ product.unit }}
         </p>
         <p class="product-wishlist-desc">
            {{ product.shortDescription }}
         </p>
         <div class="product-wishlist-rating">
            <div class="product-wishlist-rating-stars">
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
            <div class="product-wishlist-rating-total">
               &lpar;{{ product.quantityReview }}&rpar;
            </div>
         </div>
         <div class="product-wishlist-ctrl">
            <div class="product-wishlist-ctrl-quantity">
               <button
                  class="product-wishlist-ctrl-sub-btn"
                  @click="handleSubQuantity"
               >
                  &minus;
               </button>
               <span>{{ info.quantity }}</span>
               <button
                  class="product-wishlist-ctrl-add-btn"
                  @click="handleAddQuantity"
               >
                  &plus;
               </button>
            </div>
            <div class="product-wishlist-ctrl-other">
               <button-v-3
                  :class="{
                     'product-wishlist-addtocart-btn': true,
                     remove: checkItemExistCartStore(product.id),
                  }"
                  @click="() => handleToggleCart(product.id)"
               >
                  {{ checkItemExistCartStore(product.id) ? "Xóa khỏi giỏ" : "Thêm vào giỏ" }}
               </button-v-3>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
import { ref, reactive } from "vue";
import { useStore } from "vuex";
import { toVND, checkItemExistCartStore } from "@/helpers/functions";
import { ElNotification } from "element-plus";
import ButtonV3 from "@/components/ButtonV3.vue";

export default {
   name: "ProductWishlistComponent",
   components: {
      ButtonV3,
   },
   emits: ["onRemoveItemWishlist"],
   props: {
      product: {
         type: Object,
         required: true,
      },
   },
   setup(props, { emit }) {
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

      function handleRemoveItemWishlist() {
         store.dispatch("removeItemWishlist", props.product.id);
         emit("onRemoveItemWishlist", props.product.id);
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
         checkItemExistCartStore,
         handleSubQuantity,
         handleAddQuantity,
         handleRemoveItemWishlist,
         handleToggleCart,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.product-wishlist {
   display: flex;
   align-items: center;
   margin-bottom: 50px;
   position: relative;

   &-remove-btn {
      position: absolute;
      top: 12px;
      right: 12px;
      width: 30px;
      height: 30px;
      line-height: 30px;
      text-align: center;
      font-size: 16px;
      border-radius: 50%;
      background-color: transparent;
      border: 2px solid #bbbbbb;
      color: #9b9b9b;
      transition: all ease 0.4s;
      cursor: pointer;

      &:hover {
         color: orangered;
         border-color: orangered;
      }
   }

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
   }

   &-addtocart-btn {
      &.remove {
         background: linear-gradient(-90deg, #b8b8b8 0%, #8f8f8f 100%);

         & i {
            background: #b3b3b3;
         }
      }
   }

   @media (max-width: $maxMobile) {
      flex-direction: column;
      align-items: center;

      &-remove-btn {
         width: 38px;
         height: 38px;
         line-height: 38px;
      }

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

   @media (min-width: $maxTablet + 1px) and (max-width: 1135px),
      (max-width: 400px) {
      &-ctrl {
         flex-direction: column;
         align-items: flex-start;
      }
   }
}
</style>
