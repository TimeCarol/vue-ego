/**
 * 接口路径配置
 */
const base = {
    host: 'http://localhost:9000', //基础域名
    goodsList: '/api/api/projectList', //商品列表
    goodSearch: '/api/api/search', //搜索商品
    category: '/api/api/backend/itemCategory/selectItemCategoryByParentId',
    getCategoryByCid: '/api/api/backend/itemCategory/selectItemCategoryByCid',
    uploadUrl: '/api/api/upload', //图片上传 post请求
    addGoods: '/api/api/backend/item/insertTbItem', //保存商品信息
};

export default base;
