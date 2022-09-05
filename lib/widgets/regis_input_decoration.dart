import 'package:flutter/material.dart';

InputDecoration regisInputDecoration(String hintText) {
  return InputDecoration(
    hintStyle: TextStyle(color: Color(0xFF265198), fontSize: 14),
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
