import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/widgets/custom_dropdown.dart';

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
                decoration: InputDecoration(
                  hintText: '+91',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'IN',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: '',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
