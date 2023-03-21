<template>
  <div class="heading-section">
    <h2 class="heading-section-title">
      <slot name="prefix"></slot>
      <strong>
        <slot name="strong"></slot>
      </strong>
      <slot></slot>
    </h2>
    <div class="heading-section-img">
      <img src="@/assets/images/below_heading.png" alt="image">
    </div>
  </div>
</template>

<script>

export default {
  name: "HeadingSectionComponent",
};
</script>

<style lang="scss" scoped>
@use '@/assets/scss/variables.scss' as *;

.heading-section {
  text-align: center;
  margin-bottom: 50px;

  &-title {
    font-size: 46px;
    font-weight: 300;
    line-height: 1.2;

    strong {
      font-weight: bold;
    }
  }

  &-img {
    width: 150px;
    margin: 10px auto 0;
  }

  @media (max-width: $maxMobile) {
    &-title {
      font-size: 38px;

      strong {
        display: block;
      }
    }
  }
}
</style>
