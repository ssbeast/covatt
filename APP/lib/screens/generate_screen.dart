import 'package:covatt/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flushbar/flushbar.dart';

class GenerateQR extends StatefulWidget {
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  String qrData = "1876523428765";

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
                QrImage(data: qrData, padding: EdgeInsets.all(35)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(qrData,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomButton(
                  onpress: () {
                    Clipboard.setData(new ClipboardData(text: qrData));
                    Flushbar(
                      message: "Copied to Clipboard",
                      duration: Duration(seconds: 3),
                    )..show(context);
                  },
                  text: 'Copy to clipboard',
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
