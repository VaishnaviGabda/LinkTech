import React from 'react'
import { useHistory } from 'react-router'
import "./DataContent.css"

function DataContent(props) {

    const history = useHistory()

    const showSummary = ()=>{
        history.push(`/summary${props.score}`)
    }

    return (
        <div className="dataContent">
            <h3>Name - {props.name}</h3>
            <h3>Score - {props.score}</h3>
            <h3>Language - {props.language}</h3>
            <h3>Weight - {props.weight}</h3>
            <h3>Status - {props.status}</h3>
            <button onClick={showSummary}>Show Summary</button>
        </div>
    )
}

export default DataContent
