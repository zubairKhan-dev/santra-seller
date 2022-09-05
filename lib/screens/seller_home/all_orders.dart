import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/bottom.dart';

import 'package:flutter_login_regis_provider/screens/seller_home/track_order.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Constants/my_colors.dart';
import '../../widgets/input_decoration.dart';

class AllOrders extends StatefulWidget {
  AllOrders({Key key}) : super(key: key);

  @override
  State<AllOrders> createState() => _AllOrders();
}

class _AllOrders extends State<AllOrders> {
  var list = ["1", "2", "3", "4", "5", "6", "7", "8"];

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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.01,
                      vertical: size.height * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: SvgPicture.asset(
                            "assets/images/arrow_back.svg",
                            height: size.height * 0.03,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.2,
                                vertical: size.height * 0.015),
                            child: const Text(
                              "All Orders",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: size.height * 0.68,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  height: size.height * 0.1,
                                  child: Image.asset(
                                    "assets/images/kfc.png",
                                    fit: BoxFit.contain,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  width: size.width * 0.7,
                                                  child: Row(
                                                    children: [
                                                      Text("Order"),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                MyColors.second,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        12.0,
                                                                    vertical:
                                                                        4),
                                                            child: Text(
                                                              "#123",
                                                              style: TextStyle(
                                                                  color: MyColors
                                                                      .prime),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                              color:
                                                                  Colors.black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      12.0,
                                                                  vertical: 4),
                                                          child: Text(
                                                            "New",
                                                            style: TextStyle(
                                                                color: MyColors
                                                                    .second),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Container(
                                                    width: size.width * 0.65,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Customer Name",
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          114,
                                                                          113,
                                                                          113)),
                                                            ),
                                                          ],
                                                        ),
                                                        SvgPicture.asset(
                                                            "assets/images/arrow_forward.svg")
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Container(
                                                    width: size.width * 0.65,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              "assets/images/star_icon.svg",
                                                              height:
                                                                  size.height *
                                                                      0.025,
                                                            ),
                                                            SizedBox(
                                                              width: 2,
                                                            ),
                                                            Text(
                                                              '3.5 ' +
                                                                  ' Good Comment',
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          114,
                                                                          113,
                                                                          113)),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
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
                            Container(
                              width: size.width * 0.9,
                              child: Divider(
                                color: MyColors.prime,
                                thickness: 1.5,
                              ),
                            )
                          ],
                        );
                      })),
            ],
          ))),
    );
  }
}
