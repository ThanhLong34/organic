<template>
  <div class="order-details-full">
    <h6 class="order-details-full-row order-details-full-orther-number">
      <div class="order-details-full-label">Order number:</div>
      <div class="order-details-full-value">#001</div>
    </h6>
    <div class="order-details-full-row order-details-full-orther-number">
      <div class="order-details-full-label">Date:</div>
      <div class="order-details-full-value">16 May, 2022</div>
    </div>
    <h6 class="order-details-full-row order-details-full-fullname">
      <div class="order-details-full-label">Fullname:</div>
      <div class="order-details-full-value">Thành Long</div>
    </h6>
    <address class="order-details-full-address">
      <div class="order-details-full-row order-details-full-country">
        <div class="order-details-full-label">Country:</div>
        <div class="order-details-full-value">Vietnam</div>
      </div>
      <div class="order-details-full-row order-details-full-street">
        <div class="order-details-full-label">Street Address:</div>
        <div class="order-details-full-value">88 road, borklyn street, USA</div>
      </div>
      <div class="order-details-full-row order-details-full-city">
        <div class="order-details-full-label">City:</div>
        <div class="order-details-full-value">Dalat</div>
      </div>
      <div class="order-details-full-row order-details-full-phone">
        <div class="order-details-full-label">Phone:</div>
        <div class="order-details-full-value">0353292241</div>
      </div>
      <div class="order-details-full-row order-details-full-mail">
        <div class="order-details-full-label">Email Address:</div>
        <div class="order-details-full-value">thanhlongedu0304@gmail.com</div>
      </div>
      <div class="order-details-full-row order-details-full-notes">
        <div class="order-details-full-label">Your Notes:</div>
        <div class="order-details-full-value">
          Lorem Ipsum is simply dummy text of the printing and typesetting
          industry.
        </div>
      </div>
    </address>

    <OrderDetails />

    <div class="order-details-full-toshop-btn">
      <router-link
        :to="{ name: 'shop', params: { categoryName: 'category-name' } }"
      >
        <button-v-5>CONTINUE TO SHOP</button-v-5>
      </router-link>
    </div>
  </div>
</template>

<script>
/* eslint-disable */
import OrderDetails from "@/components/OrderDetails.vue";
import ButtonV5 from "./ButtonV5.vue";

export default {
  name: "OrderDetailsFullComponent",
  components: {
    OrderDetails,
    ButtonV5,
  },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.order-details-full {
  &-row {
    display: flex;
    align-items: flex-start;
    padding: 20px 15px;
    font-size: 24px;
    line-height: 1.4;

    &:nth-child(even) {
      background-color: rgba($primaryColor, 0.06);
    }
  }

  &-label {
    font-weight: 700;
    min-width: 200px;
    color: $primaryColor;
  }

  &-value {
    font-weight: 500;
    color: $darkTextColor;
  }

  &-mail &-value {
    word-break: break-all;
  }

  &-toshop-btn {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .order-details {
    margin: 50px 0;
  }

  @media (max-width: $maxMobile) {
    &-row {
      flex-direction: column;
      align-items: flex-start;
      font-size: 20px;
    }
  }
}
</style>
