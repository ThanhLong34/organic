<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Chỉnh sửa danh mục sản phẩm</h6>
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
               ref="nameRef"
               type="text"
               placeholder="Nhập tên Route"
               v-model="dataChange.name"
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
   </div>
</template>

<script>
import { ElMessage, genFileId } from "element-plus";
import { Plus } from "@element-plus/icons-vue";
import ArgonButton from "@/components/ArgonButton.vue";
import ArgonInput from "@/components/ArgonInput.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "product_category";

export default {
   name: "EditProductCategoryDialog",
   components: { ArgonButton, ArgonInput, Plus },
   emits: ["onCloseDialog"],
   props: {
      itemIdSelect: {
         type: Number,
         required: true,
      },
   },
   data() {
      return {
         data: {
            name: "",
            featureImageId: null,
         },

         dataChange: {
            name: null,
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
      getData() {
         return API.get(
            apiPath + `/${apiGroup}/get_item.php`,
            {
               id: this.data.id,
            },
            (data) => {
               if (data.code === 1) {
                  this.data.name = data.data.name;
                  this.imageFiles[0] = {
                     id: +data.data.featureImageId,
                     url: data.data.featureImageUrl,
                  };

                  // Binding data
                  this.bindingData();
               } else {
                  ElMessage({
                     message: data.message,
                     type: "error",
                  });
               }
            }
         );
      },
      bindingData() {
         this.$refs.nameRef?.setValue(this.data.name);
      },
      handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof this.dataChange.name === "string") {
            this.dataChange.name = this.dataChange.name.trim();
         }
      },
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.dataChange.name === "" || this.dataChange.name === null) {
            ElMessage({
               message: "Nhập tên danh mục mới hoặc không được để trống",
               type: "warning",
            });

            return false;
         }

         if (this.imageFiles.length <= 0) {
            ElMessage({
               message: "Nên chọn ảnh cho danh mục",
               type: "warning",
            });

            return false;
         }

         return true;
      },
      handleSubmit() {
         if (!this.validateBeforeSubmit()) return;

         return API.post(
            apiPath + `/${apiGroup}/update.php`,
            {
               id: this.data.id,
               ...this.dataChange,
            },
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
         this.$emit("onCloseDialog", "edit");
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

                     this.dataChange.featureImageId = uploadFile.id;
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
   created() {
      this.data.id = this.$props.itemIdSelect;
      this.getData();
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";
</style>
