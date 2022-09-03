import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/widgets/custom_dropdown.dart';
import 'package:flutter_login_regis_provider/widgets/input_decoration.dart';

class MobileInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(fontSize: 16),
                decoration: customInputDecoration('+91', null)
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(fontSize: 16),
                decoration: customInputDecoration('IN', null)
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(fontSize: 16),
                decoration: customInputDecoration('', null)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
