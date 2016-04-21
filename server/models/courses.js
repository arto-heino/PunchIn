/**
 * Created by Artsi on 21/04/16.
 */
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('courses', {
            title: DataTypes.STRING,
            start_time: DataTypes.DATE,
            end_time: DataTypes.DATE,
            materials: DataTypes.STRING
        }, {timestamps:false}
    );
};
