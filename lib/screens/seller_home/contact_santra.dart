import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Constants/my_colors.dart';
import 'bottom.dart';

class ContactSantra extends StatelessWidget {
  const ContactSantra({Key key}) : super(key: key);

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
                          "Contact Santra",
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Full name",
                    style: TextStyle(fontSize: 17),
                  ),
                  TextFormField(
                    enableSuggestions: false,
                    cursorColor: MyColors.prime,
                    decoration: const InputDecoration(
                      hintText: "Full name",
                      hintStyle: TextStyle(color: MyColors.prime, fontSize: 14),
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: MyColors.prime),
                      ),
                    ),
                  ),
                  space,
                  space,
                  const Text(
                    "Email Address",
                    style: TextStyle(fontSize: 17),
                  ),
                  TextFormField(
                    enableSuggestions: false,
                    cursorColor: MyColors.prime,
                    decoration: const InputDecoration(
                      hintText: "Email ",
                      hintStyle: TextStyle(color: MyColors.prime, fontSize: 14),
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: MyColors.prime),
                      ),
                    ),
                  ),
                  space,
                  space,
                  const Text(
                    "Subject",
                    style: TextStyle(fontSize: 17),
                  ),
                  TextFormField(
                    enableSuggestions: false,
                    cursorColor: MyColors.prime,
                    decoration: const InputDecoration(
                      hintText: "Subject",
                      hintStyle: TextStyle(color: MyColors.prime, fontSize: 14),
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: MyColors.prime),
                      ),
                    ),
                  ),
                  space,
                  space,
                  const Text(
                    "Message",
                    style: TextStyle(fontSize: 17),
                  ),
                  TextFormField(
                    maxLines: 5,
                    enableSuggestions: false,
                    cursorColor: MyColors.prime,
                    decoration: const InputDecoration(
                      hintText: "Message",
                      hintStyle: TextStyle(color: MyColors.prime, fontSize: 14),
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: MyColors.prime),
                      ),
                    ),
                  ),
                  space,
                  space,
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
                            "Send Message",
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
}
