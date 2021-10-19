import React from 'react'
import "./Sidebar.css"
import AddIcon from '@material-ui/icons/Add';
import InboxIcon from '@material-ui/icons/Inbox';
import StarBorderIcon from '@material-ui/icons/StarBorder';
import SnoozeIcon from '@material-ui/icons/Snooze';
import SendIcon from '@material-ui/icons/Send';
import InsertDriveFileIcon from '@material-ui/icons/InsertDriveFile';
import KeyboardArrowDownIcon from '@material-ui/icons/KeyboardArrowDown';
import { IconButton } from '@material-ui/core';
import SendMail from './SendMail';
import { Link ,BrowserRouter as Router } from 'react-router-dom';

function Sidebar() {

    return (
        <form action="/sendMail" className="sidebar">
               <button id="compose_btn" type="submit"> + COMPOSE</button>
            <div className="sidebar__menu">
                <div className={`sidebar__menu__content selectedOption`}>
                    <InboxIcon/>
                    <p>Inbox</p>
                    {/* <h4>88</h4> */}
                </div>
                <div className="sidebar__menu__content">
                    <StarBorderIcon/>
                    <p>Starred</p>
                    {/* <h4>88</h4> */}
                </div>
                <div className="sidebar__menu__content">
                    <SnoozeIcon/>
                    <p>Snoozed</p>
                    {/* <h4>88</h4> */}
                </div>
                <div className="sidebar__menu__content">
                    <SendIcon/>
                    <p>Sent</p>
                    {/* <h4>86</h4> */}
                </div>
                <div className="sidebar__menu__content">
                    <InsertDriveFileIcon/>
                    <p>Drafts</p>
                    {/* <h4>88</h4> */}
                </div>
                <div className="sidebar__menu__content">
                    <KeyboardArrowDownIcon/>
                    <p>More</p>
                </div>
            </div>
        </form>
    )
}

export default Sidebar
