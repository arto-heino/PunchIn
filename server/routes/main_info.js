/**
 * Created by Artsi on 13/04/16.
 */
var models = require('.././models');
var Info = models.Info;
var Lessons = models.Lessons;

// Get current room and lesson with beacon id and date

exports.getRoom = function (req, res) {
    var major = req.params.id;
    res.setHeader('Content-Type', 'application/json');

    Info.findOne({
        where: {beacon_id: major},
        include: [{model: Lessons, where: {start_time: {$lte: new Date()}, end_time: {$gte: new Date()}}}]
    }).then(function (info) {
        res.json(info);
    });
};
