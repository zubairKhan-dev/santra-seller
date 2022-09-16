import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/constants/my_colors.dart';
import 'package:flutter_login_regis_provider/widgets/input_decoration_standard.dart';
import './input_decoration.dart';

class CustomDropdown extends StatelessWidget {
  final List list;
  var icon;
  var hintText;
  Function dropDownSelect;

  CustomDropdown(this.icon, this.hintText, this.list, this.dropDownSelect);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: TextStyle(color: MyColors.second, fontSize: 16),
      decoration: InputDecoration(
    hintStyle: TextStyle(color: MyColors.second, fontSize: 16),
    hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 20.0, 15.0),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF79CCC9)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF79CCC9)),
    ),
  ),
      items: list.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (val) {dropDownSelect(val);}
    );
  }
}
