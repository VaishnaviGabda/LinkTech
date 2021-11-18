const mongoose = require("mongoose")
const StudentData = mongoose.Schema({
    "name":{
        type: String
    },
    "college":{
        type:String
    },
    "year":{
        type:String
    },
    "email":{
        type:String
    }
    // "courseid":{
    //     type: String
    // }

   
})

module.exports = mongoose.model("Student",StudentData)