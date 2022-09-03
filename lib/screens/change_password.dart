import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/utility/widgets.dart';
import 'package:flutter_login_regis_provider/widgets/app_title.dart';
import 'package:flutter_login_regis_provider/widgets/input_decoration_standard.dart';
import '../widgets/input_decoration.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        padding: EdgeInsets.all(40.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg_img_santra.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
                ),
          ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
             Transform.scale(
                scale: 0.7,
                child: AppTitle(),
              ),
            SizedBox(
                height: size.height * 0.05,
              ),
            TextFormField(
              autofocus: false,
              decoration: standardInputDecoration('New Password', Icons.password),
            ),
            SizedBox(
                height: size.height * 0.025,
              ),
            TextFormField(
              autofocus: false,
              decoration: standardInputDecoration('Confirm Password', Icons.password),
            ),
            SizedBox(
                height: size.height * 0.05,
              ),
            Container(
              width: double.infinity,
              child: longButtons('Change Password', () {})
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
