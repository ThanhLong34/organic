<template>
   <div ref="descriptionRef" class="product-description content-render"></div>
</template>

<script>

import { ref, watch } from "vue";

export default {
   name: "ProductDescriptionComponent",
   props: {
      content: {
         type: String,
         default: "",
      },
   },
   setup(props) {
      const descriptionRef = ref(null);

      return {
         descriptionRef,
      };
   },
   watch: {
      content: function (newVal, oldVal) {
         if (this.$refs.descriptionRef) {
            this.$refs.descriptionRef.innerHTML = this.$props.content;
         }
      },
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

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
