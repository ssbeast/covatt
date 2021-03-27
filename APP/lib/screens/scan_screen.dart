import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:covatt/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flushbar/flushbar.dart';

class ScanQR extends StatefulWidget {
  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String qrCodeResult = "Nothing Scanned yet";

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
                  "Result",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                  textAlign: TextAlign.center,
                ),
                Text(
                  qrCodeResult,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                CustomButton(
                  onpress: () async {
                    String codeSanner =
                        await BarcodeScanner.scan(); //barcode scnner
                    setState(() {
                      qrCodeResult = codeSanner;
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
                  onpress: () {
                    Clipboard.setData(new ClipboardData(text: qrCodeResult));
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
