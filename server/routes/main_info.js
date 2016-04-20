/**
 * Created by Artsi on 13/04/16.
 */
var models = require('.././models');
var Main = models.Main;
var Lessons = models.Lessons;

exports.getRoom = function(req, res){
    var major = req.params.id;

    Main.findOne({ where: {beacon_id: major}, include: [Lessons] }).then(function(classroom) {
        res.send(classroom);
    });
};
