import React from "react";
import {Container,Row,Button,Table, Form} from "react-bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";
import ClearIcon from '@material-ui/icons/Clear';

function AdminBodyContent(){
   var btn={
     backgroundColor:"transparent",
     color : "black",
     border:"none",
     margin:"5px 10px",
   }
   var row={
     boxShadow:"2px 2px 2px 2px rgba(0,0,0,0.1)",
     margin:"4rem",
     padding:".5rem"
   }
   var tablee={
       marginLeft : "20%",
       border :"2px solid lightgrey",
       width:"100%",
       padding : "10px"
   }
    return(
        <div className="adminBodyContent">
        <Container>
        <Row>
         <Table style={tablee}>
              <thead>             
                  <tr>
                  <th>id</th>
                    <th>name</th>
                    <th>adhar card</th>
                    <th>status</th>
                    <th>date</th>
                    <th>delist</th>
                  </tr>                  
                </thead>
                   <tr style={row}>
                    <td>1</td>
                    <td>abc</td>
                    <td>19028469</td>
                    <td>Done</td>
                    <td>12-03-21</td>
                     <><Button style={btn}><ClearIcon/></Button></>
                    </tr>
              
          </Table>
        </Row>
      </Container>
        </div>
    )
}
export default AdminBodyContent;