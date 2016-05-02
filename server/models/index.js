/**
 * Created by Artsi on 20/04/16.
 */
var Sequelize = require('sequelize');
var config = require('.././config');

// initialize database connection
var sequelize = new Sequelize('mysql://'+config.server.username+':'+config.server.password+'@'+config.server.addr+'/'+config.server.db+'');

// load models
var models = [
    'Info',
    'Lessons',
    'Students',
    'Courses',
    'Attendants'
];
models.forEach(function (model) {
    module.exports[model] = sequelize.import(__dirname + '/' + model);
});

// describe relationships
(function (m) {
    m.Lessons.belongsTo(m.Info, {foreignKey: 'class_id'});
    m.Info.hasMany(m.Lessons, {foreignKey: 'class_id'});

    m.Lessons.belongsToMany(m.Students, {through: 'attendants', timestamps: false, foreignKey: 'lessons_id'});
    m.Students.belongsToMany(m.Lessons, {through: 'attendants', timestamps: false, foreignKey: 'student_id'});

    m.Courses.belongsToMany(m.Students, {through: 'student_courses', timestamps: false, foreignKey: 'course_id'});
    m.Students.belongsToMany(m.Courses, {through: 'student_courses', timestamps: false, foreignKey: 'student_id'});

    m.Lessons.belongsTo(m.Courses, {foreignKey: 'course_id'});
    m.Courses.hasMany(m.Lessons, {foreignKey: 'course_id'});

    m.Students.belongsToMany(m.Lessons, {through: 'attendants', foreignKey: 'student_id'});
    m.Lessons.belongsToMany(m.Students, {through: 'attendants', foreignKey: 'lessons_id'});

    m.Attendants.hasMany(m.Lessons, {foreignKey: 'id'});
    m.Attendants.hasMany(m.Students, {foreignKey: 'id'});

})(module.exports);

// export connection
module.exports.sequelize = sequelize;
