import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/login.dart';
import 'package:flutter_login_regis_provider/screens/register.dart';
import 'package:flutter_login_regis_provider/screens/register_mobile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'santra',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
            ),
            SizedBox(height: 50.0,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: 
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                },
                child: Text('Sign In'),
                color: Colors.purple,
                textColor: Colors.white,
              ),
            ),
            SizedBox(height: 5.0,),
            FlatButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.apple),
                  Text(' Sign in with Apple')
              ],),
              color: Colors.black,
              textColor: Colors.white,
            ),
            SizedBox(height: 5.0,),
            FlatButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.mail),
                  Text(' Sign in with Google')
              ],),
              color: Colors.redAccent,
              textColor: Colors.white,
            ),
            SizedBox(height: 5.0,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: 
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.5, color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterMobile(),
                      ));
                },
                child: Text(
                  'Sign Up with Email',
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
