import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/change_password.dart';
import 'package:flutter_login_regis_provider/screens/register_password.dart';
import 'package:flutter_login_regis_provider/widgets/app_title.dart';
import '../widgets/otp_ver.dart';

class MobileVer extends StatelessWidget {
  final bool mobile_register;
  MobileVer({Key key, @required this.mobile_register}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg_img_santra.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
                ),
          ),
          padding: EdgeInsets.all(40),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Transform.scale(
                scale: 0.8,
                child: AppTitle(),
              ),
              SizedBox(height: 50,),
              Text(
                'Mobile Verification',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF265198)
                    ),
              ),
              SizedBox(height: 50,),
              Text(
                'Please enter the 6 Digit OTP',
                style: TextStyle(fontSize: 14, color: Color(0xFF265198)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: OtpVer(),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  color: Color(0xFF265198),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => mobile_register
                              ? RegisterPassword()
                              : ChangePassword(),
                        ));
                  },
                  child: Text('Verify', style: TextStyle(color: Colors.white),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Did not recieve ant OTP? ', style: TextStyle(color: Color(0xFF265198)),),
                  Text('Resend', style: TextStyle(color: Colors.red),),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
