/**
 * Created by Artsi on 13/04/16.
 */
var models = require('.././models');
var Main = models.Main;
var Lessons = models.Lessons;

exports.getRoom = function (req, res) {
    var major = req.params.id;
    res.setHeader('Content-Type', 'application/json');

    Main.findOne({
        where: {beacon_id: major},
        include: [{model: Lessons, where: {start_time: {$lte: new Date()}, end_time: {$gte: new Date()}}}]
    }).then(function (classroom) {

        res.json(classroom);
    });
};
