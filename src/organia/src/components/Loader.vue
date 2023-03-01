<template>
  <div class="loader">
    <div class="loader-img"></div>
    <div class="loader-content">
      <div class="waviy">
        <span style="--i: 1">L</span>
        <span style="--i: 2">O</span>
        <span style="--i: 3">A</span>
        <span style="--i: 4">D</span>
        <span style="--i: 5">I</span>
        <span style="--i: 6">N</span>
        <span style="--i: 7">G</span>
        <span style="--i: 8">.</span>
        <span style="--i: 9">.</span>
        <span style="--i: 10">.</span>
      </div>
    </div>
  </div>
</template>

<script>
/* eslint-disable */
export default {
  name: "LoaderComponent",
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

@keyframes showLoader {
  0% {
    opacity: 0.4;
  }
  100% {
    opacity: 1;
  }
}

@keyframes hideLoader {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
    visibility: hidden;
  }
}

@keyframes rotate {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

.loader {
  position: fixed;
  inset: 0;
  background-color: #232424;
  z-index: $zILoader;
  display: flex;
  align-items: center;
  justify-content: center;
  animation: showLoader ease 0.3s forwards;

  &.hide {
    animation: hideLoader ease 0.3s forwards;
  }

  &-img {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: url("@/assets/images/loader.png") no-repeat center center;
    animation: rotate 30s infinite linear;
  }

  &-content {
    color: white;
    position: relative;
    font-size: 18px;
    text-transform: uppercase;
    letter-spacing: 2px;
    font-weight: bold;
    text-shadow: 0 1px 4px rgb(0 0 0 / 10%);
  }
}

.waviy {
  position: relative;
  -webkit-box-reflect: below -8px linear-gradient(transparent, rgba(0, 0, 0, 0.2));
}
.waviy span {
  position: relative;
  display: inline-block;
  color: #fff;
  text-transform: uppercase;
  animation: waviy 1s infinite;
  animation-delay: calc(0.1s * var(--i));
}
@keyframes waviy {
  0%,
  40%,
  100% {
    transform: translateY(0);
  }
  20% {
    transform: translateY(-6px);
  }
}
</style>
