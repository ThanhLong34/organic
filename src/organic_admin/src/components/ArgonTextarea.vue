<template>
   <div class="form-group">
      <label :for="id" style="margin-left: 0px">
         <slot />
      </label>
      <textarea
         class="form-control"
         rows="5"
         :placeholder="placeholder"
         :id="id"
         v-model="inputVal"
         @input="$emit('update:modelValue', $event.target.value)"
      ></textarea>
   </div>
</template>

<script>
export default {
   name: "argon-textarea",
   props: {
      id: String,
      placeholder: String,
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
