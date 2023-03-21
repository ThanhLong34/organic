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
                                 <span>{{ searchValue }}</span>
                              </p>
                              <p class="information-total">
                                 {{ tableData.length }} sản phẩm trên tổng
                                 {{ totalItem }}
                              </p>
                           </div>
                        </div>
                        <!-- products -->
                        <ul v-if="totalItem > 0" class="row product-list">
                           <li
                              class="col l-3 m-4 s-12"
                              v-for="item in tableData"
                              :key="item.id"
                           >
                              <router-link
                                 :to="{
                                    name: 'shop_details',
                                    params: { id: item.id },
                                 }"
                              >
                                 <ProductV2 :product="item" />
                              </router-link>
                           </li>
                        </ul>
                        <p v-if="totalItem <= 0" class="product-list-none-data">
                           Không có sản phẩm
                        </p>
                        <!-- page number -->
                        <div v-if="totalItem > 0" class="pagination">
                           <PageNumber
                              :numberOfPage="numberOfPage"
                              :currentPage="currentPage"
                              @onChoosePage="handleChoosePage"
                              @onPrevPage="handlePrevPage"
                              @onNextPage="handleNextPage"
                           />
                        </div>
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
import { ref, reactive, onBeforeMount } from "vue";
import { useRoute } from "vue-router";

import TopPage from "@/components/TopPage.vue";
import ProductV2 from "@/components/ProductV2.vue";
import SubscribeMail from "@/components/SubscribeMail.vue";
import Service from "@/components/Service.vue";
import PageNumber from "@/components/PageNumber.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

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
      const route = useRoute();

      // Table states
      const tableData = ref([]);
      const totalItem = ref(0);
      const numberOfPage = ref(1);
      const currentPage = ref(1);
      const limit = ref(12);
      const offset = ref(0);
      const searchValue = ref("");

      function getTableData() {
         return API.get(
            apiPath + `/product/get_list.php`,
            {
               limit: limit.value,
               offset: offset.value,
               searchType: "name",
               searchValue: searchValue.value,
            },
            (data) => {
               if (data.code === 1) {
                  // TABLE STATES
                  tableData.value = data.data.map((item) => ({
                     ...item,
                     id: +item.id,
                     featureImageId: +item.featureImageId,
                     originPrice: +item.originPrice,
                     promotionPrice: +item.promotionPrice,
                     isSpecial: +item.isSpecial == 1,
                     isNew: +item.isNew == 1,
                     isBestOffer: +item.isBestOffer == 1,
                     productCategoryId: +item.productCategoryId,
                     averageRating: +item.averageRating,
                  }));
                  totalItem.value = +data.totalItem;
                  numberOfPage.value = Math.ceil(totalItem.value / limit.value);
               }
            }
         );
      }

      function handleChoosePage(page) {
         currentPage.value = page;
         offset.value = (page - 1) * limit.value;
         getTableData();
      }

      function handleNextPage() {
         currentPage.value++;
         if (currentPage.value >= numberOfPage.value) {
            currentPage.value = numberOfPage.value;
         }
         offset.value = (currentPage.value - 1) * limit.value;
         getTableData();
      }

      function handlePrevPage() {
         currentPage.value--;
         if (currentPage.value <= 1) {
            currentPage.value = 1;
         }
         offset.value = (currentPage.value - 1) * limit.value;
         getTableData();
      }

      onBeforeMount(() => {
         searchValue.value = route.params.productName;
         getTableData();
      });

      return {
         tableData,
         totalItem,
         numberOfPage,
         currentPage,
         limit,
         offset,
         searchValue,
         // handles
         handleChoosePage,
         handleNextPage,
         handlePrevPage,
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

.product-list-none-data {
	color: #bbbbbb;
	font-size: 1.8rem;
	text-align: center;
}
</style>
