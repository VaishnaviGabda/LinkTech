const express = require('express')
const Enrollment = require('../models/enrollment')
const router = express.Router()
const Courses = require("../models/admin_course")
const Student = require("../models/student_req")

router.post('/add_new_student:id', (req,res,next)=>{
    students = Student(req.body)
    students.save()
    .then(async(result)=>{
        res.send(req.body)
        c_name = await Courses.findOne({_id:req.params.id})
        .then(result =>{
            course_name = (result.name);
            student_name = (req.body.name);

            enrollment = Enrollment({
                "course_name":course_name,
                "student_name":student_name
            })
            enrollment.save()
            .then(() =>{
                console.log("Saved..");
            })
        })
    })
    .catch(err => {
        console.log(err);
    })
})



module.exports = router