import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/mobile_ver.dart';
import 'package:flutter_login_regis_provider/utility/validator.dart';
import 'package:flutter_login_regis_provider/utility/widgets.dart';
import 'package:flutter_login_regis_provider/widgets/app_title.dart';
import 'package:flutter_login_regis_provider/widgets/input_decoration_standard.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPassword createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  bool isOtp = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_img_santra.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(40.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 0.7,
                child: AppTitle(),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'Forgot Username Password',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xFF265198)),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextFormField(
                  autofocus: false,
                  validator: validateEmail,
                  decoration:
                      standardInputDecoration('Mobile Number', Icons.phone)),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                  width: double.infinity,
                  child: longButtons('Get OTP', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobileVer(
                            mobile_register: false,
                          ),
                        ));
                  })),
            ],
          ),
        ),
      )),
    );
  }
}
