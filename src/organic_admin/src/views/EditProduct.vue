<template>
   <div class="py-4 container-fluid">
      <div class="card">
         <div class="card-header pb-0">
            <div class="row">
               <div class="col-md-12">
                  <h6 class="mb-0 text-uppercase">Thêm sản phẩm</h6>
               </div>
            </div>
         </div>
         <div class="card-body pt-3 p-4">
            <div class="col-md-12">
               <div class="row">
                  <div class="col-md-12">
                     <div class="row">
                        <!-- name -->
                        <label
                           for="example-text-input"
                           class="form-control-label"
                        >
                           Tên sản phẩm
                           <span class="star-input-required">*</span>
                        </label>
                        <argon-input
                           type="text"
                           icon="ni ni-app"
                           iconDir="left"
                           placeholder="Nhập tên sản phẩm"
                           v-model="data.name"
                        />
                        <!-- originPrice -->
                        <label
                           for="example-text-input"
                           class="form-control-label"
                        >
                           Giá gốc
                           <span class="star-input-required">*</span>
                        </label>
                        <argon-input
                           type="number"
                           icon="ni ni-money-coins"
                           iconDir="left"
                           placeholder="Nhập giá gốc. VD: 100000"
                           v-model="data.originPrice"
                        />
                        <!-- promotionPrice -->
                        <label
                           for="example-text-input"
                           class="form-control-label"
                        >
                           Giá ưu đãi
                        </label>
                        <argon-input
                           type="number"
                           icon="ni ni-money-coins"
                           iconDir="left"
                           placeholder="Nhập giá ưu đãi. VD: 100000"
                           v-model="data.promotionPrice"
                        />
                        <!-- types -->
                        <label
                           for="example-text-input"
                           class="form-control-label mt-2"
                        >
                           Tùy chọn loại
                        </label>
                        <div class="row switch-btns">
                           <div class="col-md-4">
                              <argon-switch
                                 id="isSpecial"
                                 name="isSpecial"
                                 v-model="data.isSpecial"
                              >
                                 Đặc biệt
                              </argon-switch>
                           </div>
                           <div class="col-md-4">
                              <argon-switch
                                 id="isNew"
                                 name="isNew"
                                 v-model="data.isNew"
                              >
                                 Mới
                              </argon-switch>
                           </div>
                           <div class="col-md-4">
                              <argon-switch
                                 id="isBestOffer"
                                 name="isBestOffer"
                                 v-model="data.isBestOffer"
                              >
                                 Ưu đãi tốt
                              </argon-switch>
                           </div>
                        </div>
                        <!-- productCategoryId -->
                        <div class="selection-wrap mt-3">
                           <label
                              for="example-text-input"
                              class="form-control-label"
                           >
                              Danh mục sản phẩm
                              <span class="star-input-required">*</span>
                           </label>
                           <el-select
                              v-model="data.productCategoryId"
                              filterable
                              placeholder="Chọn danh mục sản phẩm"
                           >
                              <el-option
                                 v-for="item in productCategoryList"
                                 :key="item.id"
                                 :label="item.name"
                                 :value="item.id"
                              />
                           </el-select>
                        </div>
                     </div>
                  </div>
                  <!-- featureImageId -->
                  <div class="col-md-12 mt-3">
                     <label for="example-text-input" class="form-control-label">
                        Chọn ảnh đặc trưng
                        <span class="star-input-required">*</span>
                     </label>
                     <el-upload
                        ref="featureImageUploadRef"
                        class="feature-image-upload"
                        v-model:file-list="featureImageFiles"
                        action="#"
                        :limit="1"
                        list-type="picture-card"
                        :auto-upload="false"
                        :on-preview="handlePreviewImagesUploaded"
                        :on-exceed="handleUploadImageExceed"
                        :on-change="handleUploadFeatureImage"
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
                  </div>
                  <!-- product images -->
                  <div class="col-md-12 mt-3">
                     <label for="example-text-input" class="form-control-label">
                        Chọn ảnh sản phẩm
                     </label>
                     <el-upload
                        v-model:file-list="imageFiles"
                        action="#"
                        list-type="picture-card"
                        :auto-upload="false"
                        :on-preview="handlePreviewImagesUploaded"
                        :on-remove="handleRemoveImagesUploaded"
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
                  </div>
                  <div class="col-md-12 mt-3">
                     <argon-textarea
                        placeholder="Nhập mô tả ngắn"
                        v-model="data.shortDescription"
                     >
                        Mô tả ngắn
                     </argon-textarea>
                  </div>
                  <div class="col-md-12 mb-7">
                     <label for="example-text-input" class="form-control-label">
                        Thông tin / Mô tả
                     </label>
                     <QuillEditor
                        ref="quillEditorRef"
                        theme="snow"
                        toolbar="essential"
                        :enable="quillEditorEnable"
                        @ready="onReadyQuillEditor"
                     />
                  </div>
               </div>
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
                     @click="handleRedirectToBack"
                  >
                     Hủy
                  </argon-button>
               </div>
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
import ArgonSwitch from "@/components/ArgonSwitch.vue";
import ArgonTextarea from "@/components/ArgonTextarea.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "product";

