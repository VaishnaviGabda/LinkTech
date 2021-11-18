const express = require('express') 
const connectdb = require('./db')
const app = express()
const adminroutes = require('./routes/admin_routes')
const loginroutes = require('./routes/login_routes')
const studentroutes = require('./routes/student_req_routes')
const cors = require('cors')


const port = 3000
app.use(express.json())

app.use(cors());


 connectdb();

 app.use('/admin',adminroutes)
 app.use('/',loginroutes)
 app.use('/student',studentroutes)

 app.listen(port,()=>{


    console.log('Listen at 3000')
    
 });

