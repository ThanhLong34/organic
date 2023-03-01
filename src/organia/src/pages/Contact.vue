<template>
  <div class="contact">
    <TopPage :currentPage="'Contact Us'" />
    <div class="contact-map">
      <iframe
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3903.287790240573!2d108.44201621522129!3d11.9545656396095!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317112d959f88991%3A0x9c66baf1767356fa!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyDEkMOgIEzhuqF0!5e0!3m2!1svi!2s!4v1656916094966!5m2!1svi!2s"
        width="600"
        height="450"
        style="border: 0"
        allowfullscreen=""
        loading="lazy"
        referrerpolicy="no-referrer-when-downgrade"
      ></iframe>
    </div>
    <div class="contact-content">
      <div class="grid wide">
        <div class="row">
          <div class="col l-5 m-12 s-12">
            <div class="contact-txt">
              <h6 class="contact-heading">Get In Touch</h6>
              <p class="contact-para">
                Get in touch to discuss your employee wellbeing needs today.
                Please give us a call, drop us an email or fill out the contact
                form and we'll get back to you.
              </p>
              <address class="contact-address">
                <div class="contact-address-item contact-address-item-mail">
                  <i class="fa-solid fa-envelope"></i>
                  <p>thanhlongedu0304@gmail.com</p>
                </div>
                <div class="contact-address-item">
                  <i class="fa-solid fa-phone"></i>
                  <p>035 329 2241 - Central Office</p>
                </div>
                <div class="contact-address-item">
                  <i class="fa-solid fa-location-dot"></i>
                  <p>75 South Park Avenue, Melbourne, Australia</p>
                </div>
              </address>
              <div class="contact-social">
                <div class="contact-social-item">
                  <a href="https://vi-vn.facebook.com/">
                    <i class="fa-brands fa-facebook-f"></i>
                  </a>
                </div>
                <div class="contact-social-item">
                  <a href="https://www.instagram.com/">
                    <i class="fa-brands fa-instagram"></i>
                  </a>
                </div>
                <div class="contact-social-item">
                  <a href="https://www.linkedin.com/">
                    <i class="fa-brands fa-linkedin-in"></i>
                  </a>
                </div>
              </div>
            </div>
          </div>
          <div class="col l-7 m-12 s-12">
            <div class="contact-form">
              <h6 class="contact-heading">Drop Us a Line</h6>
              <div class="contact-input-row">
                <div class="row">
                  <div class="col l-6 m-12 s-12">
                    <InputV1 placeholder="Fullname" />
                  </div>
                  <div class="col l-6 m-12 s-12">
                    <InputV1 placeholder="Email" />
                  </div>
                </div>
              </div>
              <InputV1 placeholder="Subject" />
              <TextAreaV1 placeholder="Your Message" />
              <button-v-2>
                Get In Touch
                <i class="fa-solid fa-arrow-right"></i>
              </button-v-2>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
/* eslint-disable */
import TopPage from "@/components/TopPage.vue";
import ButtonV2 from "@/components/ButtonV2.vue";
import InputV1 from "@/components/InputV1.vue";
import TextAreaV1 from "@/components/TextAreaV1.vue";

export default {
  name: "ContactPage",
  components: {
    TopPage,
    ButtonV2,
    InputV1,
    TextAreaV1,
  },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.contact {
  &-map {
    iframe {
      width: 100%;
      height: 100%;
      min-height: 550px;
    }
  }

  &-content {
    padding: 100px 0 10px;
    color: $darkTextColor;
  }

  &-txt {
    margin-bottom: 80px;
  }

  &-heading {
    font-size: 38px;
    margin-bottom: 30px;
  }

  &-para {
    font-size: 20px;
    line-height: 1.3;
    color: #656565;
    margin-bottom: 40px;
  }

  &-address {
    &-item {
      display: flex;
      align-items: center;
      margin-bottom: 18px;

      i {
        margin-right: 22px;
        min-width: 55px;
        height: 55px;
        line-height: 57px;
        border-radius: 50%;
        background: $primaryColor;
        color: white;
        text-align: center;
      }

      p {
        font-size: 22px;
        font-weight: 700;
        line-height: 1.2;
      }

      &-mail {
        word-break: break-all;
      }
    }
  }

  &-social {
    display: flex;
    align-items: center;
    padding-top: 30px;

    &-item {
      a {
        display: inline-block;
        margin-right: 10px;
        min-width: 40px;
        height: 40px;
        line-height: 44px;
        border-radius: 50%;
        background: #e6e6e6;
        color: inherit;
        text-align: center;
        transition: all ease 0.4s;

        &:hover {
          background: $primaryColor;
          color: white;
        }
      }
    }
  }

  .button-v2 {
    display: block;
    margin-top: 30px;
    height: 65px;
    line-height: 65px;
  }

  @media (max-width: $maxTablet) {
    &-content {
      padding: 80px 0;
    }
  }

  @media (max-width: $maxMobile) {
    &-map {
      iframe {
        min-height: 400px;
      }
    }

    &-content {
      padding: 60px 0;
    }

    &-txt {
      margin-bottom: 60px;
    }

    &-heading {
      font-size: 30px;
      margin-bottom: 26px;
    }

    &-para {
      font-size: 18px;
      margin-bottom: 36px;
    }

    &-address {
      &-item {
        margin-bottom: 18px;

        i {
          margin-right: 18px;
          min-width: 45px;
          height: 45px;
          line-height: 47px;
        }

        p {
          font-size: 20px;
        }
      }
    }

    &-social {
      padding-top: 20px;
    }

    .button-v2 {
      margin-top: 22px;
      height: 55px;
      line-height: 55px;
    }
  }
}
</style>
