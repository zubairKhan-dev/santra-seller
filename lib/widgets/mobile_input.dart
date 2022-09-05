import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/widgets/custom_dropdown.dart';
import 'package:flutter_login_regis_provider/widgets/input_decoration.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

class MobileInput extends StatelessWidget {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

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
                  decoration: customInputDecoration('+91', null)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(5),
                child: DropdownButtonFormField<String>(
                  decoration:  customInputDecoration('', Icons.arrow_drop_down),
                  hint: Text(''),
                  items: items.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                )),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: customInputDecoration('', null)),
            ),
          ),
        ],
      ),
    );
  }
}
