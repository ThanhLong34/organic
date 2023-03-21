<template>
   <div class="wishlist">
      <TopPage :currentPage="'Danh Sách Thích'" />

      <div class="wishlist-content">
         <div class="grid wide">
            <div class="row">
               <div class="col l-12 m-12 s-12">
                  <heading-section>
                     <template #strong>Danh sách thích</template>
                     <template #default> của bạn</template>
                  </heading-section>
               </div>
               <div class="col l-12 m-12 s-12">
                  <div class="wishlist-list">
                     <div class="row">
                        <div
                           v-for="item in productList"
                           :key="item.id"
                           class="col l-6 m-12 s-12"
                        >
                           <div class="wishlist-item">
                              <ProductWishlist
                                 :product="item"
                                 @onRemoveItemWishlist="
                                    handleRemoveItemWishlist
                                 "
                              />
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div v-if="productList.length <= 0" class="col l-12 m-12 s-12">
                  <p class="product-list-none-data">Không có sản phẩm</p>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
import { ref, onBeforeMount } from "vue";
import { useStore } from "vuex";

import TopPage from "@/components/TopPage.vue";
import HeadingSection from "@/components/HeadingSection.vue";
import ProductWishlist from "@/components/ProductWishlist.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "WishlistPage",
   components: {
      TopPage,
      HeadingSection,
      ProductWishlist,
   },
   setup() {
      const store = useStore();
      const wishlist = store.state.wishlist;
      const productList = ref([]);

      function getProductItem(productId) {
         return API.get(
            apiPath + `/product/get_item.php`,
            {
               id: productId,
            },
            (data) => {
               if (data.code === 1) {
                  const product = {
                     ...data.data,
                     id: +data.data.id,
                     featureImageId: +data.data.featureImageId,
                     originPrice: +data.data.originPrice,
                     promotionPrice: +data.data.promotionPrice,
                     isSpecial: +data.data.isSpecial == 1,
                     isNew: +data.data.isNew == 1,
                     isBestOffer: +data.data.isBestOffer == 1,
                     productCategoryId: +data.data.productCategoryId,
                     averageRating: +data.data.averageRating,
                  };

                  productList.value.push(product);
               }
            }
         );
      }

      function handleRemoveItemWishlist(productId) {
         const idx = productList.value.findIndex((i) => i.id === productId);
         if (idx > -1) {
            productList.value.splice(idx, 1);
         }
      }

      onBeforeMount(() => {
         if (Array.isArray(wishlist)) {
            wishlist.forEach((i) => {
               getProductItem(i);
            });
         }
      });

      return {
         productList,
         handleRemoveItemWishlist,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.wishlist {
   &-content {
      padding: 50px 0;
   }
}

.heading-section {
   margin-bottom: 50px;
}

.product-list-none-data {
   color: #bbbbbb;
   font-size: 1.8rem;
   text-align: center;
}
</style>
