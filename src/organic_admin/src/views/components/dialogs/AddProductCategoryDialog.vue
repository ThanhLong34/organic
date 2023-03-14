<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Thêm danh mục sản phẩm</h6>
            </div>
         </div>
      </div>
      <div class="card-body pt-3 p-4">
         <div class="col-md-12">
            <!-- featureImageId -->
            <label for="example-text-input" class="form-control-label">
               Chọn ảnh đặc trưng
               <span class="star-input-required">*</span>
            </label>
            <el-upload
               ref="featureImageUploadRef"
               class="feature-image-upload"
               v-model:file-list="imageFiles"
               action="#"
               :limit="1"
               list-type="picture-card"
               :auto-upload="false"
               :on-preview="handlePreviewImagesUploaded"
               :on-remove="handleRemoveImagesUploaded"
               :on-exceed="handleUploadImageExceed"
               :on-change="handleUploadImage"
            >
               <el-icon><Plus /></el-icon>
            </el-upload>
            <el-dialog v-model="viewImageDialog.visible">
               <img
                  class="image-preview"
                  w-full
                  :src="viewImageDialog.url"
                  alt="Preview Image"
               />
            </el-dialog>
            <!-- name -->
            <label for="example-text-input" class="form-control-label mt-3">
               Tên danh mục
               <span class="star-input-required">*</span>
            </label>
            <argon-input
               type="text"
               placeholder="Nhập tên danh mục"
               v-model="data.name"
            />
         </div>
         <div class="col-md-12 pt-3">
            <div class="action-btns text-end">
               <argon-button
                  color="success"
                  size="sm"
                  variant="gradient"
                  class="action-btn me-4"
                  @click="handleSubmit"
               >
                  Lưu
               </argon-button>
               <argon-button
                  color="warning"
                  size="sm"
                  variant="gradient"
                  class="action-btn"
                  @click="handleCloseDialog"
               >
                  Hủy
               </argon-button>
            </div>
         </div>
      </div>
      <!-- View image dialog -->
      <el-dialog v-model="viewImageDialog.visible">
         <img
            class="image-preview"
            w-full
            :src="viewImageDialog.url"
            alt="Preview Image"
         />
      </el-dialog>
   </div>
</template>

<script>
import { ElMessage, genFileId } from "element-plus";
import { Plus } from "@element-plus/icons-vue";
import ArgonInput from "@/components/ArgonInput.vue";
import ArgonButton from "@/components/ArgonButton.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "product_category";

export default {
   name: "AddProductCategoryDialog",
   components: { ArgonButton, ArgonInput, Plus },
   emits: ["onCloseDialog"],
   data() {
      return {
         data: {
            name: "",
            featureImageId: null,
         },

         imageFiles: [],

         // View image dialog
         viewImageDialog: {
            visible: false,
            url: null,
         },
      };
   },
   methods: {
      handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof this.data.name === "string") {
            this.data.name = this.data.name.trim();
         }
      },
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.data.name === "") {
            ElMessage({
               message: "Không được để trống tên danh mục",
               type: "warning",
            });

            return false;
         }

         return true;
      },
      handleSubmit() {
         if (!this.validateBeforeSubmit()) return;

         return API.post(
            apiPath + `/${apiGroup}/add.php`,
            this.data,
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: data.message,
                     type: "success",
                  });

                  this.handleCloseDialog();
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
         this.$emit("onCloseDialog", "add");
      },
      handlePreviewImagesUploaded(uploadFile) {
         this.viewImageDialog.url = uploadFile.url;
         this.viewImageDialog.visible = true;
      },
      handleRemoveImagesUploaded(uploadFile) {},
      handleUploadImage(uploadFile) {
         if (uploadFile.raw) {
            return API.uploadImage(
               apiPath + `/image/upload.php`,
               uploadFile.raw,
               (data) => {
                  if (data.code === 1) {
                     ElMessage({
                        message: "Upload ảnh thành công",
                        type: "success",
                     });

                     uploadFile.id = +data.data.id;
                     uploadFile.url = data.data.link;

                     this.data.featureImageId = uploadFile.id;
                  } else {
                     ElMessage({
                        message: data.message,
                        type: "error",
                     });
                  }
               }
            );
         }
      },
      handleUploadImageExceed(files) {
         this.$refs["featureImageUploadRef"].clearFiles();
         const file = files[0];
         file.uid = genFileId();
         this.$refs["featureImageUploadRef"].handleStart(file);
      },
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";
</style>
