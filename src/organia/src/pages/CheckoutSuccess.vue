<template>
  <div class="checkout-success">
    <TopPage :currentPage="'Checkout Success'" />

    <div class="checkout-success-content">
      <div class="grid wide">
        <div class="row">
          <div class="col l-12 m-12 s-12">
            <p class="checkout-success-thank">
              Thank you for shopping with us!
              <br />
              <i class="fa-solid fa-check"></i>
            </p>
            <div class="checkout-success-order-details">
              <heading-section>
                <template #strong>Order </template>
                <template #default>Details</template>
              </heading-section>
              <OrderDetailsFull />
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
import HeadingSection from "@/components/HeadingSection.vue";
import OrderDetailsFull from "@/components/OrderDetailsFull.vue";

export default {
  name: "CheckoutSuccess",
  components: {
    TopPage,
    HeadingSection,
    OrderDetailsFull,
  },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.checkout-success {
  &-content {
    padding: 0 0 50px 0;
  }

  &-thank {
    margin-top: 50px;
    font-size: 40px;
    font-weight: 600;
    letter-spacing: 1px;
    text-align: center;
    color: $darkTextColor;
    line-height: 1.3;

    i {
      margin: 30px auto 0;
      display: block;
      color: $primaryColor;
      font-size: 50px;
      width: 100px;
      height: 100px;
      line-height: 102px;
      text-align: center;
      border-radius: 50%;
      outline: 4px solid $primaryColor;
    }
  }

  &-order-details {
    margin-top: 100px;
  }

  @media (max-width: $maxMobile) {
    &-thank {
      font-size: 24px;

      i {
        margin: 20px auto 0;
        font-size: 30px;
        width: 60px;
        height: 60px;
        line-height: 62px;
      }
    }

    &-order-details {
      margin-top: 50px;
    }
  }
}
</style>
