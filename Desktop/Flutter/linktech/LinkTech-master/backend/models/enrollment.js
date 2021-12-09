const mongoose = require('mongoose')
const Schema = mongoose.Schema

const Enrollment = new Schema({
    "student_name":{
        type: String
    },
    "course_name":{
        type: String
    },
    "status":{
        type: Boolean,
        default: false
    }
})

module.exports=mongoose.model('Enrollment',Enrollment)