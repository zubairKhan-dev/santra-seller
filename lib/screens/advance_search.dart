import 'package:flutter/material.dart';
import '../widgets/input_decoration.dart';

class AdvanceSearch extends StatelessWidget {
  AdvanceSearch({Key key}) : super(key: key);
  var list = ['1', '2', '3', '4', '5', '6', '7'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                child: IconButton(icon: Icon(Icons.settings), onPressed: () {}),
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
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: Colors.grey),
          child: Text(
            '🔍 Results',
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: Colors.grey),
          child: Text(
            'Products',
            style: TextStyle(color: Colors.black),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var item in list)
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Text('Product'),
                ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var item in list)
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Text('Product'),
                ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: Colors.grey),
          child: Text(
            'Categories',
            style: TextStyle(color: Colors.black),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var item in list)
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Text('Category'),
                ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var item in list)
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Text('Category'),
                ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var item in list)
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Text('Category'),
                ),
            ],
          ),
        ),
      ]),
    ));
  }
}
