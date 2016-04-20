/**
 * Created by Artsi on 20/04/16.
 */

module.exports = function(sequelize, DataTypes) {
    return sequelize.define('class_rooms', {
        beacon_id: DataTypes.INTEGER,
        room_title: DataTypes.STRING,
        room_number: DataTypes.STRING
    }, {timestamps:false
    });
};
