import './bootstrap';
import router from './routes.js';
import App from './App.vue';
import { createApp } from 'vue'

console.log(router);

createApp(App).use(router).mount('#app')
