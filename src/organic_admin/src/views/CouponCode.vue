<template>
   <div class="py-4 container-fluid"></div>
</template>

<script>
import { ElMessage } from "element-plus";
import * as API from "@/helpers/api.js";

const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "CouponCodeView",
};
</script>

<style lang="scss" scoped>
.reload-button,
.close-add-button {
   margin-left: 20px;
}
</style>
