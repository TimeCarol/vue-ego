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
    //设置消息提示样式
    this.$Message.config({
      top: 50, //提示组件距离顶端的距离，单位像素
      duration: 5, //默认自动关闭的延时，单位秒
    });
  }
}).$mount('#app');
