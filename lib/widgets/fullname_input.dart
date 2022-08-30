import 'package:flutter/material.dart';
import './input_decoration.dart';

class FullNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
              child: TextField(
                style: TextStyle(fontSize: 16),
                decoration: customInputDecoration(
                  'First Name',
                  Icons.perm_identity,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
              child: TextField(
                style: TextStyle(fontSize: 16),
                decoration: customInputDecoration(
                  'Last Name',
                  Icons.perm_identity,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
