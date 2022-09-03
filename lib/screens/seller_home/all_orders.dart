import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/track_order.dart';

class AllOrders extends StatefulWidget {
  const AllOrders({Key key}) : super(key: key);

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  var list = ["one", "two", "three", "four", "five", "six", "seven", "eight"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Orders'),
        ),
        body: Container(
          child: SingleChildScrollView(
              child: Column(
            children: [
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
                              Text('Order #'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('123'),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TrackOrder(),
                                      ));
                                },
                                child: Text(
                                  'Track Order',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
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
                                          'Customer Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Total Amount ' + ' 2000 AED',
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
