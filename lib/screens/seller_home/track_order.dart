import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({Key key}) : super(key: key);

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  var list = ["Item 1", "Item 2", "Item 3", "Item 4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Order'),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Colors.grey),
              ),
            ),
            width: double.infinity,
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.perm_identity,
                      size: 48,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Customer Name'),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Order Time',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '+971 543257751',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      'Order # 132',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Business boy',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Colors.grey),
              ),
            ),
            child: Column(
              children: [
                for (var item in list)
                  Row(
                    children: [
                      Icon(
                        Icons.perm_identity,
                        size: 48,
                      ),
                      Text(item),
                      Text(
                        '  Item Comments',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Order comments will come here'),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Status: With Driver',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                SizedBox(height: 10),
                Text(
                  'Delivery Day: Sun 25 Aug, 2022',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                SizedBox(height: 10),
                Text(
                  'Amount: 200 AED',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                SizedBox(height: 10),
                Text(
                  'Payment Method: Card',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
