<template>
   <div class="statistical" ref="statisticalNode">
      <div class="grid wide">
         <div class="row">
            <div class="col l-3 m-6 s-12">
               <div class="statistical-item">
                  <div class="statistical-item-icon">
                     <img
                        src="@/assets/images/statistical/person.svg"
                        alt="icon"
                     />
                  </div>
                  <div class="statistical-item-txt">
                     <p class="statistical-item-quantity" data-value="1586">
                        0
                     </p>
                     <p class="statistical-item-label">Khách hàng hài lòng</p>
                  </div>
               </div>
            </div>
            <div class="col l-3 m-6 s-12">
               <div class="statistical-item">
                  <div class="statistical-item-icon">
                     <img
                        src="@/assets/images/statistical/team.svg"
                        alt="icon"
                     />
                  </div>
                  <div class="statistical-item-txt">
                     <p class="statistical-item-quantity" data-value="57">0</p>
                     <p class="statistical-item-label">Đội ngũ chuyên gia</p>
                  </div>
               </div>
            </div>
            <div class="col l-3 m-6 s-12">
               <div class="statistical-item">
                  <div class="statistical-item-icon">
                     <img
                        src="@/assets/images/statistical/product.svg"
                        alt="icon"
                     />
                  </div>
                  <div class="statistical-item-txt">
                     <p class="statistical-item-quantity" data-value="596">0</p>
                     <p class="statistical-item-label">Sản phẩm đã bán</p>
                  </div>
               </div>
            </div>
            <div class="col l-3 m-6 s-12">
               <div class="statistical-item">
                  <div class="statistical-item-icon">
                     <img
                        src="@/assets/images/statistical/award.svg"
                        alt="icon"
                     />
                  </div>
                  <div class="statistical-item-txt">
                     <p class="statistical-item-quantity" data-value="21">0</p>
                     <p class="statistical-item-label">Giải thưởng</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>

import { ref, watch, onMounted } from "vue";
import { checkElementInViewport } from "@/helpers/functions.js";

export default {
   name: "StatisticalComponent",
   setup() {
      const interval = 4000;
      const isActive = ref(false);
      const statisticalNode = ref(null);

      function watchStatisticalActive() {
         if (statisticalNode.value) {
            const paddingStr = getComputedStyle(statisticalNode.value)[
               "padding-top"
            ];
            const paddingValue = parseInt(paddingStr.split("px")[0]);
            const inter = setInterval(() => {
               const statisticalIsViewport = checkElementInViewport(
                  statisticalNode.value,
                  paddingValue
               );
               if (statisticalIsViewport) {
                  isActive.value = true;
                  clearInterval(inter);
               }
            }, 500);
         }
      }

      onMounted(() => {
         watchStatisticalActive();

         watch(
            () => isActive.value == true,
            () => {
               const nums = document.querySelectorAll(
                  ".statistical-item-quantity[data-value]"
               );
               nums.forEach((item) => {
                  let start = 0;
                  let end = parseInt(item.getAttribute("data-value"));
                  const duration = Math.floor(interval / end);
                  const counter = setInterval(() => {
                     start += 1;
                     item.innerText = start;
                     if (start === end) clearInterval(counter);
                  }, duration);
               });
            }
         );
      });

      return {
         statisticalNode,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.statistical {
   padding: 160px 0 110px;
   background-image: url("@/assets/images/statistical/bg.png");
   background-repeat: no-repeat;
   background-position: top center;

   &-item {
      display: flex;
      align-items: center;
      margin-bottom: 40px;

      &-icon {
         padding: 14px;
         width: 80px;
         margin-right: 20px;
         color: $primaryColor;
         position: relative;
         overflow: hidden;
         z-index: 1;

         &::before {
            content: "";
            border-radius: 50%;
            background: linear-gradient(-90deg, #92c64e 0%, #4baf50 100%);
            position: absolute;
            inset: 0;
            z-index: -1;
            opacity: 0.32;
         }
      }

      &-txt {
         color: white;
      }

      &-quantity {
         font-size: 40px;
         font-weight: bold;
         margin-bottom: 8px;
      }

      &-label {
         font-size: 16px;
      }
   }

   @media (max-width: $maxTablet) {
      background-size: cover;

      &-item {
         margin-left: 10vw;
      }
   }
}
</style>
