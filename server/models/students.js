/**
 * Created by Artsi on 20/04/16.
 */
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('students', {
            f_name: DataTypes.STRING,
            s_name: DataTypes.STRING,
            student_number: DataTypes.INTEGER
        }, {timestamps:false}
    );
};
