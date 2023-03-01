import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

// import Swiper styles
import 'swiper/css'

// import image zoomer styles
import 'vue-image-zoomer/dist/style.css'

createApp(App).use(store).use(router).mount('#app')
