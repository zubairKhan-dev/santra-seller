import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/Constants/my_colors.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/discovery_settings.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/notification_settings.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
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
                        horizontal: size.width * 0.23),
                    child: const Text(
                      "Settings",
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
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              children: [
                buildListTile(() {
                  Get.to(() => NotificationSettings());
                }, "assets/images/notification_icon.svg", "Notifications",
                    "assets/images/arrow_forward.svg"),
                buildListTile(() {
                  Get.to(() => DicscoverySettings());
                }, "assets/images/payment_methods_icon.svg",
                    "Discovery Settings", "assets/images/arrow_forward.svg"),
                buildListTile(() {}, "assets/images/logout_icon.svg", "Logout",
                    "assets/images/arrow_forward.svg")
              ],
            ),
          )
        ],
      ),
    ));
  }

  buildListTile(ontap, String leadingImg, String title, String trailingImg) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          ListTile(
            leading: SvgPicture.asset(
              leadingImg,
              color: MyColors.secondLite,
            ),
            title: Text(
              title,
              style: TextStyle(color: MyColors.secondLite),
            ),
            trailing: SvgPicture.asset(
              trailingImg,
              color: MyColors.secondLite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              thickness: 1.5,
              color: MyColors.prime,
            ),
          )
        ],
      ),
    );
  }
}
