import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_login_regis_provider/screens/dashboard.dart';
import 'package:flutter_login_regis_provider/screens/register.dart';
import 'package:flutter_login_regis_provider/widgets/app_title.dart';
import 'package:flutter_login_regis_provider/widgets/input_decoration_standard.dart';
import '../widgets/input_decoration.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/user_provider.dart';

class RegisterPassword extends StatefulWidget {
  const RegisterPassword({Key key}) : super(key: key);

  @override
  State<RegisterPassword> createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
  bool terms = false;
  var mobile;
  var password;

  _showBottomModal(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return new Container(
            // height: 800,
            color: Colors.transparent,
            child: new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 0.0, // has the effect of extending the shadow
                  )
                ],
              ),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 10),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              terms = false;
                            });
                          },
                          child: Text(
                            "Disagree",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Colors.red),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5, right: 5),
                          child: FlatButton(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
                                terms = true;
                              });
                            },
                            child: Text(
                              "Agree",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: const Color(0xfff8f8f8),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              text:
                                  "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black,
                                  wordSpacing: 1)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context)  {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    

    var addNewPassword = () {
      final Future<Map<String, dynamic>> respose =
          auth.addNewPassword(mobile, password);

      respose.then((response) async{
        print('response in main file');
        print(respose);
        if (response['status']){
          Provider.of<UserProvider>(context, listen: false).setUser(response['data']);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Register(),
              ));
        } else {
          Flushbar(
            title: "Failed Register",
            message: response['message'],
            duration: Duration(seconds: 3),
          ).show(context);
        }
      });
    };

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_img_santra.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Transform.scale(
              scale: 0.6,
              child: AppTitle(),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Lets make it secure',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Color(0xFF265198)),
            ),
            SizedBox(
              height: 50.0,
            ),
            TextFormField(
              autofocus: false,
              decoration: standardInputDecoration('Email/Number', Icons.email),
              onChanged: (val) {
                setState(() {
                  mobile = val;
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              autofocus: false,
              decoration: standardInputDecoration('Password', Icons.password),
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                onPressed: terms == true
                    ? () {
                        addNewPassword();
                      }
                    : null,
                color: Color(0xFF265198),
                textColor: Colors.white,
                child: Text('Sign up'),
                disabledColor: Colors.black12,
                disabledTextColor: Colors.blueGrey,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By signing up, you agree with the ',
                    style: TextStyle(
                      fontSize: 12,
                      //fontWeight: FontWeight.w500
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showBottomModal(context);
                    },
                    child: Text(
                      'Terms and Conditions',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: Colors.blue),
                    ),
                  )
                ],
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
