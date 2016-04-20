/**
 * Created by Artsi on 20/04/16.
 */
var Sequelize = require('sequelize');

// initialize database connection
var sequelize = new Sequelize('mysql://punchin:siika112@82.196.15.60/punchin');

// load models
var models = [
    'Main',
    'Lessons',
    'Students'
];
models.forEach(function(model) {
    module.exports[model] = sequelize.import(__dirname + '/' + model);
});

// describe relationships
(function(m) {
    m.Lessons.belongsTo(m.Main, {foreignKey: 'class_id'});
    m.Main.hasMany(m.Lessons, {foreignKey: 'class_id'});
    m.Lessons.belongsToMany(m.Students, {through: 'attendants', foreignKey: 'lessons_id'});
    m.Students.belongsToMany(m.Lessons, {through: 'attendants', foreignKey: 'student_id'});

})(module.exports);

// export connection
module.exports.sequelize = sequelize;
