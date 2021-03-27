import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String hintText;
  final bool obscure;
  final TextInputType keyboard;
  TextCustom({this.hintText, this.obscure, this.keyboard = TextInputType.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width * 0.70,
      child: TextField(
        style: TextStyle(color: Colors.black),
        keyboardType: keyboard,
        onSubmitted: (value) {},
        autofocus: false,
        obscureText: obscure ? true : false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.black)),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
