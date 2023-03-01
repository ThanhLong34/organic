<template>
  <div class="menu-sidebar">
    <div class="menu">
      <div class="menu-top">
        <div class="menu-top-label">
          <i class="fa-solid fa-bars"></i>
          MENU
        </div>
        <button class="menu-top-close-btn" @click="handleCloseMenuSidebar">
          <i class="fa-solid fa-xmark"></i>
        </button>
      </div>
      <div class="menu-body">
        <Navigator :icons="true" />
      </div>
      <div class="menu-bottom">
        <div class="logo">
          <img src="@/assets/images/logo.png" alt="logo" />
        </div>
      </div>
    </div>
    <div class="overlay" @click="handleCloseMenuSidebar"></div>
  </div>
</template>

<script>
/* eslint-disable */
import Navigator from "./Navigator.vue";

export default {
  name: "MenuSidebarComponent",
  components: {
    Navigator,
  },
  emits: ["closeMenuSidebar"],
  setup(_, { emit }) {
    function handleCloseMenuSidebar() {
      emit("closeMenuSidebar");
    }

    return {
      handleCloseMenuSidebar,
    };
  },
};
</script>

<style lang="scss">
@use "@/assets/scss/variables.scss" as *;

@keyframes showMenuSidebar {
  0% {
    opacity: 0.2;
  }
  100% {
    opacity: 1;
  }
}

@keyframes showSidebar {
  0% {
    left: -320px;
  }
  100% {
    left: 0;
  }
}

.menu-sidebar {
  position: fixed;
  inset: 0;
  z-index: $zIMenuSidebar;
  animation: showMenuSidebar ease 0.3s forwards;

  .menu {
    width: auto;
    min-width: 320px;
    height: 100%;
    background-color: white;
    position: absolute;
    overflow: hidden;
    top: 0;
    left: 0;
    z-index: 2;
    animation: showSidebar ease 0.3s forwards;

    &-top {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 18px 15px 18px 30px;

      &-label {
        font-size: 23px;
        font-weight: bold;
        letter-spacing: 2px;
        i {
          font-size: 20px;
        }
      }

      &-close-btn {
        padding: 10px 15px;
        border-radius: 50%;
        font-size: 18px;
        border: 1px solid rgb(187, 187, 187);
        color: $darkTextColor;
        transition: all ease 0.3s;

        &:hover {
          color: $primaryColor;
          border-color: $primaryColor;
        }
      }
    }

    &-bottom {
      .logo {
        width: 240px;
        margin: 0 auto;
        padding: 40px 0;
      }
    }

    .navigator {
      display: flex;
      flex-direction: column;
      align-items: flex-start;

      &-link {
        border-top: 1px solid rgba(35, 35, 35, 0.1);
        margin-left: 0;
        width: 100%;
        a {
          display: block;
          width: 100%;
          font-size: 20px;
          font-weight: bold;
          color: $darkTextColor;
          border-radius: 0;
          padding: 18px 0 18px 30px;
          background-color: transparent;
          transition: all ease 0.4s;

          &:hover {
            color: $lightTextColor;
            background-color: $primaryColor;
            box-shadow: 0 1px 6px rgb(0 0 0 / 20%);
            transform: scale(1.1) translateX(12px);
          }
        }
      }

      .navigator-link:last-child {
        border-bottom: 1px solid rgba(35, 35, 35, 0.1);
      }

      .router-link-active {
        color: $lightTextColor;
        background-color: $primaryColor;
        box-shadow: 0 1px 6px rgb(0 0 0 / 20%);
        transform: scale(1.1) translateX(12px);
      }
    }
  }

  .overlay {
    position: absolute;
    inset: 0;
    z-index: 1;
    background-color: #000000b3;
  }
}
</style>
