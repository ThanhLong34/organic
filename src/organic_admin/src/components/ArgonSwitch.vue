<template>
   <div class="form-check form-switch">
      <input
         class="form-check-input"
         :class="inputClass"
         type="checkbox"
         :name="name"
         :id="id"
         :checked="checked"
         v-model="inputVal"
         @change="$emit('update:modelValue', $event.target.checked)"
      />
      <label class="form-check-label" :class="labelClass" :for="id">
         <slot />
      </label>
   </div>
</template>

<script>
export default {
   name: "argon-switch",
   props: {
      name: String,
      id: String,
      labelClass: String,
      checked: Boolean,
      inputClass: String,
   },
   data() {
      return {
         inputVal: "",
      };
   },
};
</script>
