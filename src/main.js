import Vue from 'vue';
import App from './App.vue';
import VueRouter from "vue-router";
import router from './router';
//引入view-design
import './plugins/iviewui';
import api from './api';

Vue.prototype.$api = api;
Vue.config.productionTip = false;
Vue.use(VueRouter);

new Vue({
  render: h => h(App),
  router,
  beforeCreate() {
    Vue.prototype.$bus = this;
  }
}).$mount('#app');
