<template>
    <Form ref="formValidate" :model="formValidate" :rules="ruleValidate" :label-width="80">
        <FormItem label="商品类目" prop="category">
            <Cascader :data="categoryData" trigger="hover" v-model="formValidate.category"></Cascader>
        </FormItem>
        <FormItem label="商品名称" prop="title">
            <Input v-model="formValidate.title" placeholder="请输入商品名称"></Input>
        </FormItem>
        <FormItem label="商品价格" prop="price">
            <Input v-model="formValidate.price" placeholder="请输入商品价格" prefix="logo-yen"></Input>
        </FormItem>
        <FormItem label="商品数量" prop="num">
            <Input v-model="formValidate.num" placeholder="请输入商品数量" prefix="ios-calculator"></Input>
        </FormItem>
        <FormItem label="发布时间">
            <Row>
                <Col span="5">
                    <DatePicker type="date" placeholder="请选择日期" v-model="formValidate.date" format="yyyy-MM-dd"></DatePicker>
                </Col>
                <Col span="2" style="text-align: center">-</Col>
                <Col span="6">
                    <TimePicker type="time" placeholder="请选择时间" v-model="formValidate.time"></TimePicker>
                </Col>
            </Row>
        </FormItem>
        <FormItem label="商品卖点" prop="sellPoint">
            <Input v-model="formValidate.sellPoint" placeholder="请输入商品卖点"></Input>
        </FormItem>
        <FormItem label="商品图片" prop="image">
            <Upload action="//jsonplaceholder.typicode.com/posts/" accept="image/*">
                <Button icon="ios-cloud-upload-outline">上传图片</Button>
            </Upload>
        </FormItem>
        <FormItem label="商品描述" prop="descs">
            <Input v-model="formValidate.descs" type="textarea" :autosize="{minRows: 5, maxRows: 5}" placeholder="请输入商品描述"></Input>
        </FormItem>
        <FormItem>
            <Button type="primary" @click="handleSubmit('formValidate')">添加商品</Button>
            <Button @click="handleReset('formValidate')" style="margin-left: 8px">重置</Button>
        </FormItem>
    </Form>
</template>
<script>
    export default {
        name: 'AddGood',
        data () {
            return {
                modal: false,
                categoryData: [],
                formValidate: {
                    category: [], //商品类目
                    title: '', //商品名称
                    price: 0, //商品价格
                    num: 0, //商品数量
                    sellPoint: '', //商品卖点
                    image: '', //商品图片
                    descs: '', //商品描述
                    date: '', //商品发布日期
                    time: '', //商品发布时间
                },
                ruleValidate: {
                    title: [
                        { required: true, message: '商品名称不能为空', trigger: 'blur' }
                    ],
                    price: [
                        { required: true, message: '商品价格不能为空', trigger: 'blur' },
                        { type: 'number', message: '商品价格需要是数字', trigger: 'blur' }
                    ],
                    num: [
                        { required: true, message: '商品数量不能为空', trigger: 'blur' },
                        { type: 'number', message: '商品数量需要是数字', trigger: 'blur' }
                    ],
                    category: [
                        { required: true, message: '请选择一个商品类目', trigger: 'change' }
                    ]
                }
            }
        },
        methods: {
            handleSubmit (name) {
                this.$refs[name].validate((valid) => {
                    if (valid) {
                        this.$Message.success('Success!');
                    } else {
                        this.$Message.error('Fail!');
                    }
                })
            },
            handleReset (name) {
                this.$refs[name].resetFields();
            },
            ok() {
            },
            cancel() {
            }
        },
        mounted() {
            //改变导航栏
            this.$bus.$emit('changeNav', [
                {name: '首页', path: '/'},
                {name: '商品管理', path: '/goods'},
                {name: '添加商品', path: '/add-good'}
            ]);
            //改变选中样式
            this.$bus.$emit('changeActive', 'goods');
            //获得类目
            this.$api.getCategory({
                id: 1
            }).then(
                response => {
                    response.data.result.forEach(data => {
                        data.label = data.name;
                        data.value = data.cid
                    });
                    const data = response.data.result;
                    function getData($api, data) {
                        data.forEach(data => {
                            $api.getCategory({id:data.cid}).then(response=>{
                                if (response.data.status === 200) {
                                    response.data.result.forEach(data => {
                                        data.label = data.name;
                                        data.value = data.cid;
                                    });
                                    data.children = response.data.result;
                                    getData($api, data.children);
                                }
                            },error=>{console.log(error.message)})
                        });
                    }
                    getData(this.$api, data);
                    this.categoryData = data;
                    console.log(this.categoryData);
                },
                error => {
                    console.log(error.message);
                }
            )
        }
    }
</script>

<style scoped>

</style>