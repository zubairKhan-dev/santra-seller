import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/Constants/my_colors.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/bottom.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class NotificationSettings extends StatefulWidget {
  NotificationSettings({Key key}) : super(key: key);

  @override
  State<NotificationSettings> createState() => _NotificationSettings();
}

class _NotificationSettings extends State<NotificationSettings> {
  bool pushMessagesFromCustomers = true;
  bool pushMessagesFromSantra = true;
  bool productAnnouncement = true;
  bool recommendation = true;
  bool textMessagesFromSantra = true;
  bool accountActivity = true;
  bool whatsappNotifications = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Bottom(),
      backgroundColor: MyColors.prime,
      body: Column(
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
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.015,
                        horizontal: size.width * 0.15),
                    child: const Text(
                      "Discovery Settings",
                      style: TextStyle(
                        fontSize: 20,
                        color: MyColors.second,
                      ),
                    )),
              ],
            ),
          ),
          Container(
            height: size.height * 0.7,
            width: size.width * 1,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02, vertical: size.height * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Push Notifications",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: MyColors.secondLite, fontSize: 20),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Messages",
                      style:
                          TextStyle(fontSize: 19, color: MyColors.secondLite),
                    ),
                    subtitle: Text(
                      "From Customers",
                      style:
                          TextStyle(fontSize: 13, color: MyColors.secondLite),
                    ),
                    trailing: Container(
                      width: size.width * 0.25,
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: FlutterSwitch(
                        activeColor: MyColors.prime,
                        width: size.width * 0.25,
                        activeText: "On",
                        activeTextColor: Colors.white,
                        valueFontSize: 10,
                        showOnOff: true,
                        inactiveTextColor: Colors.white,
                        inactiveText: "Off",
                        value: pushMessagesFromCustomers,
                        onToggle: (val) {
                          setState(() {
                            pushMessagesFromCustomers = val;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: size.height * 0.01,
                      color: MyColors.prime,
                      thickness: 1,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Messages",
                      style:
                          TextStyle(fontSize: 19, color: MyColors.secondLite),
                    ),
                    subtitle: Text(
                      "From Santra",
                      style:
                          TextStyle(fontSize: 13, color: MyColors.secondLite),
                    ),
                    trailing: Container(
                      width: size.width * 0.25,
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: FlutterSwitch(
                        activeColor: MyColors.prime,
                        width: size.width * 0.25,
                        activeText: "On",
                        activeTextColor: Colors.white,
                        valueFontSize: 10,
                        showOnOff: true,
                        inactiveTextColor: Colors.white,
                        inactiveText: "Off",
                        value: pushMessagesFromSantra,
                        onToggle: (val) {
                          setState(() {
                            pushMessagesFromSantra = val;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: size.height * 0.01,
                      color: MyColors.prime,
                      thickness: 1,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Product Announcement",
                      style:
                          TextStyle(fontSize: 19, color: MyColors.secondLite),
                    ),
                    subtitle: Text(
                      "Feature update and more",
                      style:
                          TextStyle(fontSize: 13, color: MyColors.secondLite),
                    ),
                    trailing: Container(
                      width: size.width * 0.25,
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: FlutterSwitch(
                        activeColor: MyColors.prime,
                        width: size.width * 0.25,
                        activeText: "On",
                        activeTextColor: Colors.white,
                        valueFontSize: 10,
                        showOnOff: true,
                        inactiveTextColor: Colors.white,
                        inactiveText: "Off",
                        value: productAnnouncement,
                        onToggle: (val) {
                          setState(() {
                            productAnnouncement = val;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: size.height * 0.01,
                      color: MyColors.prime,
                      thickness: 1,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Recommendations",
                      style:
                          TextStyle(fontSize: 19, color: MyColors.secondLite),
                    ),
                    subtitle: Text(
                      "Ideas and price alerts",
                      style:
                          TextStyle(fontSize: 13, color: MyColors.secondLite),
                    ),
                    trailing: Container(
                      width: size.width * 0.25,
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: FlutterSwitch(
                        activeColor: MyColors.prime,
                        width: size.width * 0.25,
                        activeText: "On",
                        activeTextColor: Colors.white,
                        valueFontSize: 10,
                        showOnOff: true,
                        inactiveTextColor: Colors.white,
                        inactiveText: "Off",
                        value: recommendation,
                        onToggle: (val) {
                          setState(() {
                            recommendation = val;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: size.height * 0.01,
                      color: MyColors.prime,
                      thickness: 1,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Text Message Notifications",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: MyColors.secondLite, fontSize: 22),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Messages",
                      style:
                          TextStyle(fontSize: 19, color: MyColors.secondLite),
                    ),
                    subtitle: Text(
                      "From Santra",
                      style:
                          TextStyle(fontSize: 13, color: MyColors.secondLite),
                    ),
                    trailing: Container(
                      width: size.width * 0.25,
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: FlutterSwitch(
                        activeColor: MyColors.prime,
                        width: size.width * 0.25,
                        activeText: "On",
                        activeTextColor: Colors.white,
                        valueFontSize: 10,
                        showOnOff: true,
                        inactiveTextColor: Colors.white,
                        inactiveText: "Off",
                        value: textMessagesFromSantra,
                        onToggle: (val) {
                          setState(() {
                            textMessagesFromSantra = val;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: size.height * 0.01,
                      color: MyColors.prime,
                      thickness: 1,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Account Activity",
                      style:
                          TextStyle(fontSize: 19, color: MyColors.secondLite),
                    ),
                    subtitle: Text(
                      "Changes made to your account",
                      style:
                          TextStyle(fontSize: 13, color: MyColors.secondLite),
                    ),
                    trailing: Container(
                      width: size.width * 0.25,
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: FlutterSwitch(
                        activeColor: MyColors.prime,
                        width: size.width * 0.25,
                        activeText: "On",
                        activeTextColor: Colors.white,
                        valueFontSize: 10,
                        showOnOff: true,
                        inactiveTextColor: Colors.white,
                        inactiveText: "Off",
                        value: accountActivity,
                        onToggle: (val) {
                          setState(() {
                            accountActivity = val;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: size.height * 0.01,
                      color: MyColors.prime,
                      thickness: 1,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Social Notifications",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: MyColors.secondLite, fontSize: 20),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "WhatsApp Notifications",
                      style:
                          TextStyle(fontSize: 19, color: MyColors.secondLite),
                    ),
                    subtitle: Text(
                      "From Santra",
                      style:
                          TextStyle(fontSize: 13, color: MyColors.secondLite),
                    ),
                    trailing: Container(
                      width: size.width * 0.25,
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: FlutterSwitch(
                        activeColor: MyColors.prime,
                        width: size.width * 0.25,
                        activeText: "On",
                        activeTextColor: Colors.white,
                        valueFontSize: 10,
                        showOnOff: true,
                        inactiveTextColor: Colors.white,
                        inactiveText: "Off",
                        value: whatsappNotifications,
                        onToggle: (val) {
                          setState(() {
                            whatsappNotifications = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
