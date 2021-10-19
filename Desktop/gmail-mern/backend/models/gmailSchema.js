const mongoose = require("mongoose")

const GmailSchema = mongoose.Schema({
    "to":{
        type: String
    },
    "subject":{
        type: String
    },
    "message":{
        type: String
    },
    "date":{
        type: String
    }
})

module.exports = mongoose.model("gmail",GmailSchema)