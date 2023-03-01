<template>
  <div class="service">
    <div class="grid wide">
      <div class="row">
        <div class="col l-3 m-6 s-12">
          <div class="service-item">
            <div class="service-item-img">
              <img
                src="@/assets/images/shop/service_1.jpg"
                alt="service image"
              />
            </div>
            <div class="service-item-txt">
              <h6 class="service-item-name">FREE SHIPPING</h6>
              <p class="service-item-desc">On order over $500.00</p>
            </div>
          </div>
        </div>
        <div class="col l-3 m-6 s-12">
          <div class="service-item">
            <div class="service-item-img">
              <img
                src="@/assets/images/shop/service_2.jpg"
                alt="service image"
              />
            </div>
            <div class="service-item-txt">
              <h6 class="service-item-name">GIFT VOUCHER</h6>
              <p class="service-item-desc">100% gift voucher</p>
            </div>
          </div>
        </div>
        <div class="col l-3 m-6 s-12">
          <div class="service-item">
            <div class="service-item-img">
              <img
                src="@/assets/images/shop/service_3.jpg"
                alt="service image"
              />
            </div>
            <div class="service-item-txt">
              <h6 class="service-item-name">RETURN POLICY</h6>
              <p class="service-item-desc">Safe and trustworthy</p>
            </div>
          </div>
        </div>
        <div class="col l-3 m-6 s-12">
          <div class="service-item">
            <div class="service-item-img">
              <img
                src="@/assets/images/shop/service_4.jpg"
                alt="service image"
              />
            </div>
            <div class="service-item-txt">
              <h6 class="service-item-name">SAFE PAYMENT</h6>
              <p class="service-item-desc">Secure payment methods</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
/* eslint-disable */
export default {
  name: 'ServiceComponent',
};
</script>

<style lang="scss" scoped>
@use '@/assets/scss/variables.scss' as *;

.service {
  padding: 50px 0;

  &-item {
    display: flex;
    align-items: center;
    margin-bottom: 28px;

    &-img {
      margin-right: 20px;
      min-width: fit-content;
    }

    &-txt {
      color: $darkTextColor;
    }

    &-name {
      font-size: 18px;
      margin-bottom: 8px;
    }

    &-desc {
      font-size: 16px;
      font-weight: 500;
      line-height: 1.2;
    }
  }
}
</style>
