const express = require('express') 
const connectdb = require('./db')
const app = express()
const adminroutes = require('./routes/admin_routes')


const port = 3000
app.use(express.json())

 connectdb();

 app.use('/admin',adminroutes)

 app.listen(port,()=>{


    console.log('Listen at 3000')
    
 });

