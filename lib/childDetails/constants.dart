import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
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
);
