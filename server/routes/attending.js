/**
 * Created by Artsi on 13/04/16.
 */
var db = require('./../db');

exports.add = function (req, res) {
    var a_name = req.body.a_name;
    var a_id = req.body.p_id;
    var p_desc = req.body.p_desc;

    p1.save(function (err) {
        if (err) return console.error(err);
    });
    res.send("Added.");
};
