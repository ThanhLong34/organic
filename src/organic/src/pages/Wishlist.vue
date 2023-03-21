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
                           class="col l-6 m-12 s-12"
                           v-for="(item, index) in products"
                           :key="index"
                        >
                           <div class="wishlist-item">
                              <ProductWishlist :product="item" />
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>

import TopPage from "@/components/TopPage.vue";
import HeadingSection from "@/components/HeadingSection.vue";
import ProductWishlist from "@/components/ProductWishlist.vue";
import { reactive } from "vue";

export default {
   name: "WishlistPage",
   components: {
      TopPage,
      HeadingSection,
      ProductWishlist,
   },
   setup() {
      const products = reactive([
         {
				id: 1,
            category: "Fresh",
            image: "exp2.png",
            name: "Vegan Egg Replacer",
            price: "280.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 4,
         },
         {
				id: 1,
            category: "Fresh",
            image: "exp1.png",
            name: "Vegan Egg Replacer",
            price: "280.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 5,
         },
         {
				id: 1,
            category: "Fresh",
            image: "exp6.png",
            name: "Vegan Egg Replacer",
            price: "280.00",
            description:
               "Apparently we had reached a great height in the atmosphere.",
            star: 4,
         },
         {
				id: 1,
            category: "Fresh",
            image: "exp7.png",
            name: "Vegan Egg Replacer",
            price: "280.00",
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

.wishlist {
   &-content {
      padding: 50px 0;
   }
}

.heading-section {
   margin-bottom: 50px;
}
</style>
