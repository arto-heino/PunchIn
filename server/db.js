/**
 * Created by Artsi on 13/04/16.
 */
var mysql = require("mysql");

// First you need to create a connection to the db
var con = mysql.createConnection({
    host: "82.196.15.60",
    user: "punchin",
    password: "siika112",
    database: "punchin"
});

con.connect(function(err){
    if(err){
        console.log('Error connecting to Db');
        console.log(err);
        return;
    }
    console.log('Connection established');
});

module.exports = con;
