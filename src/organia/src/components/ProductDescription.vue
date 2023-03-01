<template>
  <div class="product-description">
    <p>
      Integer hendrerit a diam quis ullamcorper. Proin leo libero, porttitor sit
      amet ullamcorper nec, vehicula sed enim. Nullam et augue et eros
      pellentesque suscipit. Vestibulum ante ipsum primis in faucibus orci
      luctus et ultrices posuere cubilia Curae.
    </p>
    <a href="">This is link</a>
    <img
      :src="'https://images.unsplash.com/photo-1523472721958-978152f4d69b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'"
      alt=""
    />
  </div>
</template>

<script>
/* eslint-disable */
export default {
  name: "ProductDescriptionComponent",
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

*, *::before, *::after {
  font-size: 18px;
}

h1,
h2,
h3,
h4,
h5,
h6,
p,
strong,
div,
span,
a {
  display: inline-block;
  line-height: 1.2;
  font-size: 18px;
  margin: 8px 0;
}

a {
  text-decoration: none;
  color: $primaryColor;
}

img {
  width: 100%;
  height: auto;
  margin: 12px auto;
  object-fit: contain;
  object-position: center;
}

@keyframes show {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}

.product-description {
  color: $darkTextColor;
  animation: show ease 0.5s forwards;
}
</style>
