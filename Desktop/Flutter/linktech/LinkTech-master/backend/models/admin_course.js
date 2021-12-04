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
    
})

module.exports = mongoose.model("Courses",Courses)