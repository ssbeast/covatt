import React from 'react';
import "../css/CreateUser.css";
import CloseIcon from '@material-ui/icons/Close';

function CreateUser() {
    return (
        <div className="createUser">
            <CloseIcon className="createUser__closeIcon" />
           <div className="createUser__form">
           <div className="createUser__form__inputs">
               <input type="text" placeholder="Name"/>
               <input type="text" placeholder="date of birth"/>
           </div>
               <input type="text" placeholder="Adhaar number"/>
               <input type="text" placeholder="mobile number"/>
               <div className="createUser__form__options">
               <button type="button" className="createUser__form__button">Create new user</button>
               </div>
           </div>
        </div>
    )
}

export default CreateUser
