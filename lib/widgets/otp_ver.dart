import 'package:flutter/material.dart';

class OtpVer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:
        TextField(
          style: TextStyle(
            fontSize: 36
          ),
          decoration: InputDecoration(
            hintText: '000000',
            border: OutlineInputBorder(),
            //labelText: 'Please enter 6 digit otp',
            //labelStyle: TextStyle(fontSize: 16),
            contentPadding: const EdgeInsets.symmetric(horizontal : 20, vertical: 30), isDense: true,
            hintStyle: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
              letterSpacing: 10,
            )
          ),
          textAlign: TextAlign.center,
        ),
      );
  }
}
