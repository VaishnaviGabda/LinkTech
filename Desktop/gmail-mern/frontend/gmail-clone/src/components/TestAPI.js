import React, { useEffect, useState } from 'react'
import axios from 'axios'
import Data from './Data'

function TestAPI() {

    const [userData, setuserData] = useState([])

    useEffect(() => {
        axios.get("https://api.tvmaze.com/search/shows?q=all/")
        .then(res =>{
            setuserData((res.data))
        })
    }, [])

    return (
        <div>
            <h1>Hello</h1>
            {/* {console.log(userData[0]["show"]["name"])} */}
            {userData.map(data => {
                return <Data name={data["show"]["name"]}/>
            })}
        </div>
    )
}

export default TestAPI
