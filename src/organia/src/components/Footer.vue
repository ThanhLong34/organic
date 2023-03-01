<template>
  <div class="footer">
    <div class="grid wide">
      <div class="row">
        <div class="col l-4 m-6 s-12">
          <div class="footer-left">
            <address class="address">
              <div class="address-item">
                <div class="address-item-icon">
                  <i class="fa-solid fa-envelope-open-text"></i>
                </div>
                <div class="address-item-txt">
                  <p class="address-item-label">Email</p>
                  <p class="address-item-value">thanhlongedu0304@gmail.com</p>
                </div>
              </div>
              <div class="address-item">
                <div class="address-item-icon">
                  <i class="fa-solid fa-phone-volume"></i>
                </div>
                <div class="address-item-txt">
                  <p class="address-item-label">Phone</p>
                  <p class="address-item-value">035 329 2241</p>
                </div>
              </div>
              <div class="address-item">
                <div class="address-item-icon">
                  <i class="fa-solid fa-map-location-dot"></i>
                </div>
                <div class="address-item-txt">
                  <p class="address-item-label">Address</p>
                  <p class="address-item-value">88 road, borklyn street, USA</p>
                </div>
              </div>
            </address>
          </div>
        </div>
        <div class="col l-4 m-6 s-12">
          <div class="footer-mid">
            <div class="footer-mid-logo">
              <img src="@/assets/images/logo2.png" alt="logo" />
            </div>
            <p class="footer-mid-para">
              There are many variations of passages of lorem ipsum available.
            </p>
            <div class="footer-mid-social-list">
              <a
                class="footer-mid-social-item"
                target="_blank"
                href="https://vi-vn.facebook.com/"
              >
                <i class="fa-brands fa-facebook-f"></i>
              </a>
              <a
                class="footer-mid-social-item"
                target="_blank"
                href="https://twitter.com/?lang=vi"
              >
                <i class="fa-brands fa-twitter"></i>
              </a>
              <a
                class="footer-mid-social-item"
                target="_blank"
                href="https://www.linkedin.com/"
              >
                <i class="fa-brands fa-linkedin-in"></i>
              </a>
            </div>
          </div>
        </div>
        <div class="col l-4 m-12 s-12">
          <div class="footer-right">
            <p class="footer-right-title">CUSTOMER SERVICE</p>
            <nav class="service">
              <div class="service-link">
                <router-link
                  :to="{ name: 'contact' }"
                >
                  <i class="fa-solid fa-caret-right"></i>
                  Contact Us
                </router-link>
              </div>
              <div class="service-link">
                <router-link
                  :to="{ name: 'about' }"
                >
                  <i class="fa-solid fa-caret-right"></i>
                  About Us
                </router-link>
              </div>
              <div class="service-link">
                <router-link
                  :to="{ name: 'tracking_order' }"
                >
                  <i class="fa-solid fa-caret-right"></i>
                  Track Your Order
                </router-link>
              </div>
              <div class="service-link">
                <router-link
                  :to="{ name: 'policy' }"
                >
                  <i class="fa-solid fa-caret-right"></i>
                  Returns Policy
                </router-link>
              </div>
              <div class="service-link">
                <router-link
                  :to="{ name: 'help_and_faq' }"
                >
                  <i class="fa-solid fa-caret-right"></i>
                  Help &amp; FAQ
                </router-link>
              </div>
            </nav>
          </div>
        </div>
      </div>
      <div class="footer-bottom">
        <p>© Copyright 2022 by <span>DragonDev</span></p>
        <div class="footer-bottom-payment-img">
          <img src="@/assets/images/payment.png" alt="payment image" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
/* eslint-disable */
export default {
  name: "FooterComponent",
  setup() {},
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.footer {
  padding: 50px 0;
  background-color: #181818;
  color: $lightTextColor;

  .row {
    align-items: stretch;
  }

  .col {
    border-right: 1px solid #313131;
    padding: 25px 0;

    &:last-child {
      border-right: none;
    }

    @media (max-width: 1023px) {
      &:nth-child(2) {
        border-right: none;
      }

      &:last-child {
        border-top: 1px solid #313131;
      }
    }

    @media (max-width: 739px) {
      &:first-child {
        border-right: none;
      }

      &:nth-child(2) {
        border-top: 1px solid #313131;
      }
    }
  }

  @media (max-width: 1023px) {
    padding: 30px 0;
  }

  @media (max-width: 739px) {
    padding: 15px 0;
  }
}

.footer-left {
  padding: 0 12px;

  .address {
    &-item {
      display: flex;
      align-items: center;

      &-icon {
        height: 58px;
        width: 58px;
        border-radius: 50%;
        color: $primaryColor;
        background-color: #262626;
        font-size: 24px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 12px;
      }

      &-txt {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
      }

      &-label {
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 8px;
      }

      &-value {
        color: #a4a4a4;
        font-size: 18px;
      }
    }

    .address-item + .address-item {
      margin-top: 24px;
    }
  }

  @media (max-width: 450px) {
    .address-item {
      &-icon {
        height: 42px;
        width: 42px;
        font-size: 20px;
      }

      &-label {
        font-size: 18px;
        margin-bottom: 6px;
      }

      &-value {
        font-size: 16px;
      }
    }

    .address-item + .address-item {
      margin-top: 15px;
    }
  }
}

.footer-mid {
  padding: 0 12px;

  &-logo {
    width: 198px;
    margin: 0 auto 20px;
  }

  &-para {
    font-size: 22px;
    color: #a4a4a4;
    text-align: center;
    margin-bottom: 20px;
    line-height: 1.3;
  }

  &-social {
    &-list {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    &-item {
      height: 50px;
      width: 50px;
      font-size: 20px;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      background-color: #4b4b4b;
      border-radius: 50%;
      transition: all ease 0.4s;

      & + & {
        margin-left: 15px;
      }

      &:hover {
        background-color: $primaryColor;
        cursor: pointer;
      }
    }
  }

  @media (max-width: 450px) {
    &-logo {
      width: 160px;
    }

    &-para {
      font-size: 18px;
    }

    &-social {
      &-item {
        height: 42px;
        width: 42px;
        font-size: 18px;
      }
    }
  }
}

.footer-right {
  padding: 0 12px;

  &-title {
    font-size: 24px;
    font-weight: bold;
    padding-left: 28px;
  }

  .service {
    padding: 24px 0 24px 30px;

    &-link {
      i {
        margin-right: 4px;
      }

      a {
        display: block;
        padding: 8px 0;
        font-size: 20px;
        color: #a4a4a4;
        transition: all ease 0.4s;

        &:hover {
          color: $primaryColor;
          transform: translateX(8px);
        }
      }
    }
  }

  @media (max-width: 1023px) {
    padding: 0 12px;

    &-title {
      padding-left: 0;
      padding-top: 20px;
    }

    .service {
      padding: 24px 0px;
    }
  }

  @media (max-width: 450px) {
    &-title {
      font-size: 20px;
    }

    .service {
      &-link {
        a {
          font-size: 18px;
        }
      }
    }
  }
}

.footer-bottom {
  padding-top: 30px;
  display: flex;
  align-items: center;
  justify-content: space-between;

  p {
    font-size: 20px;
    color: #a4a4a4;
  }

  &-payment-img {
    width: 350px;
  }

  span {
    color: white;
  }

  @media (max-width: 739px) {
    padding-top: 10px;
    flex-direction: column;
    justify-content: center;

    p {
      margin-bottom: 20px;
    }
  }

  @media (max-width: 400px) {
    &-payment-img {
      width: 220px;
    }
  }
}
</style>
