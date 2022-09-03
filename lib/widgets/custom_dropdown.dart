import 'package:flutter/material.dart';
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
        hintText: hintText,
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
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
