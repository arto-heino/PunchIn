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

// load routes

app.get('/info/:id', info.getRoom);
app.get('/attends/:id', attend.getAttendants);
app.post('/attend/', attend.addAttend);

app.listen(8081);

console.log("Listening http://82.196.15.60:8081 and database connection is up.");
