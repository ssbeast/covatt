import 'package:covatt/common/custom_button.dart';
import 'package:covatt/common/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:covatt/services/navigation_service.dart';
import 'package:covatt/services/get_it.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextStyle defaultStyle = TextStyle(color: Colors.black, fontSize: 20.0);
  TextStyle linkStyle = TextStyle(color: Color(0xFF1DE9B6));
  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();

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
                  "Register",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width * 0.16,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextCustom(
                  hintText: 'Enter Your Name',
                  obscure: false,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextCustom(
                  hintText: 'Enter Your Mobile Number',
                  keyboard: TextInputType.number,
                  obscure: false,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextCustom(
                  hintText: 'Enter Your Password',
                  obscure: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomButton(
                  onpress: () async {
                    _navigationService.navigateTo('/profile');
                  },
                  text: 'Register',
                  accentColor: Colors.white,
                  mainColor: Color(0xFF1DE9B6),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(text: 'Already Registered? '),
                      TextSpan(
                          text: 'Log In',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _navigationService.navigateTo('/login');
                            }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
