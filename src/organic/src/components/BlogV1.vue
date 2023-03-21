<template>
   <div class="blog-v1">
      <div class="blog-v1-img">
         <router-link
            :to="{
               name: 'blog_details',
               params: {
                  id: blog.id
               },
            }"
         >
            <img
               :src="
                  blog.featureImageUrl
                     ? blog.featureImageUrl
                     : `${require('@/assets/images/no-image.jpg')}`
               "
               alt="blog image"
            />
         </router-link>
      </div>
      <div class="blog-v1-txt">
         <time class="blog-v1-time">
            <i class="fa-solid fa-calendar-days"></i>
            {{ blog.createdAt }}
         </time>
         <h6 class="blog-v1-title">
            <router-link
               :to="{
                  name: 'blog_details',
                  params: {
                     id: blog.id
                  },
               }"
            >
               {{ blog.title }}
            </router-link>
         </h6>
      </div>
   </div>
</template>

<script>
export default {
   name: "BlogV1Component",
   props: {
      blog: {
			type: Object,
			required: true
		},
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.blog-v1 {
   border-radius: 18px;
   overflow: hidden;
   cursor: pointer;

   &:hover &-img {
      &::before {
         left: 0;
         right: 0;
         opacity: 0;
         transition: all 400ms linear;
      }
   }

   &:hover &-title a {
      color: $primaryColor;
   }

   &-img {
      position: relative;
      overflow: hidden;

      img {
         aspect-ratio: 1 / 0.8;
      }

      &::before {
         background: rgba(255, 255, 255, 0.2);
         bottom: 0;
         content: "";
         left: 50%;
         position: absolute;
         right: 51%;
         top: 0;
         opacity: 1;
         pointer-events: none;
         transition: all 400ms linear;
      }
   }

   &-txt {
      padding: 28px 24px;
      background-color: #f9f9f9;
   }

   &-time {
      display: block;
      font-size: 14px;
      color: $primaryColor;
      margin-bottom: 15px;
      text-transform: uppercase;

      i {
         margin-right: 5px;
      }
   }

   &-title {
      a {
         font-size: 22px;
         line-height: 1.2;
         color: $darkTextColor;
         font-weight: 500;
         transition: color ease 0.5s;
      }
   }

   @media (max-width: $maxTablet) {
      margin-bottom: 60px;
   }
}
</style>
