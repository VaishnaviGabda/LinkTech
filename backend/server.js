const express = require('express') 
const connectdb = require('./db')
const app = express()
const adminroutes = require('./routes/admin_routes')
const loginroutes = require('./routes/login_routes')
const studentroutes = require('./routes/student_req_routes')


const port = 3000
app.use(express.json())

app.use((_req,res,next)=>{
   res.header('Access-Control-Allow-Origin','*');
   res.header('Access-Control-Allow-Headers','*');
})



 connectdb();

 app.use('/admin',adminroutes)
 app.use('/',loginroutes)
 app.use('/student',studentroutes)

 app.listen(port,()=>{


    console.log('Listen at 3000')
    
 });

