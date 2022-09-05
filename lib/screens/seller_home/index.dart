import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/Constants/my_colors.dart';
import 'package:flutter_login_regis_provider/screens/search.dart';
import './new_manual_order.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/add_new_category.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/add_product.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/new_promotion.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/reports.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/settings.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/view_categories.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/view_products.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/view_promotions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import './all_orders.dart';

import 'bottom_swaped.dart';

class SellerHome extends StatefulWidget {
  SellerHome({Key key}) : super(key: key);
  int selectedIndex = 0;
  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Color(0xFF1E1E50), //change your color here
              ),
              backgroundColor: Color(0xFFE6F2EB),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(),
                        ));
                  },
                ),
                IconButton(icon: Icon(Icons.settings), onPressed: () {}),
              ],
            ),
            bottomNavigationBar: BottomSwaped(),
            body: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Order Management',
                          style: TextStyle(
                            color: MyColors.secondLite,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          containerBuilder(size, () {
                            Get.to(() => AllOrders());
                          }, "assets/images/cart_icon.svg", "Orders"),
                          SizedBox(
                            width: 10,
                          ),
                          containerBuilder(size, () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    content: Column(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Get.to(() => NewManualOrder());
                                            },
                                            child: Text(
                                              "New Order",
                                              style: TextStyle(
                                                  color: MyColors.secondLite),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Get.to(() => AllOrders());
                                            },
                                            child: Text(
                                              "All Orders",
                                              style: TextStyle(
                                                  color: MyColors.secondLite),
                                            ))
                                      ],
                                    ),
                                  );
                                });

                            // Get.to(() => NewOrderRecieved());
                          }, "assets/images/manual_order_icon.svg",
                              "Manual Order"),
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      Divider(
                        thickness: 1.5,
                        color: MyColors.prime,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Product & Categories',
                          style: TextStyle(
                            color: MyColors.secondLite,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          containerBuilder(size, () {
                            Get.to(() => AddNewCAtegory());
                          }, "assets/images/add_categories_icon.svg",
                              "Add Categories"),
                          SizedBox(
                            width: 10,
                          ),
                          containerBuilder(size, () {
                            Get.to(() => ViewCategories());
                          }, "assets/images/view_categories_icon.svg",
                              "View Categories"),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          containerBuilder(size, () {
                            Get.to(() => AddProduct());
                          }, "assets/images/add_product_icon.svg",
                              "Add Products"),
                          SizedBox(
                            width: 10,
                          ),
                          containerBuilder(size, () {
                            Get.to(() => ViewProducts());
                          }, "assets/images/view_products_icon.svg",
                              "View Products"),
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      Divider(
                        thickness: 1.5,
                        color: MyColors.prime,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Promotions',
                          style: TextStyle(
                            color: MyColors.secondLite,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          containerBuilder(size, () {
                            Get.to(() => NewPromotion());
                          }, "assets/images/add_promotion_icon.svg",
                              "Add promotions"),
                          SizedBox(
                            width: 10,
                          ),
                          containerBuilder(size, () {
                            Get.to(() => ViewPromotions());
                          }, "assets/images/view_promotions_icon.svg",
                              "View Promotions"),
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      Divider(
                        thickness: 1.5,
                        color: MyColors.prime,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Payments & Reports',
                          style: TextStyle(
                            color: MyColors.secondLite,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          containerBuilder(size, () {},
                              "assets/images/wallet_icon.svg", "Wallet"),
                          SizedBox(
                            width: 10,
                          ),
                          containerBuilder(size, () {
                            Get.to(() => Reports());
                          }, "assets/images/sales_graph_icon.svg", "Reports"),
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      Divider(
                        thickness: 1.5,
                        color: MyColors.prime,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Settings & Notifications',
                          style: TextStyle(
                            color: MyColors.secondLite,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          containerBuilder(size, () {
                            Get.to(() => Settings());
                          }, "assets/images/settings_horizontal_icon.svg",
                              "Settings"),
                          SizedBox(
                            width: 10,
                          ),
                          containerBuilder(
                              size,
                              () {},
                              "assets/images/notification_icon.svg",
                              "Notifications"),
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      Divider(
                        thickness: 1.5,
                        color: MyColors.prime,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Reviews & Messages',
                          style: TextStyle(
                            color: MyColors.secondLite,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          containerBuilder(size, () {},
                              "assets/images/star_icon.svg", "Reviews"),
                          SizedBox(
                            width: 10,
                          ),
                          containerBuilder(size, () {},
                              "assets/images/message_icon.svg", "Messages"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}

containerBuilder(size, ontap, String image, String title) {
  return Expanded(
    child: InkWell(
      onTap: ontap,
      child: Container(
          decoration: BoxDecoration(
              color: MyColors.prime, borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SvgPicture.asset(
                image,
                color: Colors.white,
                height: size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  title,
                  style: TextStyle(color: MyColors.secondLite, fontSize: 17),
                ),
              )
            ],
          )),
    ),
  );
}
