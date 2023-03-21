<template>
   <div class="help-and-faq">
      <TopPage :currentPage="'Giúp Đỡ &amp; Hỏi Đáp'" />
      <div class="help-and-faq-content">
         <div class="grid wide">
            <div class="row">
               <div class="col l-12 m-12 s-12">
                  <div class="help-and-faq-item" data-isexp="0">
                     <h6
                        class="help-and-faq-item-heading"
                        @click="handleExpandItem"
                     >
                        <span>Làm cách nào để hoàn trả lại tiền?</span>
                        <i class="fa-solid fa-chevron-up"></i>
                     </h6>
                     <p class="help-and-faq-item-para">
                        Chúng tôi có quyền từ chối trả lại bất kỳ hàng hóa nào
                        không đáp ứng các điều kiện hoàn trả ở trên trong duy
                        nhất của chúng tôi tùy ý.
                     </p>
                  </div>
               </div>
               <div class="col l-12 m-12 s-12">
                  <div class="help-and-faq-item" data-isexp="0">
                     <h6
                        class="help-and-faq-item-heading"
                        @click="handleExpandItem"
                     >
                        <span>Điều kiện hủy đơn hàng?</span>
                        <i class="fa-solid fa-chevron-up"></i>
                     </h6>
                     <p class="help-and-faq-item-para">
                        Bạn có quyền hủy Đơn đặt hàng của mình trong vòng 14
                        ngày mà không cần đưa ra bất kỳ lý do để làm như vậy.
                        Thời hạn hủy Đơn hàng là 14 ngày kể từ ngày trên đó Bạn
                        đã nhận được Hàng hóa hoặc trên đó một bên thứ ba mà bạn
                        đã chỉ định, người không phải là người chuyên chở, chiếm
                        hữu sản phẩm được giao.
                     </p>
                  </div>
               </div>
               <div class="col l-12 m-12 s-12">
                  <div class="help-and-faq-item" data-isexp="0">
                     <h6
                        class="help-and-faq-item-heading"
                        @click="handleExpandItem"
                     >
                        <span>Làm sao để tra cứu đơn hàng của bạn?</span>
                        <i class="fa-solid fa-chevron-up"></i>
                     </h6>
                     <p class="help-and-faq-item-para">
                        Bạn vui lòng nhấn vào mục tra cứu đơn hàng ở dưới cùng
                        của website. Nó sẽ dẫn bạn đến trang tra cứu đơn hàng.
                     </p>
                  </div>
               </div>
               <div class="col l-12 m-12 s-12">
                  <div class="help-and-faq-item" data-isexp="0">
                     <h6
                        class="help-and-faq-item-heading"
                        @click="handleExpandItem"
                     >
                        <span
                           >Dịch vụ vận chuyển có hoàn toàn miễn phí
                           không?</span
                        >
                        <i class="fa-solid fa-chevron-up"></i>
                     </h6>
                     <p class="help-and-faq-item-para">
                        Dịch vụ vận chuyển hàng hóa của chúng tôi tới khách hàng
                        hoàn toàn miễn phí, nhưng chỉ áp dụng vận chuyển trong
                        nước Việt Nam.
                     </p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>

import TopPage from "@/components/TopPage.vue";
import { onMounted } from "vue";

export default {
   name: "HelpAndFAQPage",
   components: {
      TopPage,
   },
   setup() {
      onMounted(() => {
         const items = document.querySelectorAll(".help-and-faq-item");
         items.forEach((i) => {
            i.style.cssText = `
          max-height: ${i.firstChild.offsetHeight + 2}px;
        `;
         });

         // set cho item đầu
         items[0].style.cssText = `
        max-height: ${items[0].scrollHeight + 2}px;
      `;
         items[0].setAttribute("data-isexp", 1);
         items[0].firstChild.lastChild.style.cssText = `
        transform: rotate(0);
      `;
      });

      function handleExpandItem(e) {
         const headingNode = e.target.parentNode;
         const iconNode = headingNode.lastChild;
         const target = e.target.parentNode.parentNode;
         let height = 0;

         if (target.dataset.isexp == 0) {
            // expand
            height = target.scrollHeight + 2;
            target.setAttribute("data-isexp", 1);
            iconNode.style.cssText = `
          transform: rotate(0);
        `;
         } else {
            // collapse
            height = headingNode.scrollHeight + 2;
            target.setAttribute("data-isexp", 0);
            iconNode.style = null;
         }

         target.style.cssText = `
        max-height: ${height}px;
      `;
      }

      return { handleExpandItem };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;
.help-and-faq {
   &-content {
      padding: 100px 0 60px;
      background: url("@/assets/images/home/bodybg.png") no-repeat left center
         $bodyColor;
   }

   &-item {
      padding: 0 30px;
      border: 1px solid #cccccc;
      color: $darkTextColor;
      max-height: 88px;
      overflow: hidden;
      transition: all ease 1s;

      &-heading {
         color: inherit;
         font-size: 30px;
         padding: 30px 0 20px;
         font-weight: bold;
         line-height: 1.2;
         display: flex;
         justify-content: space-between;
         align-items: center;
         transition: color ease 0.4s;

         &:hover {
            color: $primaryColor;
            cursor: pointer;
         }

         span {
            flex-grow: 1;
         }

         i {
            transform: rotate(180deg);
            position: relative;
            top: -3px;
            transition: all ease 0.4s;
         }
      }

      &-para {
         font-size: 20px;
         line-height: 1.4;
         padding-bottom: 30px;
         color: #252525;
      }
   }

   @media (max-width: $maxMobile) {
      &-content {
         padding: 50px 0;
      }

      &-item {
         padding: 0 14px;

         &-heading {
            font-size: 24px;
         }

         &-para,
         li {
            font-size: 18px;
         }
      }
   }
}
</style>
