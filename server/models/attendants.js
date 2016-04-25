/**
 * Created by Artsi on 22/04/16.
 */
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('attendants', {
            student_id: DataTypes.INTEGER,
            lessons_id: DataTypes.INTEGER,
        }, {timestamps:false}
    );
};
