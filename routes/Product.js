var express = require('express');
var router = express.Router();
var config = {
    user: 'sa',
    password: 'shenevaknows1',
    server: 'DESKTOP-HJHK5E2',
    database: 'Test'
};

var sql = require("mssql");
/* GET users listing. */


router.get('/GetAllProduct', function (req, res, next) {
    sql.connect(config, function (err) {
        //------------------------------
        var request = new sql.Request();
        //------------------------------
        if (err) console.log(err);
        request.execute("[dbo].[GetAllProduct]", function (err, recordset, returnValue, affected) {
            if (err) console.log(err)
            res.send(recordset.recordset);
            sql.close();
        });
    });
});
router.post('/PostProduct', function (req, res, next) {
    sql.connect(config, function (err) {
        //------------------------------
        var request = new sql.Request();
        //------------------------------
        if (err) console.log(err);
        request.input('NameProduct', sql.VarChar(50), req.body.NameProduct);
        request.input('price', sql.VarChar(50), req.body.Price);
        request.input('status', sql.VarChar(50), req.body.Status);
        request.execute("[dbo].[PostProduct]", function (err, recordset, returnValue, affected) {
            if (err) console.log(err)
            res.send(recordset);
            sql.close();
        });
    });
});

router.put('/UpdateProduct/:id', function (req, res, next) {
    sql.connect(config, function (err) {
        //------------------------------
        var request = new sql.Request();
        //------------------------------
        if (err) console.log(err);
        request.input('ID', sql.NVarChar(50), req.params.id);
        request.input('NameProduct', sql.VarChar(50), req.body.NameProduct);
        request.input('price', sql.NVarChar(50), req.body.Price);
        request.input('status', sql.NVarChar(50), req.body.Status);
        request.execute("[dbo].[UpdateProduct]", function (err, recordset, returnValue, affected) {
            if (err) console.log(err)
            res.send(recordset);
            sql.close();
        });
    });
});
router.get('/GetProductById/:id', function (req, res, next) {
    sql.connect(config, function (err) {
        //------------------------------
        var request = new sql.Request();
        //------------------------------
        if (err) console.log(err);
        request.input('ID', sql.VarChar(50), req.params.id);
        request.execute("[dbo].[GetProductById]", function (err, recordset, returnValue, affected) {
            if (err) console.log(err)
            res.send(recordset);
            sql.close();
        });
    });
});

router.delete('/DeleteProduct/:id',function(req,res,next){
    sql.connect(config,function(err){
        //------------------------------
        var request = new sql.Request();
        //------------------------------
        if (err) console.log(err);
        request.input('ID', sql.VarChar(50), req.params.id);
        request.execute("[dbo].[DeleteProduct]", function (err, recordset, returnValue, affected) {
            if (err) console.log(err)
            res.send(recordset);
            sql.close();
        });
    });
});

module.exports = router;