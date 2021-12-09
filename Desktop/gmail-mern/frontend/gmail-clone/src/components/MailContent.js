import React, { useEffect, useState } from 'react'
import "./MailContent.css"
import ArrowBackIcon from "@material-ui/icons/ArrowBack"
import InfoOutlinedIcon from "@material-ui/icons/InfoOutlined"
import DeleteOutlineIcon from "@material-ui/icons/DeleteOutline"
import MailOutlineIcon from "@material-ui/icons/MailOutline"
import ScheduleIcon from "@material-ui/icons/Schedule"
// import DriveFileMoveIcon from "@material-ui/icons/DriveFileMove"
import MoreVertIcon from "@material-ui/icons/MoreVert"
import { Avatar, IconButton } from '@material-ui/core'
import {useHistory} from 'react-router-dom'
import ArrowBackOutlinedIcon from "@material-ui/icons/ArrowBackOutlined"
import ArrowForwardOutlinedIcon from "@material-ui/icons/ArrowForwardOutlined"
import axios from 'axios'

function MailContent(props) {

    const history = useHistory()
    const [mails, setmail] = useState([])

    const back = () =>{
        history.push("/mails")
        window.location.reload()
    }

    useEffect(() => {
        const id = props.match.params.id
        // console.log(id);
        axios.get(`http://localhost:5000/getMail${id}`)
        .then(result =>{
            console.log(result.data)
            setmail(result.data)
        })

    }, [])
    return (
        <div className="mailContent">
            <div className="mail__header">
                <button onClick={back}><ArrowBackIcon/></button>
                <InfoOutlinedIcon/>
                <DeleteOutlineIcon/>
                <MailOutlineIcon/>
                <ScheduleIcon/>
                <MoreVertIcon/>
            </div>
            {/* {mails.map(mail => ( */}
            <div className="mail__info">
                <h3>{mails.subject}</h3>
                <div className="content_header">
                    <Avatar id="avatar"/>
                    <h4>{mails.to}</h4>
                    <h5>{mails.date}</h5>
                </div>
                <h4>{mails.message}</h4>
            </div>
            {/* ))} */}
            <div className="mail__content__btns">
                <p><ArrowBackOutlinedIcon/>Reply</p>
                <p><ArrowForwardOutlinedIcon/>Forward</p>
            </div>
            {/* {console.log(props.match.params)}
            {console.log(mails)} */}
            {console.log(mails)}
        </div>
    )
}

export default MailContent
