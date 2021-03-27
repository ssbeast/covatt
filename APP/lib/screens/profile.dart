import 'package:covatt/common/custom_button.dart';
import 'package:covatt/screens/FirstScreen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextStyle defaultStyle = TextStyle(color: Colors.black, fontSize: 20.0);
  TextStyle linkStyle = TextStyle(color: Color(0xFF1DE9B6));
  DateTime selectedDate = DateTime.now();
  String name = '';
  String dropdownValue = 'Male';
  PickedFile _image;
  final ImagePicker _picker = ImagePicker();

  _imgFromCamera() async {
    final image =
        await _picker.getImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    final image =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        backgroundColor: Color(0xFF1DE9B6),
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: Icon(Icons.photo_library,
                          color: Colors.white, size: 30),
                      title: Text('Gallery',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30)),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  new ListTile(
                    leading:
                        Icon(Icons.photo_camera, color: Colors.white, size: 30),
                    title: Text('Camera',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30)),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1975),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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
                  "Profile",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width * 0.16,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.22,
                    backgroundColor: Color(0xFF1DE9B6),
                    child: _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.25),
                            child: Image.file(
                              File(_image.path),
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.width * 0.4,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.25)),
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.width * 0.4,
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.grey,
                              size: MediaQuery.of(context).size.width * 0.3,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
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
                        name = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black)),
                      hintText: 'Enter Your Name',
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Select Your Gender",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
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
                          'Male',
                          'Female',
                          'Transgender',
                          'Not preferred to tell'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.07,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Text(
                          'Choose Your Date of Birth',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color(0xFF1DE9B6),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomButton(
                  onpress: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FirstScreen()));
                  },
                  text: 'Continue',
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
