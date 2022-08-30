import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/mobile_ver.dart';
import '../widgets/mobile_input.dart';
import 'package:flutter_login_regis_provider/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:flushbar/flushbar.dart';

class RegisterMobile extends StatelessWidget {
  String mobile;
  bool mobile_ver= true;

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
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Lets get started',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway'),
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
                        builder: (context) => MobileVer(mobile_register: true,),
                      ));
                },
                color: Colors.purple,
                textColor: Colors.white,
                child: Text('Next'),
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.5, color: Colors.black),
                ),
                onPressed: () {
                  
                },
                child: Text(
                  'Already have an account ?',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
