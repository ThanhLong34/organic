<template>
   <div class="product-viewcart">
      <div class="product-viewcart-img">
         <img
            :src="
               product.featureImageUrl
                  ? product.featureImageUrl
                  : `${require('@/assets/images/no-image.jpg')}`
            "
            alt="product image"
         />
      </div>
      <div class="product-viewcart-info">
         <button
            class="product-viewcart-remove-btn"
            @click="handleRemoveItemCart"
         >
            <i class="fa-solid fa-xmark"></i>
         </button>
         <h6 class="product-viewcart-category">
            {{ product.productCategoryName }}
         </h6>
         <h5 class="product-viewcart-name">
            <router-link
               :to="{
                  name: 'shop_details',
                  params: { id: product.id },
               }"
            >
               {{ product.name }}
            </router-link>
         </h5>
         <p class="product-viewcart-price">
            <span>{{ toVND(product.promotionPrice) }}</span>
            / {{ product.unit }}
         </p>
         <p class="product-viewcart-desc">
            {{ product.shortDescription }}
         </p>
         <div class="product-viewcart-rating">
            <div class="product-viewcart-rating-stars">
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
            <div class="product-viewcart-rating-total">
               &lpar;{{ product.quantityReview }}&rpar;
            </div>
         </div>
         <div class="product-viewcart-ctrl">
            <div class="product-viewcart-ctrl-quantity">
               <button
                  class="product-viewcart-ctrl-sub-btn"
                  @click="handleSubQuantity"
               >
                  &minus;
               </button>
               <span>{{ info.quantity }}</span>
               <button
                  class="product-viewcart-ctrl-add-btn"
                  @click="handleAddQuantity"
               >
                  &plus;
               </button>
            </div>
         </div>
         <div class="product-viewcart-total-price">
            Tổng tiền:
            <span>{{ toVND(info.quantity * product.promotionPrice) }}</span>
         </div>
      </div>
   </div>
</template>

<script>
import { ref, reactive } from "vue";
import { useStore } from "vuex";
import { toVND } from "@/helpers/functions";

export default {
   name: "ProductViewCartComponent",
   components: {},
	emits: ['onRemoveItemCart'],
   props: {
      product: {
         type: Object,
         required: true,
      },
   },
   setup(props, { emit }) {
      const store = useStore();

      const info = reactive({
         quantity: store.state.cart.find(i => i.id === props.product.id)?.quantity ?? 1,
      });

      function handleSubQuantity() {
         if (info.quantity > 1) {
            info.quantity -= 1;
         }

			updateDataInStore();
      }

      function handleAddQuantity() {
         if (info.quantity < 99) {
            info.quantity += 1;
         }

			updateDataInStore();
      }

		function updateDataInStore() {
			store.dispatch('updateItemCart', { id: props.product.id, quantity: info.quantity });
		}

      function handleRemoveItemCart() {
         store.dispatch("removeItemCart", props.product.id);
         emit("onRemoveItemCart", props.product.id);
      }

      return {
         info,
         toVND,
         handleSubQuantity,
         handleAddQuantity,
         handleRemoveItemCart,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.product-viewcart {
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

   &-total-price {
      margin-top: 8px;
      font-size: 22px;
      font-weight: 500;

      span {
         color: #ff0404;
         font-weight: 700;
         font-size: 24px;
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

   @media (max-width: 400px) {
      &-ctrl {
         flex-direction: column;
         align-items: flex-start;
      }

      &-addtocart-btn {
         margin-top: 20px;
      }
   }
}
</style>
