import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { useHistory, useParams } from 'react-router'
import "./Summary.css"

function Summary() {

    const history = useHistory()

    const goBack = () =>{
        history.push("/")
    }

    const {score} = useParams()
    const [userData, setuserData] = useState([])
    const [summary, setsummary] = useState("")

    useEffect(() => {
        axios.get("https://api.tvmaze.com/search/shows?q=all/")
        .then(res =>{
            setuserData(res.data)
        })
    }, [])

    useEffect(() => {

        userData.map(data => {
            if (data["score"] == score) {
                setsummary(data["show"]["summary"])
                console.log(summary);   
            }
        })

    }, [userData])

    return (
        <div className="summary">
        <div className="summary__content">
            <h2>SUMMARY</h2>
            <h3>{summary}</h3>
            <button onClick={goBack}>Go Back</button>
        </div>
        </div>
    )
}

export default Summary
