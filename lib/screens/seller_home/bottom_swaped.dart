import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constants/my_colors.dart';

class BottomSwaped extends StatefulWidget {
  BottomSwaped({Key key}) : super(key: key);
  int selectedIndex = 0;
  @override
  State<BottomSwaped> createState() => _BottomSwaped();
}

class _BottomSwaped extends State<BottomSwaped> {
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
      selectedIconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: MyColors.secondLite,
      unselectedItemColor: Colors.white,
      //selectedLabelStyle: TextStyle(color: Colors.white),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: 2),
              child: Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/home_icon.svg",
                      color: MyColors.secondLite,
                    ),
                  )),
            ),
            icon: SvgPicture.asset(
              "assets/images/home_icon.svg",
              color: MyColors.prime,
            ),
            label: "Home"),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          activeIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/images/dashboard_icon.svg",
                    color: MyColors.secondLite,
                  ),
                )),
          ),
          icon: Container(
            height: 40,
            child: SvgPicture.asset(
              "assets/images/dashboard_icon.svg",
              color: MyColors.prime,
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
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/images/user_icon.svg",
                    color: MyColors.secondLite,
                  ),
                )),
          ),
          icon: SvgPicture.asset(
            "assets/images/user_icon.svg",
            color: MyColors.prime,
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
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    "assets/images/cart_icon.svg",
                    color: MyColors.secondLite,
                  ),
                )),
          ),
          backgroundColor: Colors.white,
          icon: SvgPicture.asset(
            "assets/images/cart_icon.svg",
            color: MyColors.prime,
          ),
          label: 'Orders',
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
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/images/notification_icon.svg",
                    color: MyColors.secondLite,
                  ),
                )),
          ),
          icon: SvgPicture.asset(
            "assets/images/notification_icon.svg",
            color: MyColors.prime,
          ),
          label: 'Notification',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.white,
      onTap: _onItemTapped,
    );
  }
}
