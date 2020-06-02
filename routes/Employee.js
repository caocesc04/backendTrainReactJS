var express = require('express');
var router = express.Router();
var config = {
    user: 'sa',
    password: 'shenevaknows1',
    server: 'DESKTOP-HJHK5E2',
    database: 'Test'
};

var sql = require("mssql");


router.post('/EmployeeLogin', function (req, res, next) {
    sql.connect(config, function (err) {
        //------------------------------
        var request = new sql.Request();
        //------------------------------
        if (err) console.log(err);
        request.input('Employee_id', sql.VarChar(50), req.body.EmployeeId);
        request.input('Password', sql.VarChar(50), req.body.Password);
        request.execute("[dbo].[Login_Employee]", function (err, recordset, returnValue, affected) {
            if (err) console.log(err)
            res.send(recordset.recordset);
            sql.close();
        });
    });
});

router.post('/EmployeeCreate', function (req, res, next) {
    sql.connect(config, function (err) {
        //------------------------------
        var request = new sql.Request();
        //------------------------------
        if (err) console.log(err);
        request.input('EMPLOYEE_ID', sql.VarChar(50), req.body.EmployeeId);
        request.input('EMPLOYEE_NAME', sql.NVarChar(50), req.body.EmployeeName);
        request.input('DEPARTMENT', sql.VarChar(100), req.body.Department);
        request.input('PERMISSION', sql.VarChar(50), req.body.Permission);
        request.execute("[dbo].[CreateEmployee]", function (err, recordset, returnValue, affected) {
            if (err) console.log(err)
            res.send(recordset.recordset);
            sql.close();
        });
    });
});

router.get('/GetAllEmployee', function (req, res, next) {
    console.log('a')
    sql.connect(config, function (err) {
        //------------------------------
        var request = new sql.Request();
        //------------------------------

        if (err) console.log(err);
        request.execute("[dbo].[GetAllEmployee]", function (err, recordset, returnValue, affected) {
            if (err) console.log(err)
            res.send(recordset.recordset);
            sql.close();
        });
    });
});
router.get('/GetEmployeeById/:id', function (req, res, next) {
    sql.connect(config, function (err) {
        //------------------------------
        var request = new sql.Request();
        //------------------------------
        if (err) console.log(err);
        request.input('ID', sql.BigInt, req.params.id);
        request.execute("[dbo].[GetEmployeeById]", function (err, recordset, returnValue, affected) {
            if (err) console.log(err)
            res.send(recordset.recordset);
            sql.close();
        });
    });
});
router.delete('/DeleteEmployee/:id', function (req, res, next) {
    sql.connect(config, function (err) {
        //------------------------------
        var request = new sql.Request();
        //------------------------------
        if (err) console.log(err);
        request.input('ID', sql.BigInt, req.params.id);
        request.execute("[dbo].[DeleteEmployee]", function (err, recordset, returnValue, affected) {
            if (err) console.log(err)
            res.send(recordset.recordset);
            sql.close();
        });
    });
});
router.put('/UpdateEmployee/:id', function (req, res, next) {
    sql.connect(config, function (err) {
        //------------------------------
        var request = new sql.Request();
        //------------------------------
        if (err) console.log(err);
        request.input('ID', sql.BigInt, req.params.id);
        request.input('EMPLOYEEID', sql.VarChar(50), req.body.EmployeeId);
        request.input('EMPLOYEENAME', sql.NVarChar(100), req.body.EmployeeName);
        request.input('DEPARTMENT', sql.VarChar(50), req.body.Department);
        request.input('PERMISSION', sql.VarChar(50), req.body.Permission);
        request.execute("[dbo].[UpdateEmployee]", function (err, recordset, returnValue, affected) {
            if (err) console.log(err)
            console.log(recordset)
            // res.send(recordset.recordset);
            sql.close();
        });
    })

})
module.exports = router;