import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  // suffixIcon: Icon(
  //   Icons.keyboard_arrow_down,
  //   size: 10.0,
  //   color: Color(0xFF1353CB),
  // ),
  contentPadding: EdgeInsets.only(left: 16.0, top: 13.0, bottom: 13.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF70A1FD), width: 1.0),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF70A1FD), width: 1.0),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  labelText: 'Child’s Nick Name*',
  labelStyle: TextStyle(
    color: Colors.black,
    fontSize: 16.0,
  ),
);
