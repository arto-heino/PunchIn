/**
 * Created by Artsi on 13/04/16.
 */
var models = require('.././models');

var Lessons = models.Lessons;
var Students = models.Students;
var Courses = models.Courses;
var Attendants = models.Attendants;

var student_id;
var course_id;
var lessons_id;
var s_name;
var student_number;

exports.addAttend = function (req, res) {
    course_id = req.body.course_id;
    lessons_id = req.body.lessons_id;
    s_name = req.body.s_name;
    student_number = req.body.student_number;

    Students.findOne({where: {s_name: s_name, student_number: student_number}}).then(
        function (student) {
            if (!student) {
                res.status(500).send('Wrong name or student number!');
            }
            student_id = student.id;

            Courses.findOne({
                where: {id: course_id},
                include: [{model: Students, where: {id: student_id}}]
            }).then(
                function (course) {
                    if (!course) {
                        res.status(500).send('Student is not on this course');
                    }
                    Attendants.create({student_id: student_id, lessons_id: lessons_id}).then(
                        function (attend) {
                            if (!attend) {
                                res.status(500).send('You are already at this lesson.');
                            }
                            res.status(200).send('New attendant added.');
                        }
                    );
                }
            );
        }, function (err) {
            res.status(500).send(err);
        }
    )
};
