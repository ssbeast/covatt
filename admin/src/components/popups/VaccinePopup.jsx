import React,{useState} from 'react';
import "../css/VaccinePopup.css";
import CloseIcon from '@material-ui/icons/Close';
import Select from '@material-ui/core/Select';
import InputLabel from '@material-ui/core/InputLabel';
import MenuItem from '@material-ui/core/MenuItem';
import FormHelperText from '@material-ui/core/FormHelperText';
import FormControl from '@material-ui/core/FormControl';

function VaccinePopup() {
    const [tag, setTag] = React.useState('');

    const handleChange = (event) => {
    setTag(event.target.value);
    };
    return (
        <div className="vaccine">
            <div className="vaccine__heading"> 
            <CloseIcon className="vaccine__closeIcon" />
            </div>
           <div className="vaccine__form">
               <input type="text" placeholder="vaccinator ID"/>
               <input type="text" placeholder="customer ID"/>
               <div className="vaccine__form__options">
               <FormControl variant="outlined">
                <InputLabel id="demo-simple-select-outlined-label">Tags</InputLabel>
                <Select value={tag} className="vacDropdown" onChange={handleChange}>      
                    <MenuItem value={1}>vaccine1</MenuItem>
                    <MenuItem value={2}>vaccine1</MenuItem>
                    <MenuItem value={3}>vaccine1</MenuItem>
                    <MenuItem value={4}>vaccine1</MenuItem>
                    <MenuItem value={5}>vaccine1</MenuItem>
                    <MenuItem value={6}>vaccine1</MenuItem>
                </Select>
                </FormControl>
               
               <button type="button" className="vaccine__form__button">Next</button>
               </div>
           </div>
        </div>
    )
}

export default VaccinePopup
