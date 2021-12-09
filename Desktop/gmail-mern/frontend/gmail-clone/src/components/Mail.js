import CheckBoxOutlineBlankIcon from '@material-ui/icons/CheckBoxOutlineBlank';
import StarBorderIcon from '@material-ui/icons/StarBorder';
import React from 'react'
import "./Mail.css"
import DeleteIcon from "@material-ui/icons/Delete"
import axios from 'axios';
import {useHistory} from "react-router-dom"

function Mail(props) {

    const history = useHistory()

    const deleteMail = (id) =>{
        axios.delete(`http://localhost:5000/delete${id}`)
        document.location.reload()
    }

    const gotoMail = (id) =>{
        history.push(`/mail_content/${id}`)
        window.location.reload()
    }

    return (
        <div className="mail">
            <CheckBoxOutlineBlankIcon/>
            <StarBorderIcon/>
            <div className="mail__content">
                <h5 onClick={()=>gotoMail(props.id)}>{props.to}</h5>
                <p onClick={()=>gotoMail(props.id)}>{props.subject}</p>
                <p onClick={()=>gotoMail(props.id)}>{props.message}</p>
                <h5 onClick={()=>gotoMail(props.id)}>{props.date}</h5>
                <DeleteIcon onClick={() => deleteMail(props.id)} id="deleteIcon"/>
            </div> 
        </div>
    )
}

export default Mail
