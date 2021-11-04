const mongoose = require("mongoose")
const Courses = mongoose.Schema({
    "name":{
        type: String
    },
    "duration":{
        type: String
    },
    "fees":{
        type: String
    },
    "seats":{
        type: String
    },
    "requests":{
        type:Array
    }
})

module.exports = mongoose.model("Courses",Courses)