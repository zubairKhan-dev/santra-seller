import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Constants/my_colors.dart';
import 'bottom.dart';
import 'contact_santra.dart';

class RejectOrder extends StatefulWidget {
  const RejectOrder({Key key}) : super(key: key);

  @override
  State<RejectOrder> createState() => _RejectOrderState();
}

class _RejectOrderState extends State<RejectOrder> {
  List<String> orderRejectionReasons = [
    "Select reason",
    "Reason 1",
    "Reason 2",
    "Reason 3",
    "Reason 4"
  ];
  String selectedReason = "Select reason";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final space = SizedBox(height: 10);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Bottom(),
      backgroundColor: MyColors.prime,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.01, vertical: size.height * 0.04),
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
                        "Reject Order",
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
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              width: size.width * 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(color: MyColors.prime))),
                      width: size.width * 0.8,
                      child: Column(
                        children: [
                          DropdownButton<String>(
                            value: selectedReason,
                            icon: Expanded(
                              child: Row(
                                children: const [
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.arrow_drop_down),
                                  ),
                                ],
                              ),
                            ),
                            elevation: 16,
                            underline: const SizedBox(),
                            onChanged: (String newValue) {
                              setState(() {
                                selectedReason = newValue;
                                print(newValue);
                              });
                            },
                            items: orderRejectionReasons
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    value.toString(),
                                    style: const TextStyle(
                                        color: MyColors.secondLite,
                                        fontSize: 19,
                                        fontFamily: "Raleway Reg"),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textAlign: TextAlign.start,

                      maxLines: 8,
                      //  controller: passwordController,
                      enableSuggestions: false,
                      // key: const ValueKey("password"),
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: "Comments",
                        labelStyle: const TextStyle(color: MyColors.prime),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: MyColors.prime)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: MyColors.prime)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: MyColors.secondLite,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Reject Order",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.1),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.01),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 8),
                                  child: Row(
                                    children: const [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        child: Icon(
                                          Icons.email,
                                          color: MyColors.prime,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Contact Santra",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        child: Icon(
                                          Icons.dialpad,
                                          color: MyColors.prime,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Call Santra",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
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
            ),
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
