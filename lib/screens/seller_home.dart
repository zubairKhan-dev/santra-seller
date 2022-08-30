import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import './search.dart';

class SellerHome extends StatefulWidget {
  const SellerHome({Key key}) : super(key: key);

  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          // title: Text('Santra', textAlign: TextAlign.center,),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {
               Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Search(),
                            ));
            },),
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: Text(
                  'Order Management',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.black, //<-- SEE HERE
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.file_copy,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Orders',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.black, //<-- SEE HERE
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          onPressed: () {
                           
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.add_box,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Manual Orders',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: Text(
                  'Order Management',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.black, //<-- SEE HERE
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.add_box_outlined,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Add Categories',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.black, //<-- SEE HERE
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.black,
                                ),
                                Text(
                                  'View Categories',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.black, //<-- SEE HERE
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.add_box_outlined,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Add Products',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.black, //<-- SEE HERE
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.black,
                                ),
                                Text(
                                  'View Products',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: Text(
                  'Order Management',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.black, //<-- SEE HERE
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.add_box_outlined,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Add Promotions',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.black, //<-- SEE HERE
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.black,
                                ),
                                Text(
                                  'View Promotions',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: Text(
                  'Order Management',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.black, //<-- SEE HERE
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.wallet,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Wallet',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.black, //<-- SEE HERE
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.file_copy_outlined,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Reports',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: Text(
                  'Order Management',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.black, //<-- SEE HERE
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Settings',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.black, //<-- SEE HERE
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Notifications',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: Text(
                  'Order Management',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.black, //<-- SEE HERE
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.reviews,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Reviews',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //backgroundColor: Colors.black, //<-- SEE HERE
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.message,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Messages',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
