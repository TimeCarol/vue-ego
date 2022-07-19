const express = require('express');

const router = express.Router();
//导入数据库
const sqlFn = require('./mysql');

/**
 * 商品列表：获取分页 {total:'',arr:[{},{},{}],pagesize:8,}
 * 参数：page 页码
 */
router.get('/projectList', (req, res) => {
    const page = req.query.page || 1;
    const sqlLen = "select count(*) len from project";
    sqlFn(sqlLen, null, data => {
        let len = data[0].len;
        const sql = "select * from project order by id desc limit 10 offset " + (page - 1) * 10;
        sqlFn(sql, null, result => {
            if (result.length > 0) {
                res.send({
                    status: 200,
                    data: result,
                    pageSize: 10,
                    total: len
                })
            } else {
                res.send({
                    status: 500,
                    msg: "暂无数据"
                })
            }
        })
    })
});

/**
 * 商品查询接口 search
 * 参数：search
 */
router.get("/search", (req, res) => {
    const search = req.query.search;
    const page = req.query.page || 1;
    const sql = "SELECT SQL_CALC_FOUND_ROWS * FROM project WHERE CONCAT(`title`,`sellPoint`,`descs`) LIKE '%" + search + "%' ORDER BY id DESC LIMIT " + (page - 1) + ", 10";
    sqlFn(sql, null, (result) => {
        sqlFn("SELECT FOUND_ROWS() AS total", null, data => {
            if (result.length > 0) {
                res.send({
                    status: 200,
                    result,
                    total: data[0].total,
                    pageSize: 10
                });
            } else {
                res.send({
                    status: 500,
                    msg: "暂无数据"
                });
            }
        });
    });
});
/**
 * 类目选择
 * 接口说明：接口不同的参数cid 返回不同的类目数据 后台接受变量：id
 */
router.get("/backend/itemCategory/selectItemCategoryByParentId", (req, res) => {
    const id = req.query.id || 1;
    const sql = "select * from category where id=?"
    var arr = [id];
    sqlFn(sql, arr, result => {
        if (result.length > 0) {
            res.send({
                status: 200,
                result
            })
        } else {
            res.send({
                status: 500,
                msg: "暂无数据"
            })
        }
    })
})
module.exports = router;
