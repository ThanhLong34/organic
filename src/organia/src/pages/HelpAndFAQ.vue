<template>
  <div class="help-and-faq">
    <TopPage :currentPage="'Help &amp; FAQ'" />
    <div class="help-and-faq-content">
      <div class="grid wide">
        <div class="row">
          <div class="col l-12 m-12 s-12">
            <div class="help-and-faq-item" data-isexp="0">
              <h6 class="help-and-faq-item-heading" @click="handleExpandItem">
                <span>How Can I Get More Attention From Customers?</span>
                <i class="fa-solid fa-chevron-up"></i>
              </h6>
              <p class="help-and-faq-item-para">
                There are many variations of passages of Lorem Ipsum available,
                but the majority have suffered alteration in some form, by
                injected humour, or randomised words which don't look even
                slightly believable. If you are going to use a passage of Lorem
                Ipsum, you need to be sure there isn't anything embarrassing
                hidden in the middle of text.
              </p>
            </div>
          </div>
          <div class="col l-12 m-12 s-12">
            <div class="help-and-faq-item" data-isexp="0">
              <h6 class="help-and-faq-item-heading" @click="handleExpandItem">
                <span>How Can I Get More Attention From Customers?</span>
                <i class="fa-solid fa-chevron-up"></i>
              </h6>
              <p class="help-and-faq-item-para">
                There are many variations of passages of Lorem Ipsum available,
                but the majority have suffered alteration in some form, by
                injected humour, or randomised words which don't look even
                slightly believable. If you are going to use a passage of Lorem
                Ipsum, you need to be sure there isn't anything embarrassing
                hidden in the middle of text.
              </p>
            </div>
          </div>
          <div class="col l-12 m-12 s-12">
            <div class="help-and-faq-item" data-isexp="0">
              <h6 class="help-and-faq-item-heading" @click="handleExpandItem">
                <span>How Can I Get More Attention From Customers?</span>
                <i class="fa-solid fa-chevron-up"></i>
              </h6>
              <p class="help-and-faq-item-para">
                There are many variations of passages of Lorem Ipsum available,
                but the majority have suffered alteration in some form, by
                injected humour, or randomised words which don't look even
                slightly believable. If you are going to use a passage of Lorem
                Ipsum, you need to be sure there isn't anything embarrassing
                hidden in the middle of text.
              </p>
            </div>
          </div>
          <div class="col l-12 m-12 s-12">
            <div class="help-and-faq-item" data-isexp="0">
              <h6 class="help-and-faq-item-heading" @click="handleExpandItem">
                <span>How Can I Get More Attention From Customers?</span>
                <i class="fa-solid fa-chevron-up"></i>
              </h6>
              <p class="help-and-faq-item-para">
                There are many variations of passages of Lorem Ipsum available,
                but the majority have suffered alteration in some form, by
                injected humour, or randomised words which don't look even
                slightly believable. If you are going to use a passage of Lorem
                Ipsum, you need to be sure there isn't anything embarrassing
                hidden in the middle of text.
              </p>
            </div>
          </div>
          <div class="col l-12 m-12 s-12">
            <div class="help-and-faq-item" data-isexp="0">
              <h6 class="help-and-faq-item-heading" @click="handleExpandItem">
                <span>How Can I Get More Attention From Customers?</span>
                <i class="fa-solid fa-chevron-up"></i>
              </h6>
              <p class="help-and-faq-item-para">
                There are many variations of passages of Lorem Ipsum available,
                but the majority have suffered alteration in some form, by
                injected humour, or randomised words which don't look even
                slightly believable. If you are going to use a passage of Lorem
                Ipsum, you need to be sure there isn't anything embarrassing
                hidden in the middle of text.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
/* eslint-disable */
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
