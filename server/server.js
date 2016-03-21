var express = require('express');
var app = express();

app.get('/', function (req, res) {
    res.send("Working as intended.");
});

app.listen(8081);

console.log("Listening 127.0.0.1:8801");