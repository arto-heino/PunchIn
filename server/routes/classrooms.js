/**
 * Created by Artsi on 13/04/16.
 */
var db = require('./../db');

exports.list = function (req, res) {

    db.query('SELECT * FROM class_rooms',function(err,rows){
        if(err) throw err;
        for (var i = 0; i < rows.length; i++) {
            res.setHeader('Content-Type', 'application/json');
            res.send(rows[i]);
        }
    });

};
