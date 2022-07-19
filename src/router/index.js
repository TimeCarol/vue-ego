import VueRouter from "vue-router";
import Layout from "@/pages/layout/Index";
import Login from "@/pages/login/Login";
import Home from "@/pages/home/Home";
import Goods from "@/pages/goods/Goods";
import Params from "@/pages/params/Params";
import Advert from "@/pages/advert/Advert";
import Order from "@/pages/order/Order";
import OrderList from "@/pages/order/OrderList";
import ReturnOrder from "@/pages/order/ReturnOrder";
import AddGood from "@/pages/goods/AddGood";

const routes = [
    {
        path: '',
        component: Layout,
        children: [
            {
                path: '/',
                name: 'Home',
                component: Home
            },
            {
                path: '/goods',
                name: 'Goods',
                component: Goods
            },
            {
                path: '/add-good',
                name: 'AddGood',
                component: AddGood
            },
            {
                path: '/params',
                name: 'Params',
                component: Params
            },
            {
                path: '/advert',
                name: 'Advert',
                component: Advert
            },
            {
                path: '/order',
                name: 'Order',
                component: Order,
                redirect: '/order/order-list',
                children: [
                    {
                        path: 'order-list',
                        name: 'OrderList',
                        component: OrderList
                    },
                    {
                        path: 'return-order',
                        name: 'ReturnOrder',
                        component: ReturnOrder
                    }
                ]
            }
        ]
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
