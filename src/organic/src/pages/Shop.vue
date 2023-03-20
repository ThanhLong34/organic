<template>
   <div class="shop">
      <TopPage :currentPage="'Cửa hàng'" />
      <div class="shop-content">
         <!-- services -->
         <section class="service-section">
            <Service />
         </section>
         <!-- sidebar & tableData -->
         <section class="main-section">
            <div class="grid wide">
               <div class="row">
                  <div class="col l-3 m-12 s-12">
                     <SidebarShop
                        @onFillByProductCategory="handleFillByProductCategory"
                        @onSort="handleSort"
                     />
                  </div>
                  <div class="col l-9 m-12 s-12">
                     <div class="product-list-table">
                        <!-- information: total product -->
                        <div class="information">
                           <div class="information-content">
                              <p class="information-total">
                                 {{ tableData.length }} sản phẩm trên tổng
                                 {{ totalItem }}
                              </p>
                           </div>
                        </div>
                        <!-- tableData -->
                        <ul v-if="totalItem > 0" class="row product-list">
                           <li
                              class="col l-4 m-4 s-12"
                              v-for="item in tableData"
                              :key="item.id"
                           >
                              <ProductV2 :product="item" />
                           </li>
                        </ul>
								<p v-if="totalItem <= 0" class="product-list-none-data">Không có sản phẩm</p>
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
/* eslint-disable */
import { ref, reactive } from "vue";

import TopPage from "@/components/TopPage.vue";
import ProductV2 from "@/components/ProductV2.vue";
import SubscribeMail from "@/components/SubscribeMail.vue";
import Service from "@/components/Service.vue";
import SidebarShop from "@/components/SidebarShop.vue";
import PageNumber from "@/components/PageNumber.vue";

import { ElMessage } from "element-plus";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "ShopPage",
   components: {
      TopPage,
      ProductV2,
      SubscribeMail,
      Service,
      SidebarShop,
      PageNumber,
   },
   setup() {
      // Table states
      const tableData = ref([]);
      const totalItem = ref(0);
      const numberOfPage = ref(1);
      const currentPage = ref(1);
      const limit = ref(9);
      const offset = ref(0);
      const fillByProductCategoryValue = ref("");
      const sortValue = ref("");

      function getTableData() {
         return API.get(
            apiPath + `/product/get_list.php`,
            {
               limit: limit.value,
               offset: offset.value,
               fillType: "productCategoryId",
               fillValue: (() => {
                  if (fillByProductCategoryValue.value !== "") {
                     return fillByProductCategoryValue.value;
                  }

                  return "";
               })(),
               orderby: (() => {
                  if (sortValue.value) {
                     return sortValue.value.split("_")[0];
                  }
                  return "id";
               })(),
               reverse: (() => {
                  if (sortValue.value) {
                     return sortValue.value.split("_")[1] === "DESC";
                  }
                  return false;
               })(),
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
         // console.log(page);
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

      function handleFillByProductCategory(productCategoryId) {
         if (productCategoryId === "") return;

         fillByProductCategoryValue.value = productCategoryId;

         // Reset limit & offset
         currentPage.value = 1;
         limit.value = 9;
         offset.value = 0;

         getTableData();
      }

      function handleSort(val) {
         sortValue.value = val;

         // Reset limit & offset
         currentPage.value = 1;
         limit.value = 9;
         offset.value = 0;

         getTableData();
      }

      return {
         tableData,
         totalItem,
         numberOfPage,
         currentPage,
         limit,
         offset,
         fillByProductCategoryValue,
         sortValue,
         // handles
         handleChoosePage,
         handleNextPage,
         handlePrevPage,
         handleFillByProductCategory,
         handleSort,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.shop-content {
   background-color: white;
}

.information {
   margin-bottom: 30px;

   &-content {
      display: flex;
      justify-content: flex-end;
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

   @media (max-width: $maxTablet) {
      border-top: 2px solid rgb(235, 235, 235);
      padding: 60px 0 30px;

      &-content {
         flex-direction: column;
      }
   }
}

.contact-mail-section {
   padding: 50px 0 100px;
}

.product-list-table {
   display: flex;
   flex-direction: column;
   height: 100%;
}

.product-list {
   place-content: flex-start;
   flex-grow: 1;
}

.pagination {
   align-items: flex-end;
}

.product-list-none-data {
	color: #bbbbbb;
	font-size: 1.8rem;
	text-align: center;
}
</style>
