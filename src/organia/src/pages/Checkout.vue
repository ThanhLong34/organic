<template>
  <div class="checkout">
    <TopPage :currentPage="'Checkout'" />

    <div class="checkout-content">
      <div class="grid wide">
        <div class="row">
          <div class="col l-7 m-5 s-12">
            <div class="checkout-billing">
              <h6 class="checkout-title">Billing details</h6>
              <div class="checkout-billing-form">
                <div class="row">
                  <div class="col l-6 m-12 s-12">
                    <InputV2 label="First Name *" :required="true" />
                  </div>
                  <div class="col l-6 m-12 s-12">
                    <InputV2 label="Last Name *" :required="true" />
                  </div>
                </div>
                <InputV2 label="Country *" :required="true" />
                <InputV2 label="Street Address *" :required="true" />
                <InputV2 label="Town / City *" :required="true" />
                <InputV2 label="Phone *" :required="true" />
                <InputV2 label="Email Address *" :required="true" />
                <TextAreaV2 label="Order Notes *" :required="true" />
              </div>
            </div>
          </div>
          <div class="col l-5 m-7 s-12">
            <div class="checkout-order">
              <h6 class="checkout-title">Your order</h6>
              <OrderDetails />
              <router-link :to="{ name: 'checkout_success' }">
                <button-v-5 class="checkout-order-btn">PLACE ORDER</button-v-5>
              </router-link>
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
import InputV2 from "@/components/InputV2.vue";
import TextAreaV2 from "@/components/TextAreaV2.vue";
import OrderDetails from "@/components/OrderDetails.vue";
import ButtonV5 from "@/components/ButtonV5.vue";

export default {
  name: "CheckoutPage",
  components: {
    TopPage,
    InputV2,
    TextAreaV2,
    OrderDetails,
    ButtonV5,
  },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.checkout {
  &-content {
    padding: 80px 0;
  }

  &-title {
    margin-bottom: 32px;
    font-size: 24px;
    color: $darkTextColor;
    font-weight: 600;
    text-transform: uppercase;
    border-bottom: 2px solid $primaryColor;
    padding-bottom: 8px;
    display: inline-block;
  }

  &-order {
    &-btn {
      margin-top: 30px;
      width: 100%;
    }
  }

  @media (max-width: $maxMobile) {
    &-billing {
      margin-bottom: 80px;
    }
  }
}
</style>
