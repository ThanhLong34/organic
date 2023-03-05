import { createApp } from "vue";
import App from "./App.vue";
import store from "./store";
import router from "./router";
import "./assets/css/nucleo-icons.css";
import "./assets/css/nucleo-svg.css";
import ArgonDashboard from "./argon-dashboard";

// Element Plus
import ElementPlus from "element-plus";
import "element-plus/dist/index.css";

// VueQuill
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";

// VueTippy
import { Tippy } from "vue-tippy";
import "tippy.js/dist/tippy.css";
import "tippy.js/themes/light.css";

const appInstance = createApp(App);
appInstance.use(store);
appInstance.use(router);
appInstance.use(ArgonDashboard);
appInstance.use(ElementPlus);
appInstance.component("QuillEditor", QuillEditor);
appInstance.component("Tippy", Tippy);
appInstance.mount("#app");

// Make prototype datetime
// For todays date
Date.prototype.today = function () {
	return (
		(this.getDate() < 10 ? "0" : "") +
		this.getDate() +
		"/" +
		(this.getMonth() + 1 < 10 ? "0" : "") +
		(this.getMonth() + 1) +
		"/" +
		this.getFullYear()
	);
};
// For the time now
Date.prototype.timeNow = function () {
	return (
		(this.getHours() < 10 ? "0" : "") +
		this.getHours() +
		":" +
		(this.getMinutes() < 10 ? "0" : "") +
		this.getMinutes() +
		":" +
		(this.getSeconds() < 10 ? "0" : "") +
		this.getSeconds()
	);
};
