import 'package:flutter/material.dart';
import '../widgets/input_decoration.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'santra',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
            ),
            SizedBox(
              height: 50.0,
            ),
            TextFormField(
              autofocus: false,
              decoration: customInputDecoration('New Password', Icons.password),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              autofocus: false,
              decoration:
                  customInputDecoration('Confirm Password', Icons.password),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                onPressed: () {},
                color: Colors.purple,
                textColor: Colors.white,
                child: Text('Change Password'),
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.5, color: Colors.black),
                ),
                onPressed: () {},
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
