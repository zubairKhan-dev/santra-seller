import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/models/user.dart';
import 'package:flutter_login_regis_provider/providers/auth_provider.dart';
import 'package:flutter_login_regis_provider/providers/user_provider.dart';
import 'package:flutter_login_regis_provider/screens/forgot_password.dart';
import 'package:flutter_login_regis_provider/screens/login_otp.dart';
import 'package:flutter_login_regis_provider/utility/validator.dart';
import 'package:flutter_login_regis_provider/utility/widgets.dart';
import 'package:flutter_login_regis_provider/widgets/app_title.dart';
import 'package:flutter_login_regis_provider/widgets/input_decoration_standard.dart';
import 'package:provider/provider.dart';
import 'package:flutter_login_regis_provider/screens/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  String _userName, _password;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    var doLogin = () {
      final form = formKey.currentState;

      if (form.validate()) {
        form.save();

        final Future<Map<String, dynamic>> respose =
            auth.login(_userName, _password);

        respose.then((response) {
          if (response['status']) {
            User user = response['user'];

            Provider.of<UserProvider>(context, listen: false).setUser(user);

            Navigator.pushReplacementNamed(context, '/dashboard');
          } else {
            Flushbar(
              title: "Failed Login",
              message: response['message']['message'].toString(),
              duration: Duration(seconds: 3),
            ).show(context);
          }
        });
      } else {
        Flushbar(
          title: 'Invalid form',
          message: 'Please complete the form properly',
          duration: Duration(seconds: 10),
        ).show(context);
      }
    };

    final loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Login ... Please wait")
      ],
    );

    final forgotLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.all(0.0),
          child: Text("Forgot password?",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.transparent,
                decorationColor: Color(0xFF265198),
                decorationThickness: 1,
                shadows: [
                  Shadow(color: Color(0xFF265198), offset: Offset(0, -5))
                ],
              ),),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgotPassword(),
                ));
          },
        ),
        FlatButton(
          padding: EdgeInsets.only(left: 0.0),
          child: Text("Sign up", style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.transparent,
                decorationColor: Color(0xFF265198),
                decorationThickness: 1,
                shadows: [
                  Shadow(color: Color(0xFF265198), offset: Offset(0, -5))
                ],
              )),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Register(),
                ));
          },
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg_img_santra.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter),
          ),
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 0.8,
                  child: AppTitle(),
                ),
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  autofocus: false,
                  validator: validateEmail,
                  onSaved: (value) => _userName = value,
                  decoration:
                      standardInputDecoration('Email/Number', Icons.email),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    autofocus: false,
                    obscureText: true,
                    //validator: validatePassword,
                    onSaved: (value) => _password = value,
                    decoration:
                        standardInputDecoration('Password', Icons.lock)),
                SizedBox(
                  height: 20.0,
                ),
                auth.loggedInStatus == Status.Authenticating
                    ? loading
                    : longButtons('Sign In', doLogin),
                SizedBox(
                  height: 8.0,
                ),
                forgotLabel,
                Spacer(),
                Container(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.5, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginOtp(),
                          ));
                    },
                    child: Text(
                      'Sign In with OTP',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
