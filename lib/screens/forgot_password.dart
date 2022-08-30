

import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/mobile_ver.dart';
import 'package:flutter_login_regis_provider/utility/validator.dart';
import 'package:flutter_login_regis_provider/utility/widgets.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPassword createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  bool isOtp = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Forgot Username Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                    autofocus: false,
                    validator: validateEmail,
                    decoration:
                        buildInputDecoration('Mobile Number', Icons.phone),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: () {
                       Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MobileVer(mobile_register: false,),
                      ));
                      },
                      color: Colors.black,
                      textColor: Colors.white,
                      child: Text('Get OTP'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
