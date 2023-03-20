<template>
   <div class="shop-search">
      <TopPage :currentPage="'Kết quả tìm kiếm'" />
      <div class="shop-search-content">
         <!-- services -->
         <section class="service-section">
            <Service />
         </section>
         <!-- sidebar & products -->
         <section class="main-section">
            <div class="grid wide">
               <div class="row">
                  <div class="col l-12 m-12 s-12">
                     <div>
                        <!-- information: search & total product -->
                        <div class="information">
                           <div class="information-content">
                              <p class="information-search">
                                 Tìm kiếm cho:
                                 <span>Fresh Tomatoes</span>
                              </p>
                              <p class="information-total">
                                 12 sản phẩm trên tổng 45
                              </p>
                           </div>
                        </div>
                        <!-- products -->
                        <ul class="row product-list">
                           <li
                              class="col l-3 m-4 s-12"
                              v-for="(item, index) in products"
                              :key="index"
                           >
                              <router-link
                                 :to="{
                                    name: 'shop_details',
                                    params: { id: 1 },
                                 }"
                              >
                                 <ProductV2 :product="item" />
                              </router-link>
                           </li>
                        </ul>
                        <!-- page number -->
                        <PageNumber />
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- contact mail -->
         <section class="contact-mail-section">
            <SubscribeMail />
         </section>
      </div>
   </div>
</template>

<script>
/* eslint-disable */
import TopPage from "@/components/TopPage.vue";
import ProductV2 from "@/components/ProductV2.vue";
import SubscribeMail from "@/components/SubscribeMail.vue";
import Service from "@/components/Service.vue";
import PageNumber from "@/components/PageNumber.vue";

import { reactive } from "vue";

export default {
   name: "ShopSearchPage",
   components: {
      TopPage,
      ProductV2,
      SubscribeMail,
      Service,
      PageNumber,
   },
   setup() {
      const products = reactive([
         {
				id: 1,
            category: "Fresh",
            image: "exp.png",
            name: "Vegan Egg Replacer",
            priceOld: "280.00",
            priceNew: "180.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 4,
         },
         {
				id: 1,
            category: "Fresh",
            image: "exp1.png",
            name: "Vegan Egg Replacer",
            priceOld: "280.00",
            priceNew: "180.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 5,
         },
         {
				id: 1,
            category: "Fresh",
            image: "exp2.png",
            name: "Vegan Egg Replacer",
            priceOld: "280.00",
            priceNew: "180.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 4,
         },
         {
				id: 1,
            category: "Fresh",
            image: "exp3.png",
            name: "Vegan Egg Replacer",
            priceOld: "280.00",
            priceNew: "180.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 5,
         },
      ]);

      return {
         products,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.shop-search-content {
   background-color: white;
}

.information {
   margin-bottom: 30px;

   &-content {
      display: flex;
      justify-content: space-between;
      align-items: center;
   }

   &-total {
      text-align: center;
      font-size: 18px;
      color: #888;
      padding: 15px 24px;
      border-radius: 24px;
      background-color: white;
      box-shadow: $cardShadow;
      display: inline-block;
   }

   &-search {
      font-size: 26px;
      font-weight: 600;
      color: $darkTextColor;
      line-height: 1.2;

      span {
         color: $primaryColor;
      }
   }

   @media (max-width: $maxTablet) {
      border-top: 2px solid rgb(235, 235, 235);
      padding: 60px 0 30px;

      &-content {
         flex-direction: column;
      }

      &-search {
         margin-bottom: 14px;
      }
   }

   @media (max-width: $maxMobile) {
      &-search {
         font-size: 20px;
      }
   }
}

.contact-mail-section {
   padding: 100px 0;
}
</style>
