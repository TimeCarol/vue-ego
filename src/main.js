import Vue from 'vue';
import App from './App.vue';
import VueRouter from "vue-router";
import router from './router';
//引入view-design
import './plugins/iviewui';
//清除默认样式
import './assets/css/reset.css';
//引入iconfont
import './assets/css/iconfont.css';

Vue.config.productionTip = false;
Vue.use(VueRouter);

new Vue({
  render: h => h(App),
  router
}).$mount('#app');
