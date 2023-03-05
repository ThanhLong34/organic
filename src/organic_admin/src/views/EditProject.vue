<template>
   <div class="py-4 container-fluid">
      <div class="row">
         <div class="col-12">
            <div class="card mb-4">
               <div class="card-header pb-2">
                  <h6>Chỉnh sửa thông tin dự án</h6>
               </div>
               <div class="card-body px-4 pt-0 pb-4">
                  <div class="project-info">
                     <div class="row">
                        <div class="col-md-5">
                           <label
                              for="example-text-input"
                              class="form-control-label"
                              >Tên dự án
                              <span class="star-input-required">*</span></label
                           >
                           <argon-input
                              ref="projectNameRef"
                              type="text"
                              icon="ni ni-spaceship"
                              iconDir="left"
                              placeholder="Nhập tên dự án"
                              v-model="project.name"
                           />
                           <label
                              for="example-text-input"
                              class="form-control-label"
                              >Giá tiền (VND)</label
                           >
                           <argon-input
                              ref="projectPriceRef"
                              type="number"
                              icon="ni ni-money-coins"
                              iconDir="left"
                              placeholder="Nhập giá (0 VND)"
                              v-model="project.price"
                           />
                           <label
                              for="example-text-input"
                              class="form-control-label"
                              >Link Demo</label
                           >
                           <argon-input
                              ref="projectLinkDemoRef"
                              type="url"
                              icon="ni ni-world"
                              iconDir="left"
                              placeholder="https://"
                              v-model="project.linkDemo"
                           />
                           <label
                              for="example-text-input"
                              class="form-control-label"
                              >Link Download</label
                           >
                           <argon-input
                              ref="projectLinkDownloadRef"
                              type="url"
                              icon="ni ni-world"
                              iconDir="left"
                              placeholder="https://"
                              v-model="project.linkDownload"
                           />
                           <div class="row switch-btns">
                              <div class="col-md-6">
                                 <argon-switch
                                    id="isFree"
                                    name="Is Free"
                                    v-model="project.isFree"
                                    :checked="project.isFree"
                                 >
                                    Miễn phí
                                 </argon-switch>
                              </div>
                              <div class="col-md-6">
                                 <argon-switch
                                    id="isFeatured"
                                    name="Is Featured"
                                    v-model="project.isFeatured"
                                    :checked="project.isFeatured"
                                 >
                                    Đặc biệt
                                 </argon-switch>
                              </div>
                           </div>
                           <div class="selection-wrap">
                              <label
                                 for="example-text-input"
                                 class="form-control-label"
                                 >Danh mục
                                 <span class="star-input-required"
                                    >*</span
                                 ></label
                              >
                              <el-select
                                 v-model="project.categoryID"
                                 filterable
                                 placeholder="Chọn danh mục"
                              >
                                 <el-option
                                    v-for="item in categories"
                                    :key="item.id"
                                    :label="item.name"
                                    :value="item.id"
                                 />
                              </el-select>
                           </div>
                           <div class="selection-wrap">
                              <label
                                 for="example-text-input"
                                 class="form-control-label"
                                 >Thẻ</label
                              >
                              <el-select
                                 v-model="project.tagIDList"
                                 filterable
                                 multiple
                                 tag-type="success"
                                 placeholder="Chọn thẻ"
                              >
                                 <el-option
                                    v-for="item in tags"
                                    :key="item.id"
                                    :label="item.name"
                                    :value="item.id"
                                 />
                              </el-select>
                           </div>
                        </div>
                        <div class="col-md-7">
                           <label
                              for="example-text-input"
                              class="form-control-label"
                              >Avatar &amp; Ảnh</label
                           >
                           <div class="project-upload-avatar-images">
                              <el-upload
                                 v-model:file-list="imageFiles"
                                 action="#"
                                 list-type="picture-card"
                                 :auto-upload="false"
                                 :on-preview="previewImagesUploaded"
                                 :on-remove="removeImagesUploaded"
                                 :on-change="uploadImage"
                                 :before-upload="beforeUploadImageHandler"
                              >
                                 <el-icon><Plus /></el-icon>
                              </el-upload>
                              <el-dialog v-model="dialogVisible">
                                 <img
                                    class="image-preview"
                                    w-full
                                    :src="dialogImageUrl"
                                    alt="Preview Image"
                                 />
                              </el-dialog>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-12">
                        <div class="details-wrap">
                           <label
                              for="example-text-input"
                              class="form-control-label"
                           >
                              Chi tiết về dự án
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
                  <div class="bottom-btns">
                     <argon-button
                        color="primary"
                        size="sm"
                        variant="gradient"
                        @click="submitEdit"
                     >
                        Lưu thay đổi
                     </argon-button>
                     <argon-button
                        color="dark"
                        size="sm"
                        class="exit-button"
                        @click="$router.go(-1)"
                     >
                        Thoát
                     </argon-button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
