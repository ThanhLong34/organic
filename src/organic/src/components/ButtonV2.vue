<template>
  <button class="button-v2">
    <slot></slot>
  </button>
</template>

<script>
/* eslint-disable */
export default {
  name: "ButtonV2Component",
};
</script>

<style lang="scss">
.button-v2 {
  border-radius: 50px;
  height: 55px;
  line-height: 55px;
  font-size: 20px;
  font-weight: 600;
  padding: 0 40px;
  background: linear-gradient(-90deg, #92c64e 0%, #4baf50 100%);
  position: relative;
  z-index: 2;
  overflow: hidden;
  border: none;
  display: inline-block;
  color: #fff;
  -webkit-transition: all ease 400ms;
  box-shadow: 0 3px 20px -1px rgb(0 0 0 / 18%);

  &.processing {
    pointer-events: none;
    cursor: wait;
    background: linear-gradient(-90deg, #b8b8b8 0%, #8f8f8f 100%);

    & i {
      background: #b3b3b3;
    }
  }

  &::before {
    position: absolute;
    left: auto;
    right: 0;
    height: 100%;
    content: "";
    z-index: -1;
    width: 0;
    overflow: hidden;
    border-radius: inherit;
    transition: width 0.5s cubic-bezier(0.25, 0.8, 0.25, 1) 0s;
    -moz-transition: width 0.5s cubic-bezier(0.25, 0.8, 0.25, 1) 0s;
    -webkit-transition: width 0.5s cubic-bezier(0.25, 0.8, 0.25, 1) 0s;
    border-color: transparent;
    background: #457500;
  }

  &:hover {
    color: white;

    &::before {
      width: 100%;
      left: 0;
      right: auto;
    }

    & i {
      background: #6ab600;
    }
  }

  & i {
    margin-left: 5px;
    font-size: 10px;
    width: 28px;
    height: 28px;
    line-height: 28px;
    background: linear-gradient(-90deg, #92c64e 0%, #4baf50 100%);
    text-align: center;
    position: relative;
    top: -1px;
    color: #fff;
    border-radius: 50%;
    transition: all ease 0.4s;
    -webkit-transition: all ease 0.4s;
  }
}
</style>
