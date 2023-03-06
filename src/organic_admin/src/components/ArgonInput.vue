<template>
   <div class="form-group">
      <div :class="hasIcon(icon)">
         <span v-if="iconDir === 'left'" class="input-group-text">
            <i :class="getIcon(icon)"></i>
         </span>
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
         <span v-if="iconDir === 'right'" class="input-group-text">
            <i :class="getIcon(icon)"></i>
         </span>
      </div>
   </div>
</template>

<script>
export default {
   name: "argon-input",
   emits: ["update:modelValue"],
   props: {
      size: {
         type: String,
         default: "default",
      },
      valid: {
         type: Boolean,
         default: false,
      },
      icon: String,
      iconDir: String,
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
      getIcon: (icon) => (icon ? icon : null),
      hasIcon: (icon) => (icon ? "input-group" : null),
      resetValue() {
         this.inputVal = "";
      },
      setValue(value) {
         this.inputVal = value;
      },
   },
};
</script>
