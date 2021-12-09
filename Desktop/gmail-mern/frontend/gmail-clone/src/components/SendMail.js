import React,{useEffect, useState} from 'react'
import "./SendMail.css"
import ClearIcon from "@material-ui/icons/Close"
import axios from "axios"

function SendMail() {

    const [to, setto] = useState("")
    const [subject, setsubject] = useState("")
    const [msg, setmsg] = useState("")

    const state = {
        "to": to,
        "subject": subject,
        "message": msg,
        "date":  new Date().toLocaleDateString() + " "+new Date().toLocaleTimeString()
    }

    const sendData = (e) =>{
        axios.post("http://localhost:5000/insert", state)
    }

    return (
        <div className="sendMail">
            <div className="sendMail__header">
                <h4>New Message</h4>
                <form action="/mails">
                   <button id="btn"><ClearIcon className="clear__icon"/></button>
                </form>
            </div>
            <form className="sendMail__contents">
                <input placeholder="To " onChange={e => setto(e.target.value)}></input>
                <input placeholder="Subject " onChange={e => setsubject(e.target.value)}></input>
                <input id="msg" onChange={e => setmsg(e.target.value)}></input>
                <button type="submit" onClick={sendData}>Send</button>
            </form>
        </div>
    )
}

export default SendMail
