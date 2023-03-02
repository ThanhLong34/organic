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
                        v-for="(item, index) in blogs"
                        :key="index"
                        :blog="item"
                     />
                  </div>
                  <!-- pages -->
                  <div class="blog-pages">
                     <PageNumber />
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
/* eslint-disable */
import TopPage from "@/components/TopPage.vue";
import Author from "@/components/Author.vue";
import BlogV2 from "@/components/BlogV2.vue";
import PageNumber from "@/components/PageNumber.vue";
import { reactive } from "vue";

export default {
   name: "BlogPage",
   components: {
      TopPage,
      Author,
      BlogV2,
      PageNumber,
   },
   setup() {
      const blogs = reactive([
         {
            image: "exp1.jpg",
            title: "Easy way to Build a Perfect Agency Website.",
            date: "10 May, 2002",
            description: `
          Sumptuous, filling, and temptingly healthy, our Biona Organic Granola
          with Wild Berries is just the thing to get you out of bed. The goodness
          of rolled wholegrain oats are combined Sumptuous, filling, and
          temptingly healthy, our Biona Organic Granola with Wild Berries is just
          the thing to get you out of bed.
        `,
         },
         {
            image: "exp2.jpg",
            title: "Zechsal Magnesium flakes especially made.",
            date: "10 May, 2002",
            description: `
          Sumptuous, filling, and temptingly healthy, our Biona Organic Granola
          with Wild Berries is just the thing to get you out of bed. The goodness
          of rolled wholegrain oats are combined Sumptuous, filling, and
          temptingly healthy, our Biona Organic Granola with Wild Berries is just
          the thing to get you out of bed.
        `,
         },
         {
            image: "exp3.jpg",
            title: "Our 6 of the Best Organic Grapes to Buy.",
            date: "10 May, 2002",
            description: `
          Sumptuous, filling, and temptingly healthy, our Biona Organic Granola
          with Wild Berries is just the thing to get you out of bed. The goodness
          of rolled wholegrain oats are combined Sumptuous, filling, and
          temptingly healthy, our Biona Organic Granola with Wild Berries is just
          the thing to get you out of bed.
        `,
         },
      ]);

      return {
         blogs,
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
