<template>
   <div class="author">
      <h6 class="author-title">Tác giả</h6>
      <div class="author-avt">
         <img src="@/assets/images/author/avatar.gif" alt="avatar" />
      </div>
      <h5 class="author-name">Thành Long</h5>
      <p class="author-desc">
         Chào bạn, mình là Admin và đồng thời cũng là Creator của website này.
         <br />
         🐧🐧🐧
      </p>
      <div class="author-social-list">
         <a href="https://vi-vn.facebook.com/" class="author-social-item">
            <i class="fa-brands fa-facebook-f"></i>
         </a>
         <a href="https://twitter.com/?lang=vi" class="author-social-item">
            <i class="fa-brands fa-twitter"></i>
         </a>
         <a href="https://www.google.com/" class="author-social-item">
            <i class="fa-brands fa-google-plus-g"></i>
         </a>
         <a href="https://www.instagram.com/" class="author-social-item">
            <i class="fa-brands fa-instagram"></i>
         </a>
      </div>
   </div>
</template>

<script>
export default {
   name: "AuthorComponent",
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.author {
   padding: 44px 32px;
   border-radius: 20px;
   background-color: #f1f1f1;
   color: $darkTextColor;
   text-align: center;
   max-width: 300px;
   margin: 0 auto;

   &-title {
      text-transform: uppercase;
      font-size: 20px;
      font-weight: 800;
   }

   &-avt {
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 30px auto;

      img {
         aspect-ratio: 1;
         height: 100%;
         border-radius: 50%;
         object-position: center 28%;
         object-fit: 40%;
         outline: 5px solid $primaryColor;
         box-shadow: $cardShadow;
      }
   }

   &-name {
      font-size: 20px;
      color: #363636;
   }

   &-desc {
      margin: 20px 0;
      font-size: 16px;
      line-height: 1.3;
   }

   &-social {
      &-item {
         display: inline-block;
         color: #959595;
         font-size: 18px;
         width: 30px;
         height: 30px;
         line-height: 36px;
         text-align: center;
         background-color: transparent;
         transition: color ease 0.4s;

         &:hover {
            color: $primaryColor;
         }

         & + & {
            margin-left: 5px;
         }
      }
   }
}
</style>
