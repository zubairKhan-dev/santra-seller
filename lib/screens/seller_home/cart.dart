import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Constants/my_colors.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key key}) : super(key: key);
  var list = ["Item 1", "Item 2", "Item 3", "Item 4"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColors.prime,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.01, vertical: size.height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.015,
                          horizontal: size.width * 0.15),
                      child: const Text(
                        "Cart",
                        style: TextStyle(
                          fontSize: 20,
                          color: MyColors.second,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Un-paid",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: size.height * 0.7,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Customer Name',
                                      style: TextStyle(color: MyColors.second),
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
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.07),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Items",
                              style: TextStyle(
                                  fontSize: 23, color: MyColors.second),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Price",
                          style:
                              TextStyle(fontSize: 23, color: MyColors.second),
                        ),
                        Expanded(
                          child: Text(
                            "Qty",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 23, color: MyColors.second),
                          ),
                        ),
                      ],
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
                                                    color: MyColors.secondLite),
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
                                ),
                                Expanded(child: Text("AED 30")),
                                Expanded(
                                    child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/plus_icon.svg"),
                                      Text("1"),
                                      SvgPicture.asset(
                                          "assets/images/minus_icon.svg")
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.07),
                            child: Divider(
                              color: MyColors.prime,
                              thickness: 1.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Text(
                                  "Voucher Code",
                                  style: TextStyle(
                                      color: MyColors.secondLite, fontSize: 19),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: size.width * 0.15,
                                  child: TextFormField(
                                    enableSuggestions: false,
                                    cursorColor: MyColors.prime,
                                    decoration: const InputDecoration(
                                      hintText: "Code",
                                      hintStyle: TextStyle(
                                          color: MyColors.secondLite,
                                          fontSize: 14),
                                      fillColor: Colors.white,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: MyColors.prime),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: MyColors.prime),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextFormField(
                                    enableSuggestions: false,
                                    cursorColor: MyColors.secondLite,
                                    decoration: const InputDecoration(
                                      hintText: "Customer name",
                                      hintStyle: TextStyle(
                                          color: MyColors.secondLite,
                                          fontSize: 14),
                                      fillColor: Colors.white,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: MyColors.prime),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: MyColors.prime),
                                      ),
                                    ),
                                  ),
                                ),
                                SvgPicture.asset(
                                  "assets/images/plus_icon.svg",
                                  height: 20,
                                )
                              ],
                            ),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                          vertical: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width * 0.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sub Total:",
                                    style: TextStyle(
                                        color: MyColors.second, fontSize: 15),
                                  ),
                                  Text(
                                    "100 AED",
                                    style: TextStyle(
                                        color: MyColors.second, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width * 0.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "VAT 5%:",
                                    style: TextStyle(
                                        color: MyColors.second, fontSize: 15),
                                  ),
                                  Text(
                                    "1.87",
                                    style: TextStyle(
                                        color: MyColors.second, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width * 0.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Discount:",
                                    style: TextStyle(
                                        color: MyColors.second, fontSize: 15),
                                  ),
                                  Text(
                                    "10 AED",
                                    style: TextStyle(
                                        color: MyColors.second, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width * 0.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery Charges:",
                                    style: TextStyle(
                                        color: MyColors.second, fontSize: 15),
                                  ),
                                  Text(
                                    "10 AED",
                                    style: TextStyle(
                                        color: MyColors.second, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            color: MyColors.prime,
                            thickness: 1.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width * 0.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    " Total:",
                                    style: TextStyle(
                                        color: MyColors.second, fontSize: 15),
                                  ),
                                  Text(
                                    "150 AED",
                                    style: TextStyle(
                                        color: MyColors.second, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
