<template>
  <div>
    <teleport to="#app">
      <div
        :class="{
          'toast-message': true,
          'hide-effect': isHideEffect,
          success: type === 'success',
          error: type === 'error',
          warning: type === 'warning',
        }"
        v-if="isDisplayNone"
      >
        <div class="toast-message-icon">
          <!-- success -->
          <i class="fa-solid fa-circle-check" v-if="type === 'success'"></i>
          <!-- error -->
          <i class="fa-solid fa-circle-exclamation" v-if="type === 'error'"></i>
          <!-- warning -->
          <i
            class="fa-solid fa-triangle-exclamation"
            v-if="type === 'warning'"
          ></i>
        </div>
        <div class="toast-message-txt">
          {{ message }}
        </div>
      </div>
    </teleport>
  </div>
</template>

<script>
/* eslint-disable */
import { ref, onMounted } from "vue";

export default {
  name: "ToastMessageComponent",
  props: {
    type: {
      type: String,
      default: "success",
    },
    message: {
      type: String,
      default: "This is message",
    },
    secondHideEffect: {
      type: Number,
      default: 4000,
    },
    secondDisplayNone: {
      type: Number,
      default: 1200,
    },
  },
  setup(props) {
    const isDisplayNone = ref(true);
    const isHideEffect = ref(false);

    onMounted(() => {
      setTimeout(() => {
        isHideEffect.value = true;
        setTimeout(() => {
          isDisplayNone.value = false;
        }, props.secondDisplayNone);
      }, props.secondHideEffect);
    });

    return { isDisplayNone, isHideEffect };
  },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

@keyframes showToastMessage {
  0% {
    opacity: 0;
    transform: translateX(100%);
  }
  100% {
    opacity: 1;
    transform: translateX(0);
  }
}

.toast-message {
  padding: 10px 12px;
  position: fixed;
  top: 78px;
  right: 0;
  font-size: 20px;
  background-color: white;
  color: white;
  border-radius: 24px 0 0 24px;
  box-shadow: $cardShadow;
  max-width: 40vw;
  display: flex;
  align-items: center;
  z-index: $zIAlert;
  animation: showToastMessage ease 1s;
  transition: all ease 0.5s;

  &.hide-effect {
    top: 0;
    opacity: 0;
  }

  &-icon {
    margin-right: 12px;
  }

  &-txt {
    line-height: 1.3;
    position: relative;
    top: 2px;
  }

  &.success {
    background-color: #6db36a;
  }

  &.error {
    background-color: #FF8A64;
  }

  &.warning {
    background-color: #FFB84B;
  }

  @media (max-width: $maxTablet) {
    max-width: 80vw;
  }

  @media (max-width: $maxMobile) {
    font-size: 16px;
  }

  @media (max-width: 460px) {
    top: 68px;
    max-width: 90vw;
  }
}
</style>