import * as API from "@/helpers/api.js";

import ArgonInput from "@/components/ArgonInput.vue";
import ArgonButton from "@/components/ArgonButton.vue";
import ArgonSwitch from "@/components/ArgonSwitch.vue";

import { Plus } from "@element-plus/icons-vue";
import { ElMessage } from "element-plus";

const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const imageExts = ["jpeg", "jpg", "jfif", "png", "gif", "webp"];

export default {
   name: "edit-project",
   components: {
      ArgonInput,
      ArgonButton,
      ArgonSwitch,
      Plus,
   },
   data() {
      return {
         project: {
            id: 0,
            name: "",
            avatar: "",
            imageIDList: [],
            price: 0,
            details: "",
            linkDemo: "",
            linkDownload: "",
            updatedAt: "",
            isFree: false,
            isFeatured: false,
            categoryID: "",
            tagIDList: [],
         },
         categories: [],
         tags: [],
         dialogImageUrl: "",
         dialogVisible: false,
         imageFiles: [],
         quillEditorEnable: false,
      };
   },
   methods: {
      removeImagesUploaded(uploadFile) {
         let i = this.project.imageIDList.indexOf(uploadFile.id);
         if (i >= 0) {
            this.project.imageIDList.splice(i, 1);
         }
      },
      previewImagesUploaded(uploadFile) {
         this.dialogImageUrl = uploadFile.url;
         this.dialogVisible = true;
      },
      checkFileImageType(file) {
         return imageExts.includes(file.raw.type.split("/")[1]);
      },
      beforeUploadImageHandler(uploadFile) {
         if (!this.checkFileImageType(uploadFile)) {
            ElMessage({
               message:
                  "Chỉ chấp nhận các định dạng file sau: " +
                  imageExts.join(" | "),
               type: "error",
            });
            return false;
         }
         return true;
      },
      uploadImage(uploadFile) {
         const formData = new FormData();
         formData.append("image", uploadFile.raw);

         return API.uploadFile(
            apiPath + "/image/upload.php",
            formData,
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: "Upload ảnh thành công",
                     type: "success",
                  });
                  uploadFile.id = +data.data.id;
                  uploadFile.url = data.data.link;
                  this.project.imageIDList.push(uploadFile.id);
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Upload ảnh thất bại",
                     type: "error",
                  });
               } else if (data.code === 3) {
                  ElMessage({
                     message: data.message,
                     type: "error",
                  });
               }
            },
            (error) => {
               ElMessage({
                  message: "Có lỗi, thử lại sau",
                  type: "error",
               });
               console.error(error);
            }
         );
      },
      getProjectDetails() {
         return this.$refs.quillEditorRef.getHTML();
      },
      getCategories() {
         return API.get(
            apiPath + "/category/get_list.php",
            {
               limit: 0,
               offset: 0,
            },
            (data) => {
               if (data.code === 1) {
                  this.categories = data.data.map((item) => ({
                     id: +item.id,
                     name: item.Name,
                  }));
               } else if (data.code === 2) {
                  console.error(data.message);
               }
            },
            (error) => {
               console.error(error);
            }
         );
      },
      getTags() {
         return API.get(
            apiPath + "/tag/get_list.php",
            {
               limit: 0,
               offset: 0,
            },
            (data) => {
               if (data.code === 1) {
                  this.tags = data.data.map((item) => ({
                     id: +item.id,
                     name: item.Name,
                  }));
               } else if (data.code === 2) {
                  console.error(data.message);
               }
            },
            (error) => {
               console.error(error);
            }
         );
      },
      getImagesUploaded() {
         return API.get(
            apiPath + "/image/get_list_by_ids.php",
            {
               ids: this.project.imageIDList.join(","),
            },
            (data) => {
               if (data.code === 1) {
                  this.imageFiles = data.data.map((item) => ({
                     id: +item.id,
                     url: item.Link,
                  }));
               } else if (data.code === 2) {
                  // console.error(data.message);
               }
            },
            (error) => {
               console.error(error);
            }
         );
      },
      bindingProjectInfo() {
         this.$refs.projectNameRef.setValue(this.project.name);
         this.$refs.projectPriceRef.setValue(this.project.price);
         this.$refs.projectLinkDemoRef.setValue(this.project.linkDemo);
         this.$refs.projectLinkDownloadRef.setValue(this.project.linkDownload);
         this.$refs.quillEditorRef.setHTML(this.project.details);

         this.getImagesUploaded();
      },
      getProjectEdit() {
         return API.get(
            apiPath + "/project/get_item.php",
            {
               id: +this.project.id,
            },
            (data) => {
               if (data.code === 1) {
                  this.project.name = data.data.Name;
                  this.project.avatar = data.data.Avatar;
                  this.project.imageIDList = JSON.parse(
                     "[" + data.data.ImageIDList + "]"
                  );
                  this.project.price = data.data.Price;
                  this.project.details = data.data.Details;
                  this.project.linkDemo = data.data.LinkDemo;
                  this.project.linkDownload = data.data.LinkDownload;
                  this.project.isFree = data.data.IsFree == 1;
                  this.project.isFeatured = data.data.IsFeatured == 1;

                  this.project.categoryID = +data.data.CategoryID;
                  if (
                     !this.categories.find(
                        (i) => i.id === this.project.categoryID
                     )
                  ) {
                     this.project.categoryID = "Danh mục đã bị xóa";
                  }

                  this.project.tagIDList = JSON.parse(
                     "[" + data.data.TagIDList + "]"
                  );

                  this.bindingProjectInfo();
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Không tìm thấy dự án cần lấy",
                     type: "error",
                  });
               } else if (data.code === 3) {
                  ElMessage({
                     message: "Lấy thông tin dự án thất bại",
                     type: "error",
                  });
               }
            },
            (error) => {
               ElMessage({
                  message: "Có lỗi, thử lại sau",
                  type: "error",
               });
               console.error(error);
            }
         );
      },
      submitEdit() {
         if (this.project.name === "") {
            ElMessage({
               message: "Chưa nhập tên dự án",
               type: "warning",
            });
            return;
         }

         if (this.project.categoryID === "") {
            ElMessage({
               message: "Chưa chọn danh mục",
               type: "warning",
            });
            return;
         }

         this.project.avatar = "";
         if (this.imageFiles && this.imageFiles.length >= 0) {
            if (this.imageFiles[0] && this.imageFiles[0].url) {
               this.project.avatar = this.imageFiles[0].url;
            }
         }

         this.project.details = this.getProjectDetails();

         return API.put(
            apiPath + "/project/update.php",
            {
               ...this.project,
               categoryID: +this.project.categoryID,
               tagIDList: this.project.tagIDList.map((i) => +i),
            },
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: "Cập nhật thành công",
                     type: "success",
                  });

                  this.$router.go(-1);
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Cập nhật thất bại",
                     type: "error",
                  });
               } else if (data.code === 3) {
                  ElMessage({
                     message: "Tên dự án đã tồn tại",
                     type: "warning",
                  });
               }
            },
            (error) => {
               ElMessage({
                  message: "Có lỗi, thử lại sau",
                  type: "error",
               });
               console.error(error);
            }
         );
      },
      onReadyQuillEditor() {
         this.quillEditorEnable = true;
      },
   },
   async created() {
      this.project.id = +this.$route.params.id;

      await this.getCategories();
      await this.getTags();
      await this.getProjectEdit();
   },
};
</script>

<style lang="scss" scoped>
input.form-control {
   margin-bottom: 1rem;
}

.bottom-btns {
   margin-top: 24px;
}

.switch-btns {
   margin-top: 24px;
   margin-bottom: 24px;
}

.exit-button {
   margin-left: 20px;
}

.selection-wrap {
   margin-top: 16px;
}

.upload-avatar-btn-wrap {
   display: flex;
   justify-content: center;
   margin-top: 24px;
}

.avatar-img {
   max-height: 450px;
   border: 1px solid #d2d6da;
   padding: 1px;
   border-radius: 0.5rem;
   display: flex;
   justify-content: center;
   img {
      width: 100%;
      object-fit: contain;
      object-position: center;
      aspect-ratio: 1/1;
   }
}

.image-preview {
   object-fit: contain;
   object-position: center;
   width: 100%;
   aspect-ratio: 1/1;
}

.details-wrap {
   margin-top: 24px;
}
</style>
