import 'package:flutter/material.dart';

import 'package:flutter_login_regis_provider/widgets/input_decoration.dart';

class MobileInput extends StatelessWidget {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  var prefix;
  Function getPrefixVal;
  Function getMobileVal;
  MobileInput(this.prefix, this.getPrefixVal, this.getMobileVal);

  @override
  Widget build(BuildContext context) {
    //print(prefix);
    // ListsProvider list = Provider.of<ListsProvider>(context);
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
                  decoration: customInputDecoration('', Icons.arrow_drop_down),
                  hint: Text(''),
                  items: (prefix as List).asMap().entries.map((entry) {
                    int idx = entry.key;
                    String val = prefix[idx]['prefix_number'];
                    return DropdownMenuItem<String>(
                      value: val,
                      child: new Text(val),
                    );
                  }).toList(),
                  onChanged: (val) {
                    getPrefixVal(val);
                  },
                )),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(fontSize: 16),
                decoration: customInputDecoration('', null),
                onChanged: (val) {
                  getMobileVal(val);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
