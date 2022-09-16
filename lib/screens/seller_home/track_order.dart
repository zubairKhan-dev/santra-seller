import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/bottom.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/my_colors.dart';
import 'dart:math' as math;

class TrackOrder extends StatefulWidget {
  TrackOrder({key}) : super(key: key);
  int selectedIndex = 0;
  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  List<String> categoryList = ["Select Category", "Food", "Clothing", "Beauty"];
  String selectedCat = "Select Category";
  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  var list= ['1','2','3'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Bottom(),
      backgroundColor: MyColors.prime,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.025, horizontal: size.width * 0.025),
              decoration: const BoxDecoration(color: Color(0xFFE6F2EB)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "assets/images/arrow_back.svg",
                          height: size.height * 0.025,
                          color: MyColors.primary,
                        )),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: SizedBox(
                            height: size.height * 0.05,
                            child: Text(
                              'Track Order #123',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.primary),
                            )),
                      ),
                    ),
                    InkWell(
                        onTap: () {},
                        child: Card(
                            elevation: 5,
                            color: Color(0xFFCF4C5E),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ))),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/images/pending.svg",
                          height: size.height * 0.05,
                          //color: MyColors.primary,
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          'Pending',
                          style: TextStyle(color: MyColors.primary),
                        )
                      ],
                    ),
                  ),
                  Transform.rotate(
                    angle: -math.pi,
                    child: SvgPicture.asset(
                      "assets/images/arrow_back.svg",
                      height: size.height * 0.025,
                      color: MyColors.primary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/images/ready_to_ship.svg",
                          height: size.height * 0.05,
                          //color: MyColors.primary,
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          'Ready to ship',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Transform.rotate(
                    angle: -math.pi,
                    child: SvgPicture.asset(
                      "assets/images/arrow_back.svg",
                      height: size.height * 0.025,
                      color: MyColors.primary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/images/delivered.svg",
                          height: size.height * 0.05,
                          //color: MyColors.primary,
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          'Ready to ship',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(size.height * 0.05),
                    decoration: BoxDecoration(
                        color: Color(0xFFECECEC),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    height: size.height * 1.1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        for (var item in list) 
                        Card(
                            elevation: 5,
                            color: MyColors.prime,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Container(
                                    height: size.height * 0.05,
                                    width: size.height * 0.05,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                size.height * 0.01))),
                                  ),
                                  Spacer(),
                                  Text('AED', style: TextStyle(color: MyColors.primary, fontWeight: FontWeight.w400, fontSize: 24),)
                                ],
                              ),
                            ))
                      ],
                    )),
                Container(
                  height: size.height * 0.68,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.07,
                              vertical: size.height * 0.03),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: MyColors.prime, width: 1.0))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order ID: 4564984",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: size.height * 0.035,
                                ),
                                Row(
                                  children: [
                                    Text('sdsd',
                                        style:
                                            TextStyle(color: MyColors.primary)),
                                    SizedBox(
                                      width: size.width * 0.25,
                                    ),
                                    Text('sdsd'),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Row(
                                  children: [
                                    Text('sdsd',
                                        style:
                                            TextStyle(color: MyColors.primary)),
                                    SizedBox(
                                      width: size.width * 0.25,
                                    ),
                                    Text('sdsd'),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Row(
                                  children: [
                                    Text('sdsd',
                                        style:
                                            TextStyle(color: MyColors.primary)),
                                    SizedBox(
                                      width: size.width * 0.25,
                                    ),
                                    Text('sdsd'),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'sdsd',
                                      style: TextStyle(color: MyColors.primary),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.25,
                                    ),
                                    Text('sdsd'),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Row(
                                  children: [
                                    Text('sdsd',
                                        style:
                                            TextStyle(color: MyColors.primary)),
                                    SizedBox(
                                      width: size.width * 0.25,
                                    ),
                                    Text('sdsd'),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.05,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.07,
                              vertical: size.height * 0.03),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: MyColors.prime, width: 1.0))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order ID: 4564984",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: size.height * 0.035,
                                ),
                                Row(
                                  children: [
                                    Text('sdsd',
                                        style:
                                            TextStyle(color: MyColors.primary)),
                                    SizedBox(
                                      width: size.width * 0.25,
                                    ),
                                    Text('sdsd'),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Row(
                                  children: [
                                    Text('sdsd',
                                        style:
                                            TextStyle(color: MyColors.primary)),
                                    SizedBox(
                                      width: size.width * 0.25,
                                    ),
                                    Text('sdsd'),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Row(
                                  children: [
                                    Text('sdsd',
                                        style:
                                            TextStyle(color: MyColors.primary)),
                                    SizedBox(
                                      width: size.width * 0.25,
                                    ),
                                    Text('sdsd'),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'sdsd',
                                      style: TextStyle(color: MyColors.primary),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.25,
                                    ),
                                    Text('sdsd'),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Row(
                                  children: [
                                    Text('sdsd',
                                        style:
                                            TextStyle(color: MyColors.primary)),
                                    SizedBox(
                                      width: size.width * 0.25,
                                    ),
                                    Text('sdsd'),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.05,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}