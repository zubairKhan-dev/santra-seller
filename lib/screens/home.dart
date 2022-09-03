import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/login.dart';
import 'package:flutter_login_regis_provider/screens/register.dart';
import 'package:flutter_login_regis_provider/screens/register_mobile.dart';
import 'package:flutter_login_regis_provider/widgets/app_title.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg_image_santra.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter
                ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40),
                child: AppTitle(),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                },
                child: Card(
                  shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(10.0)),
                  elevation: 10,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    child: Text('Sign In',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xFF265198))),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              FlatButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.apple), Text(' Sign in with Apple')],
                ),
                color: Colors.black,
                textColor: Colors.white,
              ),
              SizedBox(
                height: 15.0,
              ),
              FlatButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.mail), Text(' Sign in with Google')],
                ),
                color: Colors.redAccent,
                textColor: Colors.white,
              ),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterMobile(),
                      ));
                },
                child: Card(
                  shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(10.0)),
                  color: Color(0xFF78CDC8),
                  elevation: 10, 
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF265198)),
                    ),
                    
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
