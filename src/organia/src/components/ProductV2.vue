<template>
  <div class="product-v2">
    <router-link
      :to="{
        name: 'shop_details',
        params: { productId: 1, productName: 'product-name' },
      }"
    >
      <div class="product-v2-img">
        <img
          :src="`${require(`@/assets/images/product/${product.image}`)}`"
          alt="product image"
        />
      </div>
      <div class="product-v2-info">
        <div class="product-v2-category">{{ product.category }}</div>
        <h6 class="product-v2-name">{{ product.name }}</h6>
        <div class="product-v2-price">
          <span class="product-v2-price-old">${{ product.priceOld }}</span>
          <span class="product-v2-price-new"
            >${{ product.priceNew }}
            <span class="product-v2-unit">/ Kg</span></span
          >
        </div>
        <div class="product-v2-rating">
          <div class="product-v2-rating-stars">
            <i
              v-for="i in 5"
              :key="i"
              :class="{
                'fa-solid fa-star': true,
                active: i <= product.star,
              }"
            ></i>
          </div>
          <div class="product-v2-rating-total">&lpar;01&rpar;</div>
        </div>
      </div>
    </router-link>
  </div>
</template>

<script>
/* eslint-disable */
export default {
  name: "ProductV2Component",
  props: {
    product: Object,
  },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.product-v2 {
  width: 100%;
  background-color: #f9f9f9;
  border-radius: 20px;
  position: relative;
  padding: 22px;
  margin-bottom: 40px;
  cursor: pointer;

  &:hover &-img {
    img {
      transform: scale(1.12);
    }
  }

  &:hover &-name {
    color: $primaryColor;
  }

  &-img {
    img {
      transition: transform ease 0.5s;
    }
  }

  &-info {
    color: $darkTextColor;
  }

  &-category {
    background: linear-gradient(-90deg, #92c64e 0%, #4baf50 100%);
    padding: 8px 14px;
    border-radius: 20px;
    display: inline-block;
    color: white;
    font-size: 12px;
    margin: 18px 0 14px;
  }

  &-name {
    font-size: 20px;
    font-weight: 700;
    margin-bottom: 10px;
    line-height: 1.2;
    transition: color ease 0.4s;
  }

  &-price {
    font-weight: 500;

    &-old {
      font-size: 14px;
      color: #9299a3;
      text-decoration: line-through;
      margin-right: 10px;
    }

    &-new {
      font-size: 18px;
      font-weight: 700;
      color: #ff0404;
    }
  }

  &-unit {
    color: $primaryColor;
    font-weight: 500;
  }

  &-rating {
    margin-top: 15px;
    display: flex;
    align-items: flex-end;
    color: #c9c9c9;

    &-stars {
      i {
        font-size: 12px;

        &.active {
          color: #ffa900;
        }
      }
    }

    &-total {
      font-size: 14px;
      margin-left: 8px;
      color: #818181;
    }
  }

  @media (max-width: $maxMobile) {
    &-category {
      padding: 12px 20px;
      font-size: 18px;
    }

    &-name {
      font-size: 24px;
    }

    &-price {
      &-old {
        font-size: 18px;
      }

      &-new {
        font-size: 22px;
      }
    }

    &-rating {
      &-stars {
        i {
          font-size: 15px;
        }
      }

      &-total {
        font-size: 18px;
      }
    }
  }

  @media (max-width: 400px) {
    &-category {
      padding: 8px 14px;
      font-size: 12px;
    }

    &-name {
      font-size: 20px;
    }

    &-price {
      &-old {
        font-size: 14px;
      }

      &-new {
        font-size: 18px;
      }
    }

    &-rating {
      &-stars {
        i {
          font-size: 12px;
        }
      }

      &-total {
        font-size: 14px;
      }
    }
  }
}
</style>
