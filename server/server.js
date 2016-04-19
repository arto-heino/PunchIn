/**
 * Created by Artsi on 13/04/16.
 */
require('./db');
var express = require('express');
var bodyParser = require('body-parser');
var app = express();
var class_room = require('./routes/classrooms');

module.exports = app;

app.use(bodyParser());

app.get('/class/:id', class_room.list);

app.listen(8081);

console.log("Listening 127.0.0.1:8801");
