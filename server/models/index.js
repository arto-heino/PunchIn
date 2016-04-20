/**
 * Created by Artsi on 20/04/16.
 */
var Sequelize = require('sequelize');

// initialize database connection
var sequelize = new Sequelize('mysql://punchin:siika112@82.196.15.60/punchin');

// load models
var models = [
    'main'
];
models.forEach(function(model) {
    module.exports[model] = sequelize.import(__dirname + '/' + model);
});

// describe relationships
/*(function(m) {
    m.PhoneNumber.belongsTo(m.User);
    m.Task.belongsTo(m.User);
    m.User.hasMany(m.Task);
    m.User.hasMany(m.PhoneNumber);
})(module.exports);*/

// export connection
module.exports.sequelize = sequelize;
