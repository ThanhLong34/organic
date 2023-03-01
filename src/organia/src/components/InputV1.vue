<template>
  <input
    class="input-v1"
    :type="type"
    :required="required"
    :placeholder="placeholder"
  />
</template>

<script>
/* eslint-disable */
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
    required: Boolean
  },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.input-v1 {
  border-radius: 50px;
  height: 65px;
  line-height: 65px;
  font-size: 20px;
  font-weight: 400;
  padding: 0 36px;
  border: 3px solid $primaryColor;
  display: inline-block;
  color: $darkTextColor;
  width: 100%;
  margin-bottom: 18px;

  @media (max-width: $maxMobile) {
    height: 55px;
    line-height: 55px;
    font-size: 18px;
    padding: 0 36px;
  }
}
</style>
