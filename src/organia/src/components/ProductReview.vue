<template>
   <div class="product-review">
      <p class="product-review-title">3 đánh giá</p>
      <ul class="product-review-list">
         <li class="product-review-item" v-for="i in 2" :key="i">
            <div class="product-review-item-avt">
               <img
                  src="@/assets/images/product_review/avatar.png"
                  alt="avatar"
               />
            </div>
            <div class="product-review-item-info">
               <p class="product-review-item-name">Nguyễn Văn A</p>
               <p class="product-review-item-para">
                  Hàng này chất lượng bật nhất thế giới luôn nè.
               </p>
               <div class="product-review-item-row">
                  <div>
                     <p class="product-review-item-email">
                        <i class="fa-regular fa-envelope"></i>
                        anv@gmail.com
                     </p>
                     <time class="product-review-item-time">
                        <i class="fa-regular fa-clock"></i>
                        06/01/2023
                     </time>
                  </div>
                  <div class="product-review-item-stars">
                     <i class="fa-solid fa-star active"></i>
                     <i class="fa-solid fa-star active"></i>
                     <i class="fa-solid fa-star active"></i>
                     <i class="fa-solid fa-star active"></i>
                     <i class="fa-regular fa-star"></i>
                  </div>
               </div>
            </div>
         </li>
      </ul>
      <p class="product-review-title">Thêm đánh giá</p>
      <div class="product-review-form">
         <!-- rating -->
         <div class="product-review-form-rating">
            <p class="product-review-form-rating-label">Chất lượng:</p>
            <div class="product-review-form-stars" ref="productReviewFormStars">
               <i
                  class="fa-solid fa-star"
                  @mouseenter="handleMouseEnterStar"
                  @mouseleave="handleMouseLeaveStar"
                  @click="handleChooseRating"
                  data-value="1"
               ></i>
               <i
                  class="fa-solid fa-star"
                  @mouseenter="handleMouseEnterStar"
                  @mouseleave="handleMouseLeaveStar"
                  @click="handleChooseRating"
                  data-value="2"
               ></i>
               <i
                  class="fa-solid fa-star"
                  @mouseenter="handleMouseEnterStar"
                  @mouseleave="handleMouseLeaveStar"
                  @click="handleChooseRating"
                  data-value="3"
               ></i>
               <i
                  class="fa-solid fa-star"
                  @mouseenter="handleMouseEnterStar"
                  @mouseleave="handleMouseLeaveStar"
                  @click="handleChooseRating"
                  data-value="4"
               ></i>
               <i
                  class="fa-solid fa-star"
                  @mouseenter="handleMouseEnterStar"
                  @mouseleave="handleMouseLeaveStar"
                  @click="handleChooseRating"
                  data-value="5"
               ></i>
            </div>
         </div>

         <!-- name -->
         <InputV1 placeholder="Nhập họ tên" />
         <!-- mail -->
         <InputV1 placeholder="Nhập email" />
         <!-- comment -->
         <TextAreaV1 placeholder="Nhập bình luận" />

         <!-- submit button -->
         <button-v-2 @click="handleSubmitReview">Gửi đánh giá</button-v-2>
      </div>
   </div>
</template>

<script>
/* eslint-disable */
import ButtonV2 from "@/components/ButtonV2.vue";
import InputV1 from "@/components/InputV1.vue";
import TextAreaV1 from "@/components/TextAreaV1.vue";

import { ref } from "vue";

export default {
   name: "ProductReviewComponent",
   components: {
      ButtonV2,
      InputV1,
      TextAreaV1,
   },
   setup() {
      const productReviewFormStars = ref(null);
      const isRated = ref(false);
      const rating = ref(0);

      function ratingStar(rate) {
         productReviewFormStars.value.childNodes.forEach((i) => {
            if (i.dataset.value <= rate) {
               i.classList.add("active");
            } else {
               i.classList.remove("active");
            }
         });
      }

      function handleSubmitReview() {
         console.log("Submit Review");
      }

      function handleChooseRating(e) {
         isRated.value = true;
         rating.value = parseInt(e.target.dataset.value);
      }

      function handleMouseEnterStar(e) {
         const rate = parseInt(e.target.dataset.value);
         ratingStar(rate);
      }

      function handleMouseLeaveStar(e) {
         // đã rating
         if (isRated.value) {
            ratingStar(rating.value);
         } else {
            productReviewFormStars.value.childNodes.forEach((i) => {
               i.classList.remove("active");
            });
         }
      }

      return {
         isRated,
         productReviewFormStars,
         handleChooseRating,
         handleSubmitReview,
         handleMouseEnterStar,
         handleMouseLeaveStar,
      };
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

.product-review {
   animation: show ease 0.5s forwards;
   padding-top: 16px;

   &-title {
      font-size: 30px;
      font-weight: 600;
      margin-bottom: 0px;
   }

   &-list {
      padding-bottom: 40px;
   }

   &-item {
      display: flex;
      align-items: flex-start;
      padding: 28px 0;

      & + & {
         border-top: 1px solid rgb(223, 223, 223);
      }

      &-avt {
         min-width: 80px;
         max-width: 80px;
         width: 100%;
         margin-right: 30px;
      }

      &-name {
         font-size: 20px;
         font-weight: 600;
         line-height: 1.2;
      }

      &-para {
         font-size: 18px;
         font-weight: 400;
         margin: 8px 0 16px;
         color: #636363;
         line-height: 1.2;
      }

      &-row {
         display: flex;
         justify-content: space-between;

         @media (max-width: $maxMobile) {
            flex-direction: column;
         }
      }

      &-email,
      &-time {
         display: block;
         font-size: 16px;

         i {
            margin-right: 4px;
         }
      }

      &-time {
         color: $primaryColor;
         font-size: 16px;
         text-transform: uppercase;
         font-weight: 600;
         margin-top: 4px;
         margin-bottom: 4px;
      }

      &-stars {
         i {
            font-size: 12px;

            &.active {
               color: #ffa900;
            }
         }
      }
   }

   &-form {
      &-rating {
         display: flex;
         align-items: center;
         padding: 28px 0 24px;

         &-label {
            font-size: 20px;
            font-weight: 500;
            margin-right: 15px;
            color: #636363;
         }
      }

      &-stars {
         i {
            font-size: 32px;
            transition: color ease 0.3s;
            cursor: pointer;
            color: #cfcfcf;

            &.active,
            &:hover {
               color: #ffa900;
            }
         }

         i + i {
            display: inline-block;
            margin-left: 10px;
         }
      }

      .button-v2 {
         margin-top: 0px;
      }
   }

   @media (max-width: $maxMobile) {
      &-item {
         &-avt {
            min-width: 50px;
            max-width: 50px;
            margin-right: 20px;
         }
      }
   }
}
</style>
