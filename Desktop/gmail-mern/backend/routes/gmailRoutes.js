const { response } = require("express")
const express = require("express")
const router = express.Router()
const Gmail = require("../models/gmailSchema")

router.post("/insert", (req,res) =>{
    console.log(req.body);
    gmail = Gmail(req.body)
    gmail.save(() =>{
        console.log("Saved..");
    })
})

router.get("/get", (req,res) =>{
    Gmail.find().exec()
    .then(result =>{
        res.send(result)
    })
})

router.get("/getMail:id", (req,res) =>{
    Gmail.findOne({_id:req.params.id})
    .then(result =>{
        res.send(result)
    })
})

router.delete("/delete:id", (req,res) =>{
    Gmail.remove({_id:req.params.id})
    .then(() =>{
        res.send("deleted..")
    })
})

module.exports = router