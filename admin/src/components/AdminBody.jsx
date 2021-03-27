import React from 'react';
import "./css/AdminBody.css";
import AdminSideBar from "./AdminSideBar";
import AdminBodyContent from "./AdminBodyContent";

function AdminBody() {
    return (
        <div className="adminBody">
            <AdminSideBar />
            <AdminBodyContent />
        </div>
    )
}

export default AdminBody
