<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Chi tiết sản phẩm</h6>
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
               {{ data.updatedAt ? data.updatedAt : "Chưa cập nhật lần nào" }}
            </div>
            <!-- name -->
            <label for="example-text-input" class="form-control-label mt-3">
               Tên sản phẩm
            </label>
            <div>
               {{ data.name }}
            </div>
            <!-- originPrice -->
            <label for="example-text-input" class="form-control-label mt-3">
               Giá gốc
            </label>
            <div>
               {{ toVND(data.originPrice) }}
            </div>
            <!-- promotionPrice -->
            <label for="example-text-input" class="form-control-label mt-3">
               Giá ưu đãi
            </label>
            <div>
               {{ toVND(data.promotionPrice) }}
            </div>
            <!-- unit -->
            <label for="example-text-input" class="form-control-label mt-3">
               Đơn vị tính
            </label>
            <div>
               {{ data.unit }}
            </div>
            <!-- types -->
            <label for="example-text-input" class="form-control-label mt-3">
               Loại
            </label>
            <div class="row switch-btns">
               <div class="col-md-4">
                  <argon-switch
                     isDisable
                     id="isSpecial"
                     name="isSpecial"
                     :checked="data.isSpecial"
                  >
                     Đặc biệt
                  </argon-switch>
               </div>
               <div class="col-md-4">
                  <argon-switch
                     isDisable
                     id="isNew"
                     name="isNew"
                     :checked="data.isNew"
                  >
                     Mới
                  </argon-switch>
               </div>
               <div class="col-md-4">
                  <argon-switch
                     isDisable
                     id="isBestOffer"
                     name="isBestOffer"
                     :checked="data.isBestOffer"
                  >
                     Ưu đãi tốt
                  </argon-switch>
               </div>
            </div>
            <!-- productCategoryName -->
            <label for="example-text-input" class="form-control-label mt-3">
               Danh mục sản phẩm
            </label>
            <div>
               {{ data.productCategoryName }}
            </div>
            <!-- featureImageId -->
            <label for="example-text-input" class="form-control-label mt-3">
               Ảnh đặc trưng
            </label>
            <div class="product-feature-image border-dashed">
               <img :src="data.featureImageUrl" alt="feature image" />
            </div>
            <!-- images -->
            <label for="example-text-input" class="form-control-label mt-3">
               Ảnh sản phẩm
            </label>
            <ul class="product-image-list">
               <li
                  class="product-image-item border-dashed"
                  v-for="item in imageFiles"
                  :key="item.id"
               >
                  <img :src="item.url" alt="product image" />
               </li>
            </ul>
            <!-- shortDescription -->
            <label for="example-text-input" class="form-control-label mt-3">
               Mô tả ngắn
            </label>
            <div>
               <p>{{ data.shortDescription }}</p>
            </div>
            <!-- shortDescription -->
            <label for="example-text-input" class="form-control-label mt-3">
               Thông tin / Mô tả
            </label>
            <div ref="descriptionRef" class="view-content"></div>
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
import ArgonSwitch from "@/components/ArgonSwitch.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "product";

import Funcs from "@/helpers/funcs.js";

export default {
   name: "ViewProductDetailsDialog",
   components: { ArgonButton, ArgonSwitch },
   emits: ["onCloseDialog"],
   props: {
      itemIdSelect: {
         type: Number,
         required: true,
      },
   },
   data() {
      return {
         // Funcs
         toVND: Funcs.toVND,

         data: {},
         imageFiles: [],
      };
   },
   methods: {
      getProductImageList() {
         return API.get(
            apiPath + `/product_image/get_list_by_product_id.php`,
            {
               productId: this.data.id,
            },
            (data) => {
               if (data.code === 1) {
                  this.imageFiles = data.data.map((i) => ({
                     id: +i.imageId,
                     url: i.imageUrl,
                  }));

                  // Not found data
                  if (data.data.length === 0) {
                     //
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
                     featureImageId: +data.data.featureImageId,
                     originPrice: +data.data.originPrice,
                     promotionPrice: +data.data.promotionPrice,
                     isSpecial: +data.data.isSpecial == 1,
                     isNew: +data.data.isNew == 1,
                     isBestOffer: +data.data.isBestOffer == 1,
                     productCategoryId: +data.data.productCategoryId,
                  };
                  this.$refs.descriptionRef.innerHTML = this.data.description;
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
   async created() {
      this.data.id = this.$props.itemIdSelect;

      await this.getData();
      await this.getProductImageList();
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

.product-image-list {
   display: grid;
   grid-template-columns: repeat(3, 1fr);
   gap: 10px;
   padding-left: 0;
}

.product-image-item {
   img {
      object-fit: contain;
      object-position: center;
      width: 100%;
      height: 100%;
      display: block;
   }
}

label.form-control-label {
   text-transform: uppercase;
}
</style>
