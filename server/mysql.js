//连接数据库  1.安装mysql 2.创建连接
const mysql = require('mysql');

//创建数据库连接
const client = mysql.createConnection({
    host: 'localhost', //数据域名 地址
    user: 'root', //用户名
    password: 'root', //密码
    database: 'ego',
    // port:'3306'
});
function now() {
    const date = new Date();
    return `${date.getFullYear()}-${date.getMonth()}-${date.getDate()} ${date.getHours()}:${date.getMinutes()}:${date.getSeconds()}.${date.getMilliseconds()}`;
}
function printSqlInfo(sql) {
    console.log(`${now()} [main] INFO executeSQL - ${sql}`);
}
//封装数据库操作语句 sql语句 参数数组arr  callback成功函数结果
function sqlFun(sql, arr, callback) {
    //打印sql信息
    if (arr) printSqlInfo(sql+ '  Parameter => ' + arr);
    else printSqlInfo(sql);
    client.query(sql, arr, function (error, result) {
        if (error) {
            console.log('数据库语句错误');
            return;
        }
        callback(result)
    });
}

module.exports=sqlFun;
