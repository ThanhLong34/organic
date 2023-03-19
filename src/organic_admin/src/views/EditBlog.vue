<template>
   <div class="py-4 container-fluid">
      <div class="card">
         <div class="card-header pb-0">
            <div class="row">
               <div class="col-md-12">
                  <h6 class="mb-0 text-uppercase">Chỉnh sửa bài viết</h6>
               </div>
            </div>
         </div>
         <div class="card-body pt-3 p-4">
            <div class="col-md-12">
               <div class="row">
                  <div class="col-md-12">
                     <div class="row">
                        <!-- title -->
                        <label
                           for="example-text-input"
                           class="form-control-label"
                        >
                           Tiêu đề bài viết
                           <span class="star-input-required">*</span>
                        </label>
                        <argon-input
                           ref="titleRef"
                           type="text"
                           icon="ni ni-single-copy-04"
                           iconDir="left"
                           placeholder="Nhập tiêu đề bài viết"
                           v-model="data.title"
                        />
                        <!-- systemAdminNickname -->
                        <label
                           for="example-text-input"
                           class="form-control-label"
                        >
                           Người tạo
                           <span class="star-input-required">*</span>
                        </label>
                        <argon-input
                           ref="systemAdminNicknameRef"
                           isDisable
                           type="text"
                           icon="ni ni-single-02"
                           iconDir="left"
                        />
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
                        drag
                        :limit="1"
                        list-type="picture-card"
                        :auto-upload="false"
                        :on-preview="handlePreviewImagesUploaded"
                        :on-exceed="handleUploadImageExceed"
                        :on-change="handleUploadFeatureImage"
                     >
                        <el-icon><Plus /></el-icon>
                        <div class="el-upload__text">
                           Kéo thả file hoặc <em>nhấn vào đây</em>
                        </div>
                        <template #tip>
                           <div class="el-upload__tip">
                              Chỉ chấp nhận định dạng file JPG hoặc PNG
                           </div>
                        </template>
                     </el-upload>
                  </div>
                  <div class="col-md-12 mt-3">
                     <argon-textarea
								ref="descriptionRef"
                        placeholder="Nhập mô tả"
                        v-model="data.description"
                     >
                        Mô tả
                     </argon-textarea>
                  </div>
                  <div class="col-md-12 mb-7">
                     <label for="example-text-input" class="form-control-label">
                        Nội dung
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
import ArgonTextarea from "@/components/ArgonTextarea.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "blog";

export default {
   name: "EditBlogView",
   components: { ArgonButton, ArgonInput, ArgonTextarea, Plus },
   data() {
      return {
         data: {
            title: "",
            featureImageId: null,
            description: "",
            content: "",
            systemAdminId: null,
         },

         // Upload images
         featureImageFiles: [],

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

                  this.featureImageFiles[0] = {
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
         this.$refs.titleRef?.setValue(this.data.title);
         this.$refs.systemAdminNicknameRef?.setValue(this.data.systemAdminNickname);
         this.$refs.descriptionRef?.setValue(this.data.description);
         this.$refs.quillEditorRef.setHTML(this.data.content);
      },
      handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof this.data.title === "string") {
            this.data.title = this.data.title.trim();
         }

         if (typeof this.data.description === "string") {
            this.data.description = this.data.description.trim();
         }
      },
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.data.title === "") {
            ElMessage({
               message: "Chưa nhập tiêu đề bài viết",
               type: "warning",
            });

            return false;
         }

         if (this.data.featureImageId === null || this.featureImageFiles.length <= 0) {
            ElMessage({
               message: "Chưa chọn ảnh đặc trưng cho bài viết",
               type: "warning",
            });

            return false;
         }

         return true;
      },
      handleSubmit() {
         if (!this.validateBeforeSubmit()) return;

         return API.put(
            apiPath + `/${apiGroup}/update.php`,
            {
               ...this.data,
               content: this.$refs.quillEditorRef.getHTML(),
            },
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: "Cập nhật bài viết thành công",
                     type: "success",
                  });

         			this.handleRedirectToBack();
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
      onReadyQuillEditor() {
         this.quillEditorEnable = true;
      },
   },
   created() {
      this.data.id = this.$route.params.id;
      this.getData();
   },
};
</script>

<style lang="scss" scoped>
</style>
