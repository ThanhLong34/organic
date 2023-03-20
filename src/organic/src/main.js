import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

// import Swiper styles
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";
import "swiper/css/scrollbar";

// Element Plus
import ElementPlus from "element-plus";
import "element-plus/dist/index.css";

// import image zoomer styles
import "vue-image-zoomer/dist/style.css";

const appInstance = createApp(App);
appInstance.use(store);
appInstance.use(router);
appInstance.use(ElementPlus);
appInstance.mount("#app");
