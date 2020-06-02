var express = require('express');
var router = express.Router();
var sql = require("mssql");

var config = {
  user: 'sa',
  password: 'caonv13457a$',
  server: 'DESKTOP-2PRSK8E\\NAP_CAONV',
  database: 'Person',
  port: 1433
};

router.get('/a', function (req, res, next) {
  sql.connect(config, function (err) {
    console.log(config)
    if (err) console.log(err);
    else console.log('a')
    //------------------------------
    var request = new sql.Request();
    //------------------------------
    // request.input('Employee_id', sql.VarChar(50), req.body.EmployeeId);
    // request.input('Password', sql.VarChar(50), req.body.Password);
    // request.execute("[dbo].[Login_Employee]", function (err, recordset, returnValue, affected) {
    //     if (err) console.log(err)
    //     res.send(recordset.recordset);
    // sql.close();
    // });
    request.query('select * from Person_Details', function (err, recordset) {

      if (err) console.log(err)

      // send records as a response
      res.send(recordset);
      sql.close();
    });
  });
});

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;
