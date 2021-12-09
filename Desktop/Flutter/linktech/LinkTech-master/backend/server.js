const express = require('express') 
const connectdb = require('./db')
const app = express()
const adminroutes = require('./routes/admin_routes')
const loginroutes = require('./routes/login_routes')
const studentroutes = require('./routes/student_req_routes')
const cors = require('cors')
require("dotenv").config();


//let port = process.env.PORT || 5000
//let host = process.env.HOST
app.use(express.json())

app.use(cors());


 connectdb();

 app.use('/admin',adminroutes)
 app.use('/adminlogin',loginroutes)
 app.use('/student',studentroutes)


app.listen(process.env.PORT || 3000, function(){
   console.log("Express server listening on port %d in %s mode", this.address().port, app.settings.env);
 });

