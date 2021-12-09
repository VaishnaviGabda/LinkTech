const mongoose = require("mongoose")
const StudentData = mongoose.Schema({
    "name":{
        type: String
    },
    "college":{
        type:String
    },
    "email":{
        type:String
    },
    
    "degree":{
        type:String

    }
    
   
})

module.exports = mongoose.model("Student",StudentData)