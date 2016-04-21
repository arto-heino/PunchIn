/**
 * Created by Artsi on 13/04/16.
 */
var express = require('express');
var bodyParser = require('body-parser');
var app = express();
var info = require('./routes/main_info');
var attend = require('./routes/attending');

module.exports = app;

app.use(bodyParser());

app.get('/info/:id', info.getRoom);
app.post('/attend/', attend.addAttend);

app.listen(8081);

console.log("Listening 127.0.0.1:8801");
