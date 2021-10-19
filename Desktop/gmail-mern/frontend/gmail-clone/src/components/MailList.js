import React, { useEffect, useState } from 'react'
import Mail from './Mail'
import "./MailList.css"
import ArrowDropDownIcon from "@material-ui/icons/ArrowDropDown";
import RefreshIcon from '@material-ui/icons/Refresh';
import MoreVertIcon from '@material-ui/icons/MoreVert';
import { IconButton } from '@material-ui/core';
import CheckBoxOutlineBlankIcon from '@material-ui/icons/CheckBoxOutlineBlank';
import SendMail from './SendMail';
import {
    BrowserRouter as Router,
    Switch,
    Route,
    Link,
    BrowserRouter
  } from "react-router-dom";
import axios from "axios"
import MailContent from './MailContent';

function MailList() {

    const [mails, setmails] = useState([])

    useEffect(() => {
        axios.get("http://localhost:5000/get").
        then(result =>{
            setmails(result.data)
        })
    }, [])

    return (
        <Router>
        <div className="maillist">
            <Route path="/mails">
            <div className="mail_header">
                <CheckBoxOutlineBlankIcon/>
                <ArrowDropDownIcon/>
                <RefreshIcon/>
                <MoreVertIcon/>
            </div>
            {mails.map(mail => {
                return <Mail to={mail.to} id={mail._id} subject={mail.subject} message={mail.message} date={mail.date}/>
            })}
            </Route>

            <BrowserRouter>
               <Route path='/mail_content/:id' render={(props) => <MailContent {...props} />} />
            </BrowserRouter>
            {/* <Route path="/mail_content:id">
                <MailContent id={}/>
            </Route> */}
            
            <Route path="/sendMail">
               <SendMail/>
            </Route>
        </div>
        </Router>
    )
}

export default MailList
