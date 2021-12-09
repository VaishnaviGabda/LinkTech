import React, { useEffect, useState } from 'react'
import axios from 'axios'
import DataContent from './DataContent'
import "./Data.css"

function Data() {

    const [userData, setuserData] = useState([])

    useEffect(() => {
        axios.get("https://api.tvmaze.com/search/shows?q=all/")
        .then(res =>{
            setuserData((res.data))
        })
    }, [])

    return (
        <div className="data">
            {console.log(userData)}
            {userData.map(data => {
                return <DataContent name={data["show"]["name"]} score={data["score"]} language={data["show"]["language"]} weight={data["show"]["weight"]} status ={data["show"]["status"]} id={data["show"]["id"]}/>
            })}
        </div>
    )
}

export default Data
