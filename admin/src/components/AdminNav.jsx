import React, { useState } from 'react';
import "./css/AdminNav.css";
import Avatar from '@material-ui/core/Avatar';


function AdminNav() {
    const [profile, OpenProfile] = useState(false);
    const popUpDisplay = () => {
        OpenProfile(!profile)
    }
    return (
        <div className="adminNav">
            <div className="adminNav__user">
            <h2>Covatt</h2>
                <a onClick={popUpDisplay}><Avatar className="adminNav__user__avatar" /></a>
            </div>
            <div className="adminNav__user__dropdown" style={{ display: profile ? "block" : "none" }}>
            <div className="adminUserDropdown">
                <ul>
                    <li><a>Logout</a></li>
                </ul>
            </div>
            </div>
        </div>
    )
}

export default AdminNav;
