<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Chi tiết bài viết</h6>
            </div>
         </div>
      </div>
      <div class="card-body pt-3 p-4">
         <div class="col-md-12">
            <!-- createdAt -->
            <label for="example-text-input" class="form-control-label mt-3">
               Thời gian tạo
            </label>
				<div>
               {{ data.createdAt }}
            </div>
            <!-- updatedAt -->
            <label for="example-text-input" class="form-control-label mt-3">
               Thời gian cập nhật
            </label>
				<div>
               {{ data.updatedAt ? data.updatedAt : 'Chưa cập nhật lần nào' }}
            </div>
            <!-- title -->
            <label for="example-text-input" class="form-control-label mt-3">
               Tiêu đề bài viết
            </label>
            <div>
               {{ data.title }}
            </div>
            <!-- systemAdminNickname -->
            <label for="example-text-input" class="form-control-label mt-3">
               Người tạo
            </label>
            <div>
               {{ data.systemAdminNickname }}
            </div>
            <!-- featureImageId -->
            <label for="example-text-input" class="form-control-label mt-3">
               Ảnh đặc trưng
            </label>
            <div class="product-feature-image border-dashed">
               <img :src="data.featureImageUrl" alt="feature image" />
            </div>
				<!-- description -->
            <label for="example-text-input" class="form-control-label mt-3">
               Mô tả
            </label>
				<div>
					<p>{{ data.description }}</p>
				</div>
				<!-- content -->
            <label for="example-text-input" class="form-control-label mt-3">
               Nội dung
            </label>
				<div ref="contentRef" class="view-content"></div>
         </div>
         <div class="col-md-12 pt-3">
            <div class="action-btns text-end">
               <argon-button
                  color="warning"
                  size="sm"
                  variant="gradient"
                  class="action-btn"
                  @click="handleCloseDialog"
               >
                  Đóng
               </argon-button>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
import { ElMessage } from "element-plus";
import ArgonButton from "@/components/ArgonButton.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "blog";

export default {
   name: "ViewBlogDetailsDialog",
   components: { ArgonButton },
   emits: ["onCloseDialog"],
   props: {
      itemIdSelect: {
         type: Number,
         required: true,
      },
   },
   data() {
      return {
         data: {},
      };
   },
   methods: {
      getData() {
         return API.get(
            apiPath + `/${apiGroup}/get_item.php`,
            {
               id: this.data.id,
            },
            (data) => {
               if (data.code === 1) {
                  this.data = {
							...data.data,
							systemAdminId: +data.data.systemAdminId,
							featureImageId: +data.data.featureImageId,
						};
						this.$refs.contentRef.innerHTML = this.data.content;
               } else {
                  ElMessage({
                     message: data.message,
                     type: "error",
                  });
               }
            }
         );
      },
      handleCloseDialog() {
         this.$emit("onCloseDialog", "view");
      },
   },
   created() {
      this.data.id = this.$props.itemIdSelect;
      this.getData();
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";

.product-feature-image {
   border: 1px dashed #f1f1f1;
   width: 100%;

   img {
      object-fit: contain;
      object-position: center;
      width: 100%;
      height: 100%;
      max-height: 200px;
      display: block;
   }
}

label.form-control-label {
	text-transform: uppercase;
}
</style>
