import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/Constants/my_colors.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/bottom.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/report_detail.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import './category_detail_screen.dart';

class Reports extends StatelessWidget {
  Reports({key}) : super(key: key);

  final List<String> entries = <String>[
    'Orders',
    'Revenue',
    'Daily',
    'Weekly',
    'Monthly',
    'Sales',
    'Customers'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: Bottom(),
            backgroundColor: MyColors.prime,
            body: Column(
              children: [
                Container(
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
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height * 0.03,
                            )),
                        Text(
                          "Reports",
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
                ),
                Container(
                  height: size.height * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: entries.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReportDetail(),
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                                vertical: size.height * 0.012),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Text(entries[index]),
                                  trailing: SizedBox(
                                    width: size.width * 0.15,
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              "$index",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                            "assets/images/arrow_forward.svg",
                                            color: MyColors.second,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 10,
                                  thickness: 1,
                                  color: MyColors.prime,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )));
  }
}
