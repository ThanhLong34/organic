<template>
   <div class="input-wrap">
      <div class="input-label">
         {{ label }}
         <span class="input-require">{{ required ? "*" : "" }}</span>
      </div>
      <input
         class="input-v2"
         :type="type"
         :required="required"
         :placeholder="placeholder"
         v-model="inputVal"
         @input="$emit('update:modelValue', $event.target.value)"
      />
   </div>
</template>

<script>

export default {
   name: "InputV1Component",
   props: {
      type: {
         type: String,
         default: "text",
         validator(value) {
            // The value must match one of these strings
            return ["text", "password", "email"].includes(value);
         },
      },
      placeholder: {
         type: String,
         default: "",
      },
      label: String,
      required: Boolean,
   },
   data() {
      return {
         inputVal: "",
      };
   },
   methods: {
      resetValue() {
         this.inputVal = "";
      },
      setValue(value) {
         this.inputVal = value;
      },
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.input-wrap {
   margin-bottom: 30px;
}

.input-label {
   font-size: 20px;
   margin-bottom: 10px;
   font-weight: 500;
}

.input-require {
   color: $red;
}

.input-v2 {
   height: 50px;
   line-height: 50px;
   font-size: 20px;
   font-weight: 400;
   padding: 0 12px;
   border: 2px solid $primaryColor;
   display: inline-block;
   color: $darkTextColor;
   width: 100%;
   transition: all 0.2s;

   &:focus {
      box-shadow: 0 3px 12px 0 rgb(37 37 37 / 12%);
   }

   @media (max-width: $maxMobile) {
      height: 45px;
      line-height: 45px;
      font-size: 18px;
      padding: 0 8px;
   }
}
</style>
