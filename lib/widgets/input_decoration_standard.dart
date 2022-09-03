import 'package:flutter/material.dart';

InputDecoration standardInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    hintStyle: TextStyle(color: Color(0xFF265198)),
    prefixIcon: Icon(
      icon,
      color: Color(0xFF265198),
    ),
    hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 20.0, 15.0),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF79CCC9)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF79CCC9)),
    ),
  );
}
