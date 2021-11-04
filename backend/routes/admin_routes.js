const express = require('express')
const router = express.Router()
const Courses = require("../models/admin_course")

router.post('/add_new_course',(req,res,next)=>{
    course = Courses(req.body)
    course.save()
    .then(()=>{
        res.send(req.body)
        console.log("data saved.");
    })
    .catch(err => {
        console.log(err);
    })
})


router.get('/get_courses',(req,res,next)=>{
    Courses.find()
    .then((result)=>{
        res.send(result)
    })
})
router.get('/get_Java',(req,res,next)=>{
    Courses.findOne({'name':'Java'})
    .then((result)=>{
        res.send(result)
    })
})
router.get('/get_CPP',(req,res,next)=>{
    Courses.findOne({'name':'CPP'})
    .then((result)=>{
        res.send(result)
    })
})
router.get('/get_C',(req,res,next)=>{
    Courses.findOne({'name':'C'})
    .then((result)=>{
        res.send(result)
    })
})


module.exports = router