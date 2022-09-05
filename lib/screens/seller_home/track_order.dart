import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_login_regis_provider/Constants/my_colors.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/bottom.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({Key key}) : super(key: key);

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  var list = ["Item 1", "Item 2", "Item 3", "Item 4"];

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
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.01,
                    vertical: size.height * 0.04),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: SvgPicture.asset(
                          "assets/images/arrow_back.svg",
                          height: size.height * 0.03,
                        ),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.015),
                        child: const Text(
                          "Track Order",
                          style: TextStyle(
                            fontSize: 20,
                            color: MyColors.second,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Customer Name',
                                        style:
                                            TextStyle(color: MyColors.second),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '+9989867980809',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Address here',
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
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.07),
                        child: Divider(
                          color: MyColors.prime,
                          thickness: 1.5,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.07),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Items",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: MyColors.second),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            for (var item in list)
                              Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black)),
                                      padding: const EdgeInsets.all(10),
                                      child: const Icon(Icons.person)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: size.height * 0.06,
                                      width: size.height * 0.18,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            item,
                                            style: TextStyle(
                                                color: MyColors.second,
                                                fontSize: 17),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Item Comments",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          MyColors.secondLite),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SvgPicture.asset(
                                                    "assets/images/arrow_forward.svg",
                                                    color: MyColors.second,
                                                    height: size.height * 0.01,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Order comments will come here'),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.07),
                        child: Divider(
                          color: MyColors.prime,
                          thickness: 1.5,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current Status',
                                  style: TextStyle(
                                      fontSize: 16, color: MyColors.second),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: MyColors.second),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "With Driver...",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivery Day',
                                  style: TextStyle(
                                      fontSize: 16, color: MyColors.second),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Sun, Sep 4, 2022",
                                    style: TextStyle(),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amount',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 16, color: MyColors.second),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "AED 200",
                                    style: TextStyle(),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment Method',
                                  style: TextStyle(
                                      fontSize: 16, color: MyColors.second),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Card",
                                    style: TextStyle(),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
