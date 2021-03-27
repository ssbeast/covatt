import 'package:covatt/common/custom_button.dart';
import 'package:covatt/screens/generate_screen.dart';
import 'package:covatt/screens/scan_screen.dart';
import 'package:flutter/material.dart';

class QrScreen extends StatefulWidget {
  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
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
              children: <Widget>[
                Text(
                  "Add Your Friends",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width * 0.18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                CustomButton(
                  onpress: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GenerateQR()));
                  },
                  text: 'Generate QR Code',
                  accentColor: Colors.white,
                  mainColor: Color(0xFF1DE9B6),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                CustomButton(
                  onpress: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScanQR()));
                  },
                  text: 'Scan QR Code',
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
