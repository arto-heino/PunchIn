/**
 * Created by Artsi on 13/04/16.
 */
var models = require('.././models');
var Lessons = models.Lessons;

exports.addAttend = function(req, res){
    var major = req.params.id;
    Main.findOne({ where: {beacon_id: major} }).then(function(classroom) {
        res.send(classroom);
    });
};
