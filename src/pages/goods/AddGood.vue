<template>
    <Form ref="formValidate" :model="formValidate" :rules="ruleValidate" :label-width="80">
        <FormItem label="商品类目" prop="category">
            <Cascader :data="categoryData" trigger="hover" v-model="formValidate.category"></Cascader>
        </FormItem>
        <FormItem label="商品名称" prop="title">
            <Input v-model="formValidate.title" placeholder="请输入商品名称"></Input>
        </FormItem>
        <FormItem label="商品价格" prop="price">
            <Input number v-model="formValidate.price" placeholder="请输入商品价格" prefix="logo-yen"></Input>
        </FormItem>
        <FormItem label="商品数量" prop="num">
            <Input number type="number" v-model="formValidate.num" placeholder="请输入商品数量" prefix="ios-calculator"></Input>
        </FormItem>
        <FormItem label="发布时间">
            <Row>
                <Col span="3">
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
            <Upload :action="url"
                    accept=".png,.jpg,.jpeg,.webp"
                    :format="['png', 'jpg', 'jpeg', 'webp']"
                    :on-format-error="formatError"
                    :on-exceeded-size="exceededSize"
                    :on-success="uploadSuccess"
                    :on-error="uploadError"
                    :max-size="5120">
                <Button icon="ios-cloud-upload-outline">上传图片</Button>
            </Upload>
            <img :src="formValidate.image" v-if="formValidate.image" width="200" />
        </FormItem>
        <FormItem label="商品描述" prop="descs">
            <div style="border: 1px solid #ccc;">
                <Toolbar
                    style="border-bottom: 1px solid #ccc"
                    :editor="editor"
                    :defaultConfig="toolbarConfig"
                    :mode="'default'"
                />
                <Editor
                    style="height: 300px; overflow-y: hidden;"
                    v-model="formValidate.descs"
                    :defaultConfig="editorConfig"
                    :mode="'default'"
                    @onCreated="onCreated"
                />
            </div>
        </FormItem>
        <FormItem>
            <Button type="primary" @click="handleSubmit(formValidate)">添加商品</Button>
            <Button @click="handleReset(formValidate)" style="margin-left: 8px">重置</Button>
        </FormItem>
    </Form>
</template>
<script>
    import base from '../../api/base';
    import { Editor, Toolbar } from '@wangeditor/editor-for-vue';
    import '@wangeditor/editor/dist/css/style.css';
    export default {
        name: 'AddGood',
        data () {
            return {
                editor: null,
                html: '',
                toolbarConfig: {
                    toolbarKeys: ["bold", "underline", "italic", "through", "code", "sub", "fullScreen"
                                ,"sup","clearStyle","color","bgColor","fontSize","fontFamily"
                                , "indent","delIndent", "justifyLeft", "justifyRight", "justifyCenter"
                                , "justifyJustify", "lineHeight", "headerSelect", "todo", "undo", "redo"]
                },
                editorConfig: { placeholder: '请输入商品描述', autoFocus: false },
                url: base.uploadUrl, //图片地址服务器
                modal: false,
                categoryData: [],
                formValidate: {
                    category: [], //商品类目
                    title: '', //商品名称
                    price: '', //商品价格
                    num: '', //商品数量
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
                        { type: 'number', required: true, message: '商品价格需要是数字', trigger: 'blur' }
                    ],
                    num: [
                        { type: 'number', required: true, message: '商品数量需要是数字', trigger: 'blur' }
                    ],
                    category: [
                        { type: 'array', min: 1, required: true, message: '请选择商品类目', trigger: 'change' }
                    ]
                }
            }
        },
        methods: {
            formatError(file, fileList) { //图片后缀名不正确会调用此方法
                this.$Message.error({
                    background: true,
                    content: '上传的图片格式不正确'
                });
            },
            exceededSize(file, fileList) { //图片超出指定大小会调用此方法
                this.$Message.error({
                    background: true,
                    content: '图片大小不能超过5MB'
                });
            },
            uploadSuccess(response, file, fileList) { //上传成功后会调用此方法
                //设置图片路径
                this.formValidate.image = base.host + '/' + response.url.slice(7);
            },
            uploadError(error, file, fileList) { //上传失败后会调用此方法
                this.$Message.error('图片上传失败');
                console.log(error);
            },
            handleSubmit (value) { //点击添加商品按钮时会调用此方法
                this.$refs.formValidate.validate((valid) => {
                    if (valid) { //校验成功
                        if ('<p><br></p>' === value.descs) value.descs = '';
                        //查询对应cid的分类名称
                        this.$api.getCategoryByCid({cid: value.category.slice(-1)}).then(res => {
                            if (res.data.status === 200){
                                if (res.data.result) value.categoryName = res.data.result[0].name;
                            }
                        }).then(() => { //得到分类名称后再添加
                            //添加商品 title cid  category sellPoint price num descs paramsInfo image
                            this.$api.addGoods({
                                title: value.title,
                                cid: value.category.slice(-1),
                                category: value.categoryName,
                                sellPoint: value.sellPoint,
                                price: value.price,
                                num: value.num,
                                descs: value.descs,
                                image: value.image
                            }).then(
                                response => {
                                    if (response.data.status === 200) {
                                        this.$Message.success(response.data.msg);
                                        //跳转到商品列表页面
                                        this.$router.push('/goods');
                                    }
                                },
                                error => {
                                    this.$Message.error({
                                        background: true,
                                        content: error.message
                                    });
                                }
                            );
                        });
                    } else { //校验失败
                        this.$Message.error({
                            background: true,
                            content: '请完善商品信息'
                        });
                    }
                });
            },
            handleReset (value) { //点击重置按钮时会调用此方法
                this.$refs.formValidate.resetFields();
                this.formValidate.category = [];
                this.editor.clear(); //清空编辑阿奇
            },
            ok() {
            },
            onCreated(editor) { //wangEditor创建时会调用此方法
                this.editor = Object.seal(editor); // 一定要用 Object.seal() ，否则会报错
                //打印编辑器所有菜单码
                // console.log(editor.getAllMenuKeys());
            },
        },
        components: { Editor, Toolbar },
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
                },
                error => {
                    console.log(error.message);
                }
            )
        },
        beforeDestroy() {
            const editor = this.editor;
            if (editor == null) return;
            editor.destroy(); // 组件销毁时，及时销毁编辑器
        }
    }
</script>

<style scoped>

</style>