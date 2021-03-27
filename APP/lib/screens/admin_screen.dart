import 'dart:convert';

import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:covatt/common/custom_button.dart';
import 'package:covatt/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdminScreen extends StatefulWidget {
  final UserData user;
  AdminScreen(this.user);
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String dropdownValue = 'Covaxin';
  String locationvalue = '';
  String consumerid = '';

  TextEditingController txt = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Admin Dashboard",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  "Select Vaccine",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Color(0xFF1DE9B6)),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[
                    "Covaxin",
                    "ZyCoV-D",
                    "Oxford - AstraZeneca",
                    "Biological E",
                    "Mynvax",
                    "Gennova",
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        locationvalue = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black)),
                      hintText: 'Enter Your City Name',
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: TextField(
                    controller: txt,
                    style: TextStyle(color: Colors.black),
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        consumerid = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black)),
                      hintText: 'Enter Consumer ID',
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                CustomButton(
                  onpress: () async {
                    String codeSanner =
                        await BarcodeScanner.scan(); //barcode scnner
                    setState(() {
                      txt.text = codeSanner;
                    });
                  },
                  text: 'Open Scanner',
                  accentColor: Colors.white,
                  mainColor: Color(0xFF1DE9B6),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                CustomButton(
                  onpress: () async {
                    var url = Uri.parse(
                        "http://localhost:3000/covatt-api/v1/vaccine");
                    var response = await http.post(url,
                        body: jsonEncode({
                          "brand": dropdownValue,
                          "consumer": "605f0d9c033b5c1a3402319a",
                          "vaccinator": widget.user.id,
                          "location": locationvalue
                        }),
                        headers: {
                          'x-integrity-key': widget.user.integrityKey,
                          'x-vaccinator-id': widget.user.id,
                          "content-type": "application/json",
                          "accept": "application/json",
                        });
                    var body = jsonDecode(response.body);
                    //TODO: CHECK IF SUCCESS ELSE SHOW SNACKBAR
                  },
                  text: 'Add Record',
                  accentColor: Colors.white,
                  mainColor: Color(0xFF1DE9B6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
