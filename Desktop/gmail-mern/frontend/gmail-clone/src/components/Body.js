import React from 'react'
import MailList from './MailList';
import Sidebar from './Sidebar';
import "./Body.css"

function Body() {
    return (
        <div className="body">
            <Sidebar/>
            <MailList/>
        </div>
    )
}

export default Body
