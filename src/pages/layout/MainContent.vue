<template>
    <Layout :style="{'padding-left': '20px', 'padding-right': '20px'}">
        <Breadcrumb :style="{margin: '16px 0'}">
            <BreadcrumbItem :to="item.path" v-for="(item, index) in nav" :key="index">
                {{item.name}}
            </BreadcrumbItem>
        </Breadcrumb>
        <Content :style="{'padding-top': '24px', minHeight: '280px', background: '#fff'}">
            <Layout style="height: 100%">
                <Sider hide-trigger :style="{background: '#fff'}" breakpoint="md">
                    <Menu :active-name="activeName" theme="light" width="auto" :open-names="['1']" style="height: 100%">
                        <MenuItem name="home" to="/">
                            <Icon type="md-home" />
                            首页
                        </MenuItem>
                        <MenuItem name="goods" to="/goods">
                            <Icon type="md-cube" />
                            商品管理
                        </MenuItem>
                        <MenuItem name="params" to="/params">
                            <Icon type="md-construct" />
                            规格参数
                        </MenuItem>
                        <MenuItem name="advert" to="/advert">
                            <Icon type="md-list-box" />
                            广告分类
                        </MenuItem>
                        <Submenu name="order">
                            <template slot="title">
                                <Icon type="md-bookmarks" />
                                订单管理
                            </template>
                            <MenuItem name="order-list" to="/order/order-list">订单列表</MenuItem>
                            <MenuItem name="return-order" to="/order/return-order">退货管理</MenuItem>
                        </Submenu>
                        <MenuItem name="personal">
                            <Icon type="md-contact" />
                            个人中心
                        </MenuItem>
                    </Menu>
                </Sider>
                <Content :style="{padding: '24px', minHeight: '280px', background: '#fff'}">
                    <router-view></router-view>
                </Content>
            </Layout>
        </Content>
    </Layout>
</template>

<script>
    import Goods from "../goods/Goods";
    import Params from "../params/Params";
    export default {
        name: "MainContent",
        data() {
            return {
                nav: [
                    {name: '首页', path: '/'}
                ],
                activeName: 'home'
            };
        },
        components: {Params, Goods},
        mounted() {
            //改变导航栏
            this.$bus.$on('changeNav', (nav) => {
                this.nav = nav;
            });
            //改变样式
            this.$bus.$on('changeActive', (activeName) => {
                this.activeName = activeName;
            });
        },
        beforeDestroy() {
            //解绑自定义事件
            this.$bus.$off(['changeNav', 'changeActive']);
        }
    }
</script>

<style scoped>

</style>