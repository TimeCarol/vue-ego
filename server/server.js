//搭建express服务
const express = require('express');

const app = express();
//post请求表单数据
app.use(express.urlencoded({ extended: true }));
//静态文件托管
app.use(express.static('upload'));

const router = require('./router');

app.use('/api', router);

app.listen(9000, () => {
    console.log('服务在9000端口启动成功, url: http://localhost:9000');
});
