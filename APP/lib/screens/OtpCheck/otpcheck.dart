import 'package:covatt/services/get_it.dart';
import 'package:covatt/services/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:covatt/services/navigation_service.dart';
// import 'package:covatt/services/get_it.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';

class OtpCheck extends StatefulWidget {
  final String numberHolder;
  OtpCheck(this.numberHolder);

  @override
  _OtpCheckState createState() => _OtpCheckState();
}

class _OtpCheckState extends State<OtpCheck> {
  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";
  StreamController<ErrorAnimationType> errorController;

  String _verificationCode;
  var onTapRecognizer;
  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    _verifyPhone();
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

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
                  "Enter OTP",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width * 0.16,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.add,
                      color: Color(0xFF2AB9D4),
                      size: 40,
                    ),
                    Icon(
                      Icons.add,
                      color: Color(0xFF2AB9D4),
                      size: 40,
                    ),
                    Icon(
                      Icons.add,
                      color: Color(0xFF2AB9D4),
                      size: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Code is sent to ',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      TextSpan(
                        text: widget.numberHolder,
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        obscureText: true,
                        obscuringCharacter: '*',
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v.length < 3) {
                            return "I'm from validator";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor:
                              hasError ? Colors.orange : Colors.white,
                          inactiveFillColor: Colors.green,
                          inactiveColor: Colors.green,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: Colors.blue.shade50,
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "Please enter correct OTP" : "",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Resend OTP',
                          style: TextStyle(color: Color(0xFF1DE9B6)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Navigate to Reset password page');
                            }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: () async {
                    formKey.currentState.validate();

                    if (currentText.length != 6) {
                      errorController.add(ErrorAnimationType.shake);
                      setState(() {
                        hasError = true;
                      });
                    } else {
                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(PhoneAuthProvider.credential(
                                verificationId: _verificationCode,
                                smsCode: currentText))
                            .then((value) async {
                          if (value.user != null) {
                            _navigationService.popAllAndReplace('/profile',
                                arguments: {
                                  'numberHolder': widget.numberHolder
                                });
                          }
                        });
                      } catch (e) {
                        FocusScope.of(context).unfocus();
                        print("In Exception Caught");
                        //TODO: Show snackbar for otp not verified
                      }
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        color: Color(0xFF1DE9B6),
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        'Verify'.toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.numberHolder}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              _navigationService.popAllAndReplace('/first_screen');
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }
}
