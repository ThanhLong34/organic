<template>
  <div class="tracking-order">
    <TopPage :currentPage="'Tracking Order'" />

    <div class="tracking-order-content">
      <div class="grid wide">
        <div class="row">
          <div class="col l-12 m-12 s-12">
            <div>
              <heading-section>
                <template #prefix>Tracking </template>
                <template #strong>Your Order</template>
              </heading-section>

              <div class="row">
                <div class="col l-6 m-6 s-12">
                  <InputV2
                    label="Billing email"
                    placeholder="Enter billing email"
                  />
                </div>
                <div class="col l-6 m-6 s-12">
                  <InputV2
                    label="Order number"
                    placeholder="Enter order number"
                  />
                </div>
              </div>

              <button-v-5 @click="handleSearchOrder">SEARCH</button-v-5>

              <div
                class="tracking-order-details"
                v-if="isShowOrderDetails === true"
              >
                <OrderDetailsFull />
              </div>
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
import InputV2 from "@/components/InputV2.vue";
import ButtonV5 from "@/components/ButtonV5.vue";

import { ref } from "vue";

export default {
  name: "TrackingOrderComponent",
  components: {
    TopPage,
    HeadingSection,
    OrderDetailsFull,
    InputV2,
    ButtonV5,
  },
  setup() {
    const isShowOrderDetails = ref(false);

    function handleSearchOrder() {
      isShowOrderDetails.value = true;
    }

    return {
      isShowOrderDetails,
      handleSearchOrder,
    };
  },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

@keyframes show {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}

.tracking-order {
  &-content {
    padding: 50px 0;
  }

  &-details {
    animation: show ease 0.6s forwards;
    margin-top: 100px;
  }

  @media (max-width: $maxMobile) {
    &-details {
      margin-top: 50px;
    }
  }
}
</style>
