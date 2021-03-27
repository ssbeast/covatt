import 'dart:convert';

import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:covatt/common/custom_button.dart';
import 'package:covatt/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FamilyScreen extends StatefulWidget {
  final UserData user;
  FamilyScreen(this.user);
  @override
  _FamilyScreenState createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  String qrCodeResult = "Nothing Scanned yet";
  String dropdownValue = 'Vaccine 1';
  String locationvalue = '';
  String familymemeberid = '';

  TextEditingController t = new TextEditingController();

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
                  "Add Family Members",
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: TextField(
                    controller: t,
                    style: TextStyle(color: Colors.black),
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        familymemeberid = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black)),
                      hintText: 'Enter Family member ID',
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
                      t.text = codeSanner;
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
                    // var x = "605f0df7033b5c1a3402319b";
                    var url = Uri.parse(
                        "http://localhost:3000/covatt-api/v1/user/link/" +
                            widget.user.id +
                            "?with=" +
                            familymemeberid);
                    var response = await http.post(url);
                    var body = jsonDecode(response.body);
                    print(body);
                    //TODO: CHECK IF SUCCESS ELSE SHOW SNACKBAR
                  },
                  text: 'Add Family Member',
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
