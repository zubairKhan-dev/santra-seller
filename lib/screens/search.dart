import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_login_regis_provider/screens/advance_search.dart';
import 'package:flutter_login_regis_provider/widgets/custom_dropdown.dart';
import '../widgets/input_decoration.dart';

class Search extends StatefulWidget {
  //const Search({Key key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var advance= false;

  Widget _renderAdvanceSearch() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: Colors.grey),
          child: Text(
            '🔍 Advance Search',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomDropdown(
                      null, 'Select Category', ['Product', "category"]),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomDropdown(
                      null, 'Select Category', ['Product', "category"]),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdvanceSearch(),
                  ));
            },
            color: Colors.grey,
            textColor: Colors.black,
            child: Text('Search'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 55,
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[300],
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child:
                      IconButton(icon: Icon(Icons.settings), onPressed: () {}),
                ),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    // autofocus: false,
                    decoration:
                        customInputDecoration("Search Products", Icons.search),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                      icon: Icon(Icons.notifications), onPressed: () {}),
                ),
              ],
            ),
          ),
          !advance ?
          Container(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    advance= true;
                  });
                },
                child: Text(
                  '🔍 Advance',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ))
              :
          _renderAdvanceSearch()
        ],
      ),
    );
  }
}
