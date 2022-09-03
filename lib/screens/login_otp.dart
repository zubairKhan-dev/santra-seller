import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/utility/widgets.dart';
import 'package:flutter_login_regis_provider/widgets/app_title.dart';
import '../widgets/otp_ver.dart';

class LoginOtp extends StatefulWidget {
  @override
  State<LoginOtp> createState() => _LoginOtpState();
}

class _LoginOtpState extends State<LoginOtp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.all(40),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_img_santra.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Transform.scale(
                scale: 0.7,
                child: AppTitle(),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'Sign in with OTP',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF265198)),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              OtpVer(),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                  width: double.infinity, child: longButtons('Verify', () {})),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Did not recieve the OTP? ',
                      style: TextStyle(fontSize: 12, color: Color(0xFF265198)),
                    ),
                    Text(
                      'Resend',
                      style: TextStyle(fontSize: 12, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
