const express = require('express')
const User= require('../models/login_model')
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const router = express.Router()
const mongoose = require("mongoose")
require("dotenv").config();


// router.post('/signup',(req,res)=>{
//     User.findOne({email:req.body.email},(err,user)=>{
//         if(user==null){
//                 const user = User({
//                     email : req.body.email,
//                     password : req.body.password
//                 })
            
//                 user.save()
//                 .then(()=>{
//                     res.send(user)
//                 })

//             }else{
//             res.json({
//                 message:'email is not available'
//             })
//         }
        
//     })

    

// })


// router.post("/signin",(req,res) =>{
//     console.log(`${req.body.email} ${req.body.password}`);
//     User.findOne({email: req.body.email,password: req.body.password},(err,user) =>{
//         if (err) {
//             console.log(err);
//         }
//         else {
//             if (user == null) {
//                 console.log("Invalid..");
//             }
//             else {
//                 console.log(`Logged in ${user}`);
//                 res.json(user)
//             }
            
//         }
//     })
// })


router.post("/signup", (req, res, next) => {
  User.find({ email: req.body.email })
    .exec()
    .then(user => {
      if (user.length >= 1) {
        return res.status(409).json({
          message: "Mail exists"
        });
      } else {
        bcrypt.hash(req.body.password, 10, (err, hash) => {
          if (err) {
            return res.status(500).json({
              error: err
            });
          } else {
            const user = new User({
              _id: new mongoose.Types.ObjectId(),
              email: req.body.email,
              password: hash
            });
            user
              .save()
              .then(result => {
                console.log(result);
                res.status(201).json({
                  message: "User created"
                });
              })
              .catch(err => {
                console.log(err);
                res.status(500).json({
                  error: err
                });
              });
          }
        });
      }
    });
});

router.post("/login", (req, res, next) => {
  User.find({ email: req.body.email })
    .exec()
    .then(user => {
      if (user.length < 1) {
        return res.status(401).json({
          message: "Auth failed"
        });
      }
      bcrypt.compare(req.body.password, user[0].password, (err, result) => {
        if (err) {
          return res.status(401).json({
            message: "Auth failed"
          });
        }
        if (result) {
          const token = jwt.sign(
            {
              email: user[0].email,
              userId: user[0]._id
            },
            process.env.JWT_KEY,
            {
                expiresIn: "1h"
            }
          );
          return res.status(200).json({
            message: "Auth successful",
            token: token
          });
        }
        res.status(401).json({
          message: "Auth failed"
        });
      });
    })
    .catch(err => {
      console.log(err);
      res.status(500).json({
        error: err
      });
    });
});


module.exports = router
