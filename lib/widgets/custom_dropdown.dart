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
      decoration: standardInputDecoration(hintText, icon),
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
