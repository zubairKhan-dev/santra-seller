import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/widgets/input_decoration_standard.dart';
import './input_decoration.dart';

class FullNameInput extends StatelessWidget {

  final Function onSaveFirstName;
  final Function onSaveLastName;
  const FullNameInput(this.onSaveFirstName, this.onSaveLastName);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(size.width* 0.07, size.height * 0.005, size.width* 0.03, size.height * 0.005),
              child: TextFormField(
                onSaved: (value) => onSaveFirstName(value),
                style: TextStyle(fontSize: 16),
                decoration: standardInputDecoration(
                  'First Name',
                  Icons.perm_identity,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
             padding: EdgeInsets.fromLTRB(size.width* 0.03, size.height * 0.005, size.width* 0.07, size.height * 0.005),
              child: TextFormField(
                onSaved: (value) => onSaveLastName(value),
                style: TextStyle(fontSize: 16),
                decoration: standardInputDecoration(
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
