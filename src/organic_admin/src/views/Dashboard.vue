<template>
   <div class="py-4 container-fluid">
      <div class="row">
         <div class="col-lg-12">
            <div class="row">
               <div class="col-lg-3 col-md-6 col-12">
                  <card
                     :title="statistics.category.title"
                     :value="statistics.category.value"
                     :iconClass="statistics.category.iconClass"
                     :iconBackground="statistics.category.iconBackground"
                     detail=""
                     directionReverse
                  ></card>
               </div>
               <div class="col-lg-3 col-md-6 col-12">
                  <card
                     :title="statistics.project.title"
                     :value="statistics.project.value"
                     :iconClass="statistics.project.iconClass"
                     :iconBackground="statistics.project.iconBackground"
                     detail=""
                     directionReverse
                  ></card>
               </div>
               <div class="col-lg-3 col-md-6 col-12">
                  <card
                     :title="statistics.customerAccount.title"
                     :value="statistics.customerAccount.value"
                     :iconClass="statistics.customerAccount.iconClass"
                     :iconBackground="statistics.customerAccount.iconBackground"
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
import Carousel from "./components/Carousel.vue";

import { ElMessage } from "element-plus";

const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "dashboard-default",
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
            category: {
               title: "Danh mục",
               value: "0",
               iconClass: "ni ni-collection",
               iconBackground: "bg-gradient-warning",
            },
            project: {
               title: "Dự án",
               value: "0",
               iconClass: "ni ni-app",
               iconBackground: "bg-gradient-info",
            },
            customerAccount: {
               title: "Khách hàng",
               value: "0",
               iconClass: "ni ni-badge",
               iconBackground: "bg-gradient-primary",
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
            title: "Tiền lương",
            desc: "Tương tác",
            price: "20.000.000 VND",
         },
         paypal: {
            classIcon: "text-white fa-solid fa-sack-dollar",
            title: "Tiền dự án",
            desc: "Tự do",
            price: "100,000,000 VND",
         },
      };
   },
   methods: {
      getCategories() {
         return API.get(
            apiPath + "/category/get_list.php",
            {
               limit: 0,
               offset: 0,
            },
            (data) => {
               if (data.code === 1) {
                  this.statistics.category.value = `${data.data.length}`;
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Không lấy được dữ liệu danh mục",
                     type: "error",
                  });
                  console.error(data.message);
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
      getProjects() {
         return API.get(
            apiPath + "/project/get_list.php",
            {
               limit: 0,
               offset: 0,
            },
            (data) => {
               if (data.code === 1) {
                  this.statistics.project.value = `${data.data.length}`;
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Không lấy được dữ liệu dự án",
                     type: "error",
                  });
                  console.error(data.message);
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
      getCustomerAccounts() {
         return API.get(
            apiPath + "/customer_account/get_list.php",
            {
               limit: 0,
               offset: 0,
            },
            (data) => {
               if (data.code === 1) {
                  this.statistics.customerAccount.value = `${data.data.length}`;
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Không lấy được dữ liệu tài khoản khách hàng",
                     type: "error",
                  });
                  console.error(data.message);
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
      getOrders() {
         return API.get(
            apiPath + "/order/get_list.php",
            {
               limit: 0,
               offset: 0,
            },
            (data) => {
               if (data.code === 1) {
                  this.statistics.order.value = `${data.data.length}`;
                  this.paypal.price = data.data.reduce((total, order) => {
                     // Đã thanh toán
                     if (parseInt(order.Status) === 1) {
                        return parseInt(order.Total);
                     }
                     return 0;
                  }, 0);
                  this.paypal.price = this.paypal.price.toLocaleString(
                     "it-IT",
                     { style: "currency", currency: "VND" }
                  );
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Không lấy được dữ liệu đơn hàng",
                     type: "error",
                  });
                  console.error(data.message);
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
   },
   created() {
      // this.getCategories();
      // this.getProjects();
      // this.getCustomerAccounts();
      // this.getOrders();
   },
};
</script>
