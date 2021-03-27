import React, { useState } from "react";
import "./css/AdminSideBar.css";
import Button from "@material-ui/core/Button";

function AdminSideBar(props) {
  const [list, showList] = useState(false);
  const displayList = () => {
    showList(!list);
    props.setTab("users");
  };
  const [list2, showList2] = useState(false);
  const displayList2 = () => {
    showList2(!list2);
    props.setTab("vaccines");
  };
  return (
    <div className="adminSideBar">
      <div className="adminSideBar__content">
        <Button
          className="adminSideBar__button"
          variant="contained"
          onClick={displayList}
        >
          Users
        </Button>
        <ul
          className="adminSideBar__content__upperList"
          style={{ display: list ? "block" : "none" }}
        >
          <li className="adminListItem">
            <a href="$#">create new user</a>
          </li>
          <li className="adminListItem">
            <a href="$#">delete user</a>
          </li>
          <li className="adminListItem">
            <a href="$#">link account</a>
          </li>
        </ul>
        <br />
        &nbsp;
        <Button
          className="adminSideBar__button2"
          variant="contained"
          onClick={displayList2}
        >
          vaccines
        </Button>
        <ul
          className="adminSideBar__content__upperList"
          style={{ display: list2 ? "block" : "none" }}
        >
          <li className="adminListItem">
            <a href="$#">create vaccine record</a>
          </li>
          <li className="adminListItem">
            <a href="$#">delete records</a>
          </li>
        </ul>
      </div>
    </div>
  );
}

export default AdminSideBar;
