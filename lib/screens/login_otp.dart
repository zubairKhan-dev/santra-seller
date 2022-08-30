import 'package:flutter/material.dart';
import '../widgets/otp_ver.dart';

class LoginOtp extends StatefulWidget {
  @override
  State<LoginOtp> createState() => _LoginOtpState();
}

class _LoginOtpState extends State<LoginOtp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(40),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Sign In using OTP', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 300.0,),
              OtpVer(),
              SizedBox(height: 25.0,),
              Container(
                width: double.infinity,
                child: FlatButton(
                  color: Colors.green,
                  onPressed: () {},
                  child: Text('Sign In'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
