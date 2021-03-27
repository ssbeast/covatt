import React, { useEffect, useState } from "react";
import axios from "axios";
import { Container, Row, Button, Table, Form, Toast } from "react-bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";
import { red } from "@material-ui/core/colors";
function AdminBodyContent(props) {
  const btn_pointer = {
    cursor: "pointer",
  };
  const btn = {
    backgroundColor: "#00BFA5",
    border: "none",
    margin: "5px 10px",
    cursor: "pointer",
  };
  const btn_red = {
    backgroundColor: "red",
    border: "none",
    fontWeight: "600",
    margin: "5px 10px",
    cursor: "pointer",
  };
  const row = {
    boxShadow: "2px 2px 2px 2px rgba(0,0,0,0.1)",
    margin: "4rem",
    padding: ".5rem",
  };
  const tablee = {
    marginLeft: "20%",
    border: "2px solid lightgrey",
    width: "100%",
    padding: "10px",
  };
  const [userRecords, setUserRecord] = useState([]);
  const [vaccineRecords, setVaccineRecords] = useState([]);

  const fetchUserRecords = async () => {
    axios({
      method: "get",
      url: "http://localhost:3000/covatt-api/v1/user",
      headers: {
        "x-admin-key": "8788e696-a72b-4fe4-a311-953e10c34244@admin",
      },
    })
      .then((res) => {
        console.log("trigered resoponse");
        setUserRecord(res.data.data);
      })
      .catch((err) => console.error(err));
  };
  const fetchVacineRecords = async () => {
    axios({
      method: "get",
      url: "http://localhost:3000/covatt-api/v1/vaccine",
      headers: {
        "x-admin-key": "8788e696-a72b-4fe4-a311-953e10c34244@admin",
      },
    })
      .then((res) => {
        console.log("trigered resoponse");
        setVaccineRecords(res.data.data);
      })
      .catch((err) => console.error(err));
  };

  const deleteUser = async (id) => {
    axios({
      method: "DELETE",
      url: `http://localhost:3000/covatt-api/v1/user/${id}`,
      headers: {
        "x-admin-key": "8788e696-a72b-4fe4-a311-953e10c34244@admin",
      },
    })
      .then((res) => {
        console.log(res.data);
      })
      .catch((err) => console.error(err));
    console.log(id);
  };

  const deleteVaccine = async (id) => {
    axios({
      method: "DELETE",
      url: `http://localhost:3000/covatt-api/v1/vaccine/${id}`,
      headers: {
        "x-admin-key": "8788e696-a72b-4fe4-a311-953e10c34244@admin",
      },
    })
      .then((res) => {
        console.log(res.data);
      })
      .catch((err) => console.error(err));
    console.log(id);
  };

  const fetchUserById = (id) => {
    axios({
      method: "get",
      url: `http://localhost:3000/covatt-api/v1/user/${id}`,
      headers: {
        "x-admin-key": "8788e696-a72b-4fe4-a311-953e10c34244@admin",
      },
    })
      .then((res) => {
        console.log(res.data);
      })
      .catch((err) => console.error(err));
    console.log(id);
  };

  useEffect(() => {
    fetchUserRecords();
    fetchVacineRecords();
  }, []);
  return (
    <div className="adminBodyContent">
      <Container>
        <Row>
          <Table style={tablee}>
            {props.tab === "users" ? (
              <thead>
                <tr>
                  <th>index</th>
                  <th>name</th>
                  <th>adhar number</th>
                  <th>Phone No.</th>
                  <th>registered at</th>
                  <th></th>
                </tr>
              </thead>
            ) : (
              <thead>
                <tr>
                  <th>index</th>
                  <th>consumer</th>
                  <th>Phone No.</th>
                  <th>brand</th>
                  <th>vaccinator</th>
                  <th>location</th>
                  <th>vaccinated at</th>
                  <th></th>
                </tr>
              </thead>
            )}
            {props.tab === "users"
              ? userRecords.map((record, i) => (
                  <tr style={row} id={record["_id"]}>
                    <td>{i + 1}</td>
                    <td
                      style={btn_pointer}
                      onClick={() => fetchUserById(record["_id"])}
                    >
                      {record.name}
                    </td>
                    <td>{record["_id"]}</td>
                    <td>{record.contactNumber}</td>
                    <td>{record.createdAt}</td>
                    <>
                      <Button
                        style={btn_red}
                        onClick={() => deleteUser(record["_id"])}
                      >
                        X
                      </Button>
                    </>
                  </tr>
                ))
              : vaccineRecords.map((record, i) => (
                  <tr style={row}>
                    <td>{i + 1}</td>
                    <td
                      style={btn_pointer}
                      onClick={() => fetchUserById(record["consumer"]["_id"])}
                    >
                      {record["consumer"]["name"]}
                    </td>
                    <td>{record["consumer"]["contactNumber"]}</td>
                    <td>{record["brand"]}</td>
                    <td
                      style={btn_pointer}
                      onClick={() => fetchUserById(record["vaccinator"]["_id"])}
                    >
                      {record["vaccinator"]["name"]}
                    </td>
                    <td>{record["location"]}</td>
                    <td>{record["createdAt"]}</td>
                    <>
                      <Button
                        style={btn_red}
                        onClick={() => deleteVaccine(record["_id"])}
                      >
                        X
                      </Button>
                    </>
                  </tr>
                ))}
          </Table>
        </Row>
      </Container>
    </div>
  );
}
export default AdminBodyContent;
