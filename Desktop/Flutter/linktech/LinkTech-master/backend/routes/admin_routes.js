const express = require('express')
const router = express.Router()
const Courses = require("../models/admin_course")
const Enrollment = require('../models/enrollment')

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

router.post('/delete_course',(req,res,next)=>{
    Courses.findOneAndDelete({"name":req.body.name})
    .then(() =>{
        res.send({msg:"deleted"})
    })
})


router.get('/get_courses',(req,res,next)=>{

    Courses.find()
    .then((result)=>{
        console.log(result)
        
        res.send(result)
    })
})

router.put("/update_status:id",(req,res,next) =>{
    Enrollment.findOneAndUpdate({"_id":req.params.id},{$set:{"status":true}}).
    then(() =>{
        console.log("updated status trueeeeeeeeeeeeeeeeeee");
        res.send("Updated...")
    })
})

// router.get('/get_Java',(req,res,next)=>{
//     Courses.findOne({'name':'Java'})
//     .then((result)=>{
//         res.send(result)
//     })
// })
// router.get('/get_CPP',(req,res,next)=>{
//     Courses.One({'name':'CPP'})
//     .then((result)=>{

//         res.send(result)
//     })
// })
// router.get('/get_C',(req,res,next)=>{
//     Courses.findOne({'name':'C'})
//     .then((result)=>{
//         res.send(result)
//     })
// })


module.exports = router