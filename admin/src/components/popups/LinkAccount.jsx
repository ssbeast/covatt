import React from 'react';
import "../css/LinkAccount.css";
import CloseIcon from '@material-ui/icons/Close';

function LinkAccount() {
    return (
        <div className="linkAcc">
            <CloseIcon className="linkAcc__closeIcon" />
           <div className="linkAcc__form">
               <input type="text" placeholder="Link"/>
               <input type="text" placeholder="To"/>
               <button type="button" className="linkAcc__form__button">Link Account</button>
               </div>
           </div>
    )
}

export default LinkAccount
