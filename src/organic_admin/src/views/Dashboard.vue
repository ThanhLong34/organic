<template>
   <div class="py-4 container-fluid">
      <div class="row">
         <div class="col-lg-12">
            <div class="row">
               <div class="col-lg-3 col-md-6 col-12">
                  <card
                     :title="statistics.productCategory.title"
                     :value="statistics.productCategory.value"
                     :iconClass="statistics.productCategory.iconClass"
                     :iconBackground="statistics.productCategory.iconBackground"
                     detail=""
                     directionReverse
                  ></card>
               </div>
               <div class="col-lg-3 col-md-6 col-12">
                  <card
                     :title="statistics.product.title"
                     :value="statistics.product.value"
                     :iconClass="statistics.product.iconClass"
                     :iconBackground="statistics.product.iconBackground"
                     detail=""
                     directionReverse
                  ></card>
               </div>
               <div class="col-lg-3 col-md-6 col-12">
                  <card
                     :title="statistics.blog.title"
                     :value="statistics.blog.value"
                     :iconClass="statistics.blog.iconClass"
                     :iconBackground="statistics.blog.iconBackground"
                     detail=""
                     directionReverse
                  ></card>
               </div>
               <div class="col-lg-3 col-md-6 col-12">
                  <card
                     :title="statistics.order.title"
                     :value="statistics.order.value"
                     :iconClass="statistics.order.iconClass"
                     :iconBackground="statistics.order.iconBackground"
                     detail=""
                     directionReverse
                  ></card>
               </div>
            </div>
            <div class="row">
               <div class="col-xl-6 mb-xl-0 mb-4">
                  <master-card />
               </div>
               <div class="col-xl-6">
                  <div class="row">
                     <div class="col-md-6">
                        <default-info-card
                           :classIcon="salary.classIcon"
                           :title="salary.title"
                           :desc="salary.desc"
                           :price="salary.price"
                        />
                     </div>
                     <div class="col-md-6">
                        <default-info-card
                           :classIcon="paypal.classIcon"
                           :title="paypal.title"
                           :desc="paypal.desc"
                           :price="paypal.price"
                        />
                     </div>
                  </div>
               </div>
            </div>
            <div class="row mt-4">
               <div class="col-lg-7 mb-lg">
                  <!-- line chart -->
                  <div class="card z-index-2">
                     <gradient-line-chart
                        title="Biểu đồ tổng tiền nhận được"
                        detail1="tăng 50%"
                        :detail2="`trong năm ${new Date().getFullYear()}`"
                     />
                  </div>
               </div>
               <div class="col-lg-5">
                  <carousel />
               </div>
            </div>
         </div>
      </div>
   </div>
</template>
<script>
import * as API from "@/helpers/api.js";

import MasterCard from "@/examples/Cards/MasterCard.vue";
import DefaultInfoCard from "@/examples/Cards/DefaultInfoCard.vue";
import Card from "@/examples/Cards/Card.vue";
import GradientLineChart from "@/examples/Charts/GradientLineChart.vue";
import Carousel from "../examples/Carousel.vue";

import { ElMessage } from "element-plus";

const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "DashboardView",
   components: {
      Card,
      GradientLineChart,
      Carousel,
      MasterCard,
      DefaultInfoCard,
   },
   data() {
      return {
         statistics: {
            productCategory: {
               title: "Danh mục SP",
               value: "0",
               iconClass: "ni ni-collection",
               iconBackground: "bg-gradient-warning",
            },
            product: {
               title: "Sản phẩm",
               value: "0",
               iconClass: "ni ni-diamond",
               iconBackground: "bg-gradient-primary",
            },
            blog: {
               title: "Bài viết",
               value: "0",
               iconClass: "ni ni-single-copy-04",
               iconBackground: "bg-gradient-info",
            },
            order: {
               title: "Đơn hàng",
               value: "0",
               iconClass: "ni ni-delivery-fast",
               iconBackground: "bg-gradient-success",
            },
         },
         salary: {
            classIcon: "text-white fa-solid fa-landmark",
            title: "Lương thưởng",
            desc: "Tương tác",
            price: "20.000.000",
         },
         paypal: {
            classIcon: "text-white fa-solid fa-sack-dollar",
            title: "Sản phẩm",
            desc: "Tự do",
            price: "100.000.000",
         },
      };
   },
   methods: {
      getProductCategoryList() {
         return API.get(
            apiPath + "/product_category/get_list.php",
            {},
            (data) => {
               if (data.code === 1) {
                  this.statistics.productCategory.value = `${data.totalItem}`;
               }
            }
         );
      },
      getProductList() {
         return API.get(
            apiPath + "/product/get_list.php",
            {},
            (data) => {
               if (data.code === 1) {
                  this.statistics.product.value = `${data.totalItem}`;
               }
            }
         );
      },
      getBlogList() {
         return API.get(
            apiPath + "/blog/get_list.php",
            {},
            (data) => {
               if (data.code === 1) {
                  this.statistics.blog.value = `${data.totalItem}`;
               }
            }
         );
      },
      getOrderList() {
         return API.get(
            apiPath + "/order/get_list.php",
            {},
            (data) => {
               if (data.code === 1) {
                  this.statistics.order.value = `${data.totalItem}`;
               }
            }
         );
      },
   },
   created() {
      this.getProductCategoryList();
      this.getProductList();
      this.getBlogList();
      this.getOrderList();
   },
};
</script>
