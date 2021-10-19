import React from 'react'
import MenuIcon from "@material-ui/icons/Menu"
import SearchIcon from "@material-ui/icons/Search"
import TuneIcon from '@material-ui/icons/Tune';
import SettingsIcon from '@material-ui/icons/Settings';
import HelpOutlineIcon from '@material-ui/icons/HelpOutline';
import AppsIcon from '@material-ui/icons/Apps';
import logo from "../icon.jpg"
import "./Header.css"
import { Avatar, IconButton } from '@material-ui/core';

function Header() {
    return (
        <div className="header">
            <div className="header__left">
                <IconButton><MenuIcon id="menuIcon"/></IconButton>
                <img src={logo}></img>
            </div>

            <div className="header__search">
                <IconButton><SearchIcon/></IconButton>
                <input placeholder="Search all conversations"></input>
                <IconButton><TuneIcon/></IconButton>
            </div>

            <div className="header__right">
                <IconButton><HelpOutlineIcon/></IconButton>
                <IconButton><SettingsIcon/></IconButton>
                <IconButton><AppsIcon/></IconButton>
                <IconButton><Avatar id="avatar"/></IconButton>
            </div>
        </div>
    )
}

export default Header
