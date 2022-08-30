import 'package:flutter/material.dart';
import './input_decoration.dart';

class CustomDropdown extends StatelessWidget {
  var icon;
  var hintText;

  CustomDropdown(@required this.icon, @required this.hintText);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
         decoration: customInputDecoration(
                  '',
                  icon,
                ),
         hint: Text(hintText),
         items: <String>['A', 'B', 'C', 'D'].map((String value) {
         return DropdownMenuItem<String>(
         value: value,
         child: new Text(value),
       );
      }).toList(),
     onChanged: (_) {},
);

  }
}
