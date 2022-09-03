import 'package:flutter/material.dart';

import 'package:flutter_login_regis_provider/screens/seller_home/track_order.dart';
import '../../widgets/input_decoration.dart';

class ViewProducts extends StatefulWidget {
  ViewProducts({Key key}) : super(key: key);

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  var list = ["1", "2", "3", "4", "5", "6", "7", "8"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: Container(
          child: SingleChildScrollView(
              child: Column(
            children: [
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
              for (var item in list)
                Container(
                  //color: Colors.grey,
                  //padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.5, color: Colors.grey),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                width: 1.5,
                              ),
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Product'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('123'),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          'Category '+ '${item}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Total Sales ' + ' 2000 AED',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 114, 113, 113)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.add_card),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Icon(Icons.add_a_photo_outlined),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Icon(Icons.emoji_emotions),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Icon(Icons.access_alarm),
                                            Text(
                                              '+ 3 more items',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          )),
        ));
  }
}
