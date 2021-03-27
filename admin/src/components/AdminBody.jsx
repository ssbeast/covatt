import React, { useState, useEffect } from "react";
import "./css/AdminBody.css";
import AdminSideBar from "./AdminSideBar";
import AdminBodyContent from "./AdminBodyContent";

function AdminBody() {
  const [tab, setTab] = useState("users");
  useEffect(() => {
    console.log(tab);
  }, [tab]);
  return (
    <div className="adminBody">
      <AdminSideBar tab={tab} setTab={setTab} />
      <AdminBodyContent tab={tab} setTab={setTab} />
    </div>
  );
}

export default AdminBody;
