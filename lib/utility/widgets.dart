import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/constants/my_colors.dart';

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: Color.fromRGBO(50, 62, 72, 1.0)),
     hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}

MaterialButton longButtons(String title, Function fun,
    {Color textColor: Colors.white}) {
  return MaterialButton(
    elevation: 10,
    onPressed: fun,
    textColor: textColor,
    color: Color(0xFF265198),
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
    minWidth: 600,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7))),
  );
}

MaterialButton SecButton(String title, Function fun,
    {Color textColor: MyColors.second}) {
  return MaterialButton(
    elevation: 10,
    onPressed: fun,
    textColor: textColor,
    color: MyColors.prime,
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
    minWidth: 600,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7))),
  );
}
