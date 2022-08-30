import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/change_password.dart';
import 'package:flutter_login_regis_provider/screens/register_password.dart';
import '../widgets/otp_ver.dart';

class MobileVer extends StatelessWidget {

  final bool mobile_register;
  MobileVer({Key key, @required this.mobile_register}) : super(key: key);

  

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
              Text('Mobile Verification', style: TextStyle(
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => mobile_register ? RegisterPassword() : ChangePassword(),
                      ));
                  },
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
