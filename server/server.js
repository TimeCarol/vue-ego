//搭建express服务
const express = require('express');

const app = express();

const router = require('./router');

app.use('/api', router);

app.listen(9000, () => {
    console.log('服务在9000端口启动成功, url: http://localhost:9000');
});
