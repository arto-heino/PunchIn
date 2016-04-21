/**
 * Created by Artsi on 13/04/16.
 */
var models = require('.././models');
var Lessons = models.Lessons;
var Students = models.Students;
var Courses = models.Courses;
var student_id;

exports.addAttend = function (req, res) {
    var course_id = req.body.course_id;
    var lesson_id = req.body.lesson_id;
    var s_name = req.body.s_name;
    var student_number = req.body.student_number;

    Students.findOne({where: {s_name: s_name, student_number: student_number}}).then(
        function (user) {
            if (!user) {
                res.status(500).send('Wrong name or student number!');
            }
            student_id = user.id;

            Courses.findOne({
                where: {id: course_id},
                include: [{model: Students, where: {id: student_id}}]
            }).then(
                function (course) {
                    if (!user) {
                        res.status(500).send('Student is not on this course');
                    }
                    Lessons.attendant.findOrCreate({where: {student_id: student_id, lessons_id: lesson_id}}).then(
                      function (res){
                          res.send("New attendant added.");
                      }
                    );
                }
            );
        }, function (err) {
            res.status(500).send(err);
        }
    )
};
