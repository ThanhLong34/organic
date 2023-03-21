<template>
   <div class="blog">
      <TopPage :currentPage="'Bài viết'" />

      <div class="blog-content">
         <div class="grid wide">
            <div class="row">
               <div class="col l-9 m-8 s-12">
                  <!-- blogs -->
                  <div class="blog-list">
                     <BlogV2
                        v-for="item in tableData"
                        :key="item.id"
                        :blog="item"
                     />
                  </div>
                  <!-- pages -->
                  <div class="blog-pages">
                     <!-- page number -->
                     <div v-if="totalItem > 0">
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
               <div class="col l-3 m-4 s-12">
                  <!-- about admin -->
                  <Author />
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>

import TopPage from "@/components/TopPage.vue";
import Author from "@/components/Author.vue";
import BlogV2 from "@/components/BlogV2.vue";
import PageNumber from "@/components/PageNumber.vue";

import { ref, reactive, onBeforeMount } from "vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "BlogPage",
   components: {
      TopPage,
      Author,
      BlogV2,
      PageNumber,
   },
   setup() {
      // Table states
      const tableData = ref([]);
      const totalItem = ref(0);
      const numberOfPage = ref(1);
      const currentPage = ref(1);
      const limit = ref(3);
      const offset = ref(0);

      function getTableData() {
         return API.get(
            apiPath + `/blog/get_list.php`,
            {
               limit: limit.value,
               offset: offset.value
            },
            (data) => {
               if (data.code === 1) {
                  // TABLE STATES
                  tableData.value = data.data.map((item) => ({
                     ...item,
                     id: +item.id,
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
			getTableData();
		});

      return {
         tableData,
         totalItem,
         numberOfPage,
         currentPage,
         limit,
         offset,
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

.blog {
   &-content {
      padding: 50px 0 80px;
   }

   .blog-v2 + .blog-v2 {
      margin-top: 100px;
   }

   &-pages {
      margin-top: 50px;
   }

   @media (max-width: $maxMobile) {
      .author {
         margin-top: 100px;
      }
   }
}
</style>
