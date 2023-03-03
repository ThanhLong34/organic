<template>
   <div class="text-area-wrap">
      <div class="text-area-label">
         {{ label }}
      </div>
      <textarea
         class="text-area-v2"
         :required="required"
         :placeholder="placeholder"
      />
   </div>
</template>

<script>
/* eslint-disable */
export default {
   name: "TextAreaV1Component",
   props: {
      placeholder: {
         type: String,
         default: "",
      },
      label: String,
      required: Boolean,
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.text-area-wrap {
   margin-bottom: 30px;
}

.text-area-label {
   font-size: 20px;
   margin-bottom: 10px;
   font-weight: 500;
}

.text-area-v2 {
   min-height: 150px;
   height: auto;
   line-height: 1.2;
   font-size: 20px;
   font-weight: 400;
   padding: 12px 12px;
   border: 2px solid $primaryColor;
   display: inline-block;
   color: $darkTextColor;
   width: 100%;
   resize: vertical;

   transition: box-shadow 0.2s;

   &:focus {
      box-shadow: 0 3px 12px 0 rgb(37 37 37 / 12%);
   }

   &::-webkit-scrollbar {
      width: 5px;
   }

   &::-webkit-scrollbar-track {
      -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
      background-color: $bodyColor;
   }

   &::-webkit-scrollbar-thumb {
      border-radius: 20px;
      background-image: linear-gradient(45deg, #92c64e 0%, #4baf50 100%);
   }

   @media (max-width: $maxMobile) {
      font-size: 18px;
      padding: 10px 8px;
   }
}
</style>
