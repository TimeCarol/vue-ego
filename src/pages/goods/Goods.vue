<template>
    <div>
        <div class="header">
            <Input v-model="value" placeholder="请输入内容" @on-enter="searchGood(1)" />
            <Button type="primary" @click="searchGood(1)">查询</Button>
            <Button type="primary" @click="$router.push('/add-good')">添加</Button>
        </div>
        <div class="wrapper">
            <Table :columns="tableTitle" :data="tableData" border>
                <template slot-scope="{ row, index }" slot="action">
                    <Button type="info" size="small" style="margin-right: 5px" @click="handleEdit(row)">编辑</Button>
                    <Button type="error" size="small" @click="handleDelete(row)">删除</Button>
                </template>
            </Table>
        </div>
        <Pagination :total="totals" :page-size="pageSize" @changePage="changePage" />
    </div>
</template>

<script>
    import Pagination from "../../components/Pagination";
    export default {
        name: "Goods",
        components: {Pagination},
        data() {
            return {
                value: '',
                tableTitle: [
                    {
                        type: 'selection',
                        width: 60,
                        align: 'center'
                    },
                    {
                        title: '商品ID',
                        key: 'id',
                        resizable: true,
                        width: 100
                    },
                    {
                        title: '商品名称',
                        key: 'title',
                        resizable: true,
                        width: 200,
                        tooltip: true
                    },
                    {
                        title: '商品价格',
                        key: 'price',
                        resizable: true,
                        width: 160
                    },
                    {
                        title: '商品数量',
                        key: 'num',
                        resizable: true,
                        width: 160
                    },
                    {
                        title: '规格类目',
                        key: 'category',
                        resizable: true,
                        width: 200
                    },
                    {
                        title: '商品图片',
                        key: 'image',
                        resizable: true,
                        width: 200,
                        tooltip: true
                    },
                    {
                        title: '商品卖点',
                        key: 'sellPoint',
                        resizable: true,
                        width: 200,
                        tooltip: true
                    },
                    {
                        title: '商品描述',
                        key: 'descs',
                        resizable: true,
                        width: 200,
                        tooltip: true
                    },
                    {
                        title: '操作',
                        key: 'action',
                        fixed: 'right',
                        slot: 'action',
                        align: 'center',
                        width: 150
                    }
                ],
                tableData: [],
                totals: 0,
                pageSize: 0
            };
        },
        methods: {
            getGoodsListByPage(page) {
                this.$api.getGoodsList({
                    page
                }).then(
                    response => {
                        if (response.data.status === 200) {
                            this.tableData = response.data.data;
                            this.totals = response.data.total;
                            this.pageSize = response.data.pageSize;
                        }
                    },
                    error => {
                        console.log(error.message);
                    }
                );
            },
            changePage(page) {
                this.searchGood(page);
            },
            handleEdit(data) {

            },
            handleDelete(data) {

            },
            searchGood(page) {
                this.$api.searchGood({
                    search: this.value,
                    page: page || 1
                }).then(
                    response => {
                        if (response.data.status === 200) {
                            this.tableData = response.data.result;
                            this.totals = response.data.total;
                            this.pageSize = response.data.pageSize;
                        } else {
                            this.tableData = [];
                            this.totals = 0;
                            this.pageSize = 10;
                        }
                    },
                    error => {
                        console.log(error.message);
                    }
                );
            }
        },
        mounted() {
            this.getGoodsListByPage(1);
            //改变导航栏
            this.$bus.$emit('changeNav', [
                {name: '首页', path: '/'},
                {name: '商品管理', path: '/goods'}
            ]);
            //改变选中样式
            this.$bus.$emit('changeActive', 'goods');
        }
    }
</script>

<style scoped>
    .header {
        display: flex;
    }
    .header button {
        margin-left: 10px;
    }
    .wrapper {
        margin-top: 20px;
    }
</style>