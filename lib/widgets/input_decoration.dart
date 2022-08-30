import 'package:flutter/material.dart';

InputDecoration customInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(
      icon,
      color: Color.fromRGBO(50, 62, 72, 1.0),
    ),
    hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}
