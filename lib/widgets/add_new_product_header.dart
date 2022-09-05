import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Constants/my_colors.dart';

class AddNewProductHeader extends StatelessWidget {
  const AddNewProductHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.05,
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  "assets/images/arrow_back.svg",
                  color: MyColors.second,
                  height: MediaQuery.of(context).size.height * 0.03,
                )),
            Text(
              "Add New Product",
              style: TextStyle(fontSize: 20),
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/images/notification_icon_teal.svg",
                color: MyColors.second,
                height: MediaQuery.of(context).size.height * 0.025,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
