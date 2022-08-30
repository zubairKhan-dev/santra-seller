import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/input_decoration.dart';

class Search extends StatefulWidget {
  //const Search({Key key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 55,
          ),
          Container(
            width: double.infinity,
            color: Colors.grey,
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
                    decoration: customInputDecoration(
                        "Search Products", Icons.search),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:
                      IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
