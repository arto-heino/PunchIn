/**
 * Created by Artsi on 20/04/16.
 */
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('lessons', {
            class_id: DataTypes.INTEGER,
            start_time: DataTypes.DATE,
            end_time: DataTypes.DATE,
            lesson_title: DataTypes.STRING,
            teachers: DataTypes.STRING,
            course_id: DataTypes.INTEGER
        }, {timestamps:false}
    );
};
