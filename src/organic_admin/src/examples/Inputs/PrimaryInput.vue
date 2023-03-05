<template>
   <div class="form-group">
      <div class="form-input-wrapper">
         <input
            :type="type"
            class="form-control"
            :class="getClasses(size, valid)"
            :name="name"
            :id="id"
            :placeholder="placeholder"
            :required="isRequired"
            v-model="inputVal"
            @input="$emit('update:modelValue', $event.target.value)"
         />
         <a
            class="form-save-btn"
            href="javascript:;"
            @click.prevent="handleSave"
         >
            <tippy content="Lưu" theme="light">
               <i class="fa fa-floppy-o me-2" aria-hidden="true"></i>
            </tippy>
         </a>
      </div>
   </div>
</template>

<script>
export default {
   name: "primary-input",
   emits: ["onSave", "update:modelValue"],
   props: {
      size: {
         type: String,
         default: "default",
      },
      valid: {
         type: Boolean,
         default: false,
      },
      name: String,
      id: String,
      placeholder: String,
      type: String,
      isRequired: Boolean,
   },
   data() {
      return {
         inputVal: "",
      };
   },
   methods: {
      getClasses: (size, valid) => {
         let sizeValue, isValidValue;

         sizeValue = size ? `form-control-${size}` : null;

         isValidValue = valid ? `${valid}` : "invalid";

         return `${sizeValue} ${isValidValue}`;
      },
      resetValue() {
         this.inputVal = "";
      },
      setValue(value) {
         this.inputVal = value;
      },
      handleSave() {
         this.$emit("onSave");
      },
   },
};
</script>

<style lang="scss" scoped>
.form-input-wrapper {
   position: relative;

   .form-control {
      padding-right: 2.2rem;
   }

   .form-save-btn {
      position: absolute;
      top: 50%;
      right: 5px;
      transform: translateY(-50%);
   }
}
</style>
