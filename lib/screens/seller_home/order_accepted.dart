import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../Constants/my_colors.dart';
import 'bottom.dart';
import 'contact_santra.dart';

class OrderAccepted extends StatelessWidget {
  const OrderAccepted({Key key}) : super(key: key);

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
                          "Order Accepted",
                          style: TextStyle(
                            fontSize: 20,
                            color: MyColors.second,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.65,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.person)),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Customer name",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: MyColors.second),
                                      ),
                                      Text(
                                        "Order Time",
                                        style:
                                            TextStyle(color: MyColors.second),
                                      ),
                                      Text("+098765456789",
                                          style:
                                              TextStyle(color: MyColors.second))
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text("Order# :123",
                                          style: TextStyle(
                                              color: MyColors.second)),
                                      Text("Business Bay",
                                          style:
                                              TextStyle(color: MyColors.second))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 1.5,
                        color: MyColors.prime,
                      ),
                      Container(
                        height: size.height * 0.25,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: MyColors.prime,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text("1"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black)),
                                        padding: const EdgeInsets.all(10),
                                        child: const Icon(Icons.person)),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Item $index",
                                          style: TextStyle(
                                              color: MyColors.second,
                                              fontSize: 19),
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
                                  )
                                ],
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Order special instructions will go here"),
                      ),
                      const Divider(
                        thickness: 1.5,
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
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const ContactSantra());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: MyColors.secondLite,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: const [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  Icons.email,
                                  color: MyColors.prime,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Contact Santra",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _makePhoneCall("5678909876");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: MyColors.secondLite,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  Icons.dialpad,
                                  color: MyColors.prime,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Call Santra",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    //await launchUrl(launchUri);
  }
}
