import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/category_detail_screen.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/contact_santra.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/index.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/order_accepted.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/reject_order.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constants/my_colors.dart';

class Bottom extends StatefulWidget {
  Bottom({Key key}) : super(key: key);
  int selectedIndex = 0;
  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  static List<Widget> widgetOptions = <Widget>[
    SellerHome(),
    ContactSantra(),
    CatergodyDetailScreen(),
    OrderAccepted(),
    RejectOrder(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedIconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: MyColors.prime,
      unselectedItemColor: Colors.black,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: 2),
              child: Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.second,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/home_icon.svg",
                      color: MyColors.prime,
                    ),
                  )),
            ),
            icon: SvgPicture.asset(
              "assets/images/home_icon.svg",
              color: MyColors.second,
            ),
            label: "Home"),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          activeIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.second,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/images/dashboard_icon.svg",
                    color: MyColors.prime,
                  ),
                )),
          ),
          icon: Container(
            height: 40,
            child: SvgPicture.asset(
              "assets/images/dashboard_icon.svg",
              color: MyColors.second,
            ),
          ),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          activeIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.second,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/images/user_icon.svg",
                    color: MyColors.prime,
                  ),
                )),
          ),
          icon: SvgPicture.asset(
            "assets/images/user_icon.svg",
            color: MyColors.second,
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.second,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/images/cart_icon.svg",
                    color: MyColors.prime,
                  ),
                )),
          ),
          backgroundColor: Colors.black,
          icon: SvgPicture.asset(
            "assets/images/cart_icon.svg",
            color: MyColors.second,
          ),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          activeIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.second,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/images/notification_icon.svg",
                    color: MyColors.prime,
                  ),
                )),
          ),
          icon: SvgPicture.asset(
            "assets/images/notification_icon.svg",
            color: MyColors.second,
          ),
          label: 'Notification',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }
}
