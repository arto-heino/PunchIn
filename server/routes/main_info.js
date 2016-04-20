/**
 * Created by Artsi on 13/04/16.
 */
var models = require('.././models');
var Main = models.main;

exports.getRoom = function(req, res){
    var major = req.params.id;
    Main.findOne({ where: {beacon_id: major} }).then(function(classroom) {
        res.send(classroom);
    });
};
