/**
 * 请求的方法
 */
import axios from 'axios';
import base from './base';

const api = {
    /**
     * 商品列表
     */
    getGoodsList(params) {
        return axios.get(base.goodsList, {params});
    },
    searchGood(params) {
        return axios.get(base.goodSearch, {params});
    },
    getCategory(params) {
        return axios.get(base.category, {params});
    }
};


export default api;
