// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BaseUrl {
  static const kLoginUrl = 'https://flutter.ramarumah.id/login.php';
  static const kRegisterURL = 'https://flutter.ramarumah.id/register.php';
}

Color kLightgreen = Color(0xFFB2DBBF);
Color kDarkerGreen = Color(0xFF70c1B3);
Color kYellow = Color(0xFFF3FFBD);

InputDecoration kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.only(left: 10),
  filled: true,
  fillColor: Color.fromRGBO(255, 255, 255, 0.3),
  focusColor: Color.fromRGBO(211, 211, 211, 1.0),
  hintText: '',
  hintStyle: TextStyle(color: Color(0xFF70C183), fontWeight: FontWeight.w800),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 3.0),
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
    borderSide: BorderSide(color: Colors.green, width: 3.0),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
    borderSide: BorderSide(color: Colors.transparent, width: 3.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
    borderSide: BorderSide(color: Colors.green, width: 3.0),
  ),
);

var Placeholder = Container(
  width: double.infinity,
  height: 150,
  child: Image.asset('dummyimage.png'),
);
