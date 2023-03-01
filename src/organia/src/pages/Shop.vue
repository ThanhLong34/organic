<template>
  <div class="shop">
    <TopPage :currentPage="'Shop'" />
    <div class="shop-content">
      <!-- services -->
      <section class="service-section">
        <Service />
      </section>
      <!-- sidebar & products -->
      <section class="main-section">
        <div class="grid wide">
          <div class="row">
            <div class="col l-3 m-12 s-12">
              <SidebarShop />
            </div>
            <div class="col l-9 m-12 s-12">
              <div>
                <!-- information: total product -->
                <div class="information">
                  <div class="information-content">
                    <p class="information-total">Item 1 to 12 of 45 Total</p>
                  </div>
                </div>
                <!-- products -->
                <ul class="row product-list">
                  <li
                    class="col l-4 m-4 s-12"
                    v-for="(item, index) in products"
                    :key="index"
                  >
                    <ProductV2 :product="item" />
                  </li>
                </ul>
                <!-- page number -->
                <PageNumber />
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- contact mail -->
      <section class="contact-mail-section">
        <ContactMail />
      </section>
    </div>
  </div>
</template>

<script>
/* eslint-disable */
import TopPage from "@/components/TopPage.vue";
import ProductV2 from "@/components/ProductV2.vue";
import ContactMail from "@/components/ContactMail.vue";
import Service from "@/components/Service.vue";
import SidebarShop from "@/components/SidebarShop.vue";
import PageNumber from "@/components/PageNumber.vue";

import { ref, reactive } from "vue";

export default {
  name: "ShopPage",
  components: {
    TopPage,
    ProductV2,
    ContactMail,
    Service,
    SidebarShop,
    PageNumber,
  },
  setup() {
    const products = reactive([
      {
        category: "Fresh",
        image: "exp.png",
        name: "Vegan Egg Replacer",
        priceOld: "280.00",
        priceNew: "180.00",
        description:
          "Apparently we had reached a great height in the atmosphere.",
        star: 4,
      },
      {
        category: "Fresh",
        image: "exp1.png",
        name: "Vegan Egg Replacer",
        priceOld: "280.00",
        priceNew: "180.00",
        description:
          "Apparently we had reached a great height in the atmosphere.",
        star: 5,
      },
      {
        category: "Fresh",
        image: "exp3.png",
        name: "Vegan Egg Replacer",
        priceOld: "280.00",
        priceNew: "180.00",
        description:
          "Apparently we had reached a great height in the atmosphere.",
        star: 4,
      },
      {
        category: "Fresh",
        image: "exp4.png",
        name: "Vegan Egg Replacer",
        priceOld: "280.00",
        priceNew: "180.00",
        description:
          "Apparently we had reached a great height in the atmosphere.",
        star: 5,
      },
      {
        category: "Fresh",
        image: "exp5.png",
        name: "Vegan Egg Replacer",
        priceOld: "280.00",
        priceNew: "180.00",
        description:
          "Apparently we had reached a great height in the atmosphere.",
        star: 5,
      },
      {
        category: "Fresh",
        image: "exp6.png",
        name: "Vegan Egg Replacer",
        priceOld: "280.00",
        priceNew: "180.00",
        description:
          "Apparently we had reached a great height in the atmosphere.",
        star: 5,
      },
      {
        category: "Fresh",
        image: "exp7.png",
        name: "Vegan Egg Replacer",
        priceOld: "280.00",
        priceNew: "180.00",
        description:
          "Apparently we had reached a great height in the atmosphere.",
        star: 5,
      },
      {
        category: "Fresh",
        image: "exp4.png",
        name: "Vegan Egg Replacer",
        priceOld: "280.00",
        priceNew: "180.00",
        description:
          "Apparently we had reached a great height in the atmosphere.",
        star: 5,
      },
      {
        category: "Fresh",
        image: "exp1.png",
        name: "Vegan Egg Replacer",
        priceOld: "280.00",
        priceNew: "180.00",
        description:
          "Apparently we had reached a great height in the atmosphere.",
        star: 5,
      },
    ]);

    return {
      products,
    };
  },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.shop-content {
  background-color: white;
}

.information {
  margin-bottom: 30px;

  &-content {
    display: flex;
    justify-content: flex-end;
    align-items: center;
  }

  &-total {
    text-align: center;
    font-size: 18px;
    color: #888;
    padding: 15px 24px;
    border-radius: 24px;
    background-color: white;
    box-shadow: $cardShadow;
    display: inline-block;
  }

  @media (max-width: $maxTablet) {
    border-top: 2px solid rgb(235, 235, 235);
    padding: 60px 0 30px;

    &-content {
      flex-direction: column;
    }
  }
}

.contact-mail-section {
  padding: 100px 0;
}
</style>
