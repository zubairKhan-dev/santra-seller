import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/widgets/input_decoration_standard.dart';
import './input_decoration.dart';

class CustomDropdown extends StatelessWidget {
  final List list;
  var icon;
  var hintText;

  CustomDropdown(this.icon, this.hintText, this.list);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
    hintStyle: TextStyle(color: Color(0xFF265198)),
    hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 20.0, 15.0),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF79CCC9)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF79CCC9)),
    ),
  ),
      hint: Text(hintText),
      items: list.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}
