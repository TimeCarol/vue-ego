import VueRouter from "vue-router";
import Layout from "@/pages/layout/Index";
import Login from "@/pages/login/Login";

const routes = [
    {
        path: '',
        component: Layout
    },
    {
        name: 'Login',
        path: '/login',
        component: Login
    }
];

export default new VueRouter({
    routes
});