export default {
   name: "EditProductView",
   components: { ArgonButton, ArgonInput, ArgonSwitch, ArgonTextarea, Plus },
   data() {
      return {
			data: {},
         dataChange: {
            name: null,
            featureImageId: null,
            originPrice: null,
            promotionPrice: null,
            isSpecial: false,
            isNew: false,
            isBestOffer: false,
            shortDescription: null,
            // description: "",
            productCategoryId: null,
         },

         productCategoryList: [],

         // Upload images
         featureImageFiles: [],
         imageFiles: [],

         // View image dialog
         viewImageDialog: {
            visible: false,
            url: null,
         },

         // Quill editor
         quillEditorEnable: false,
      };
   },
   methods: {
      getProductCategoryList() {
         return API.get(
            apiPath + `/product_category/get_list.php`,
            {},
            (data) => {
               if (data.code === 1) {
                  this.productCategoryList = data.data.map((i) => ({
                     ...i,
                     id: +i.id,
                  }));

                  // Not found data
                  if (data.data.length === 0) {
                     ElMessage({
                        message: "Không có dữ liệu danh mục sản phẩm",
                        type: "warning",
                     });
                  }
               } else {
                  ElMessage({
                     message: data.message,
                     type: "error",
                  });
               }
            }
         );
      },
      handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof this.data.name === "string") {
            this.data.name = this.data.name.trim();
         }

         if (typeof this.data.shortDescription === "string") {
            this.data.shortDescription = this.data.shortDescription.trim();
         }
      },
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.data.name === "") {
            ElMessage({
               message: "Chưa nhập tên sản phẩm",
               type: "warning",
            });

            return false;
         }

         if (this.data.originPrice === null) {
            ElMessage({
               message: "Chưa nhập giá gốc cho sản phẩm",
               type: "warning",
            });

            return false;
         }

         if (this.data.productCategoryId === null) {
            ElMessage({
               message: "Chưa chọn danh mục cho sản phẩm",
               type: "warning",
            });

            return false;
         }

         if (this.data.featureImageId === null) {
            ElMessage({
               message: "Chưa chọn ảnh đặc trưng cho sản phẩm",
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
            {
               ...this.data,
               description: this.$refs.quillEditorRef.getHTML(),
            },
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: "Thêm sản phẩm thành công",
                     type: "success",
                  });

						// Lưu các ảnh của sản phẩm trong CSDL
                  this.handleSubmitImageUploads(data.data.productId);
               } else {
                  ElMessage({
                     message: data.message,
                     type: "error",
                  });
               }
            }
         );
      },
      handleSubmitImageUploads(productId) {
			return API.post(
            apiPath + `/product_image/add_list.php`,
            {
               productId,
					imageIdList: this.imageFiles.map(i => i.id)
            },
            (data) => {
               if (data.code === 1) {
                  this.$router.go(-1);
               } else {
                  ElMessage({
                     message: data.message,
                     type: "error",
                  });
               }
            }
         );
		},
      handleRedirectToBack() {
         this.$router.go(-1);
      },
      handlePreviewImagesUploaded(uploadFile) {
         this.viewImageDialog.url = uploadFile.url;
         this.viewImageDialog.visible = true;
      },
      handleUploadImageExceed(files) {
         this.$refs["featureImageUploadRef"].clearFiles();
         const file = files[0];
         file.uid = genFileId();
         this.$refs["featureImageUploadRef"].handleStart(file);
      },
      handleRemoveImagesUploaded(uploadFile) {},
      handleUploadFeatureImage(uploadFile) {
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
      onReadyQuillEditor() {
         this.quillEditorEnable = true;
      },
   },
   created() {
		// this.data.id = this.$route.params.productId;
		console.log(this.$route.params.id);
      this.getProductCategoryList();
   },
};
</script>

<style lang="scss" scoped>
</style>
