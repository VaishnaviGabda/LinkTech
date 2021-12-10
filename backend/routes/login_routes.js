const express = require('express')
const User= require('../models/login_model')
const router = express.Router()



router.post('/signup',(req,res)=>{
    User.findOne({email:req.body.email},(err,user)=>{
        if(user==null){
                const user = User({
                    email : req.body.email,
                    password : req.body.password
                })
            
                user.save()
                .then(()=>{
                    res.send(user)
                })

            }else{
            res.json({
                message:'email is not available'
            })
        }
        
    })

    

})


router.post("/signin",(req,res) =>{
    console.log(`${req.body.email} ${req.body.password}`);
    User.findOne({email: req.body.email,password: req.body.password},(err,user) =>{
        if (err) {
            console.log(err);
        }
        else {
            if (user == null) {
                console.log("Invalid..");
            }
            else {
                console.log(`Logged in ${user}`);
                res.json(user)
            }
            
        }
    })
})


module.exports = router