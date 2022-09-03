import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/config/theme/theme_config.dart';
import 'package:flutter_login_regis_provider/screens/mobile_ver.dart';
import 'package:flutter_login_regis_provider/widgets/app_title.dart';
import '../widgets/mobile_input.dart';
import 'package:flutter_login_regis_provider/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:flushbar/flushbar.dart';

class RegisterMobile extends StatelessWidget {
  String mobile;
  bool mobile_ver = true;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    var sendOtp = () {
      auth.notify();

      auth.verify(mobile).then((response) {
        if (response['status']) {
          print('yaay');
          print(response);
        } else {
          Flushbar(
            title: 'Registration fail',
            message: response.toString(),
            duration: Duration(seconds: 10),
          ).show(context);
        }
      });
    };

    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_img_santra.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
                scale: 0.7,
                child: AppTitle(),
              ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Lets get started',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: 'Raleway',
                color: Color(0xFF265198),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MobileInput(),
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
                        builder: (context) => MobileVer(
                          mobile_register: true,
                        ),
                      ));
                },
                color: Color(0xFF265198),
                textColor: Colors.white,
                child: Text('Next'),
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.5, color: Colors.white),
                ),
                onPressed: () {},
                child: Text(
                  'Already have an account ?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
