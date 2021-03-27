import React from 'react';
import "./css/AdminSideBar.css";
import Button from '@material-ui/core/Button';
import ChatIcon from '@material-ui/icons/Chat';
import StarIcon from '@material-ui/icons/Star';
import FiberManualRecordIcon from '@material-ui/icons/FiberManualRecord';

function AdminSideBar() {
    return (
        <div className="adminSideBar">
            <div className="adminSideBar__content">
                <Button className="adminSideBar__button" variant="contained">Users</Button>
                <ul className="adminSideBar__content__upperList">
                <li className="adminListItem"><a href="$#">create new user</a></li>
                  <li className="adminListItem"><a href="$#">get all users</a></li>
                  <li className="adminListItem"><a href="$#">delete user</a></li>
                  <li className="adminListItem"><a href="$#">link account</a></li>
                </ul>
                <Button className="adminSideBar__button" variant="contained">vaccines</Button>
                <ul className="adminSideBar__content__upperList">
                  <li className="adminListItem"><a href="$#">create vaccine record</a></li>
                  <li className="adminListItem"><a href="$#">get all records</a></li>
                  <li className="adminListItem"><a href="$#">delete records</a></li>
                </ul>
            </div>
            
        </div>
    )
}

export default AdminSideBar
