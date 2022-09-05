import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/add_new_category.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/bottom.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Constants/my_colors.dart';

class CatergodyDetailScreen extends StatelessWidget {
  const CatergodyDetailScreen({Key key}) : super(key: key);

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
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.01, vertical: size.height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        "Category 1",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      Get.to(() => AddNewCAtegory());
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: SvgPicture.asset(
                        "assets/images/add_icon.svg",
                        height: size.height * 0.03,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: size.height * 0.7,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SizedBox(
                              height: size.height * 0.13,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            "assets/images/auth_icon.png",
                                            // width: 40,
                                            // height: 40,
                                            fit: BoxFit.contain,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Product 1",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.70,
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/sales_graph_icon.svg'),
                                              const Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Text(
                                                    "Total sales 2000 AED"),
                                              ),
                                              const Spacer(),
                                              InkWell(
                                                onTap: () {},
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SvgPicture.asset(
                                                    "assets/images/arrow_forward.svg",
                                                    height: size.height * 0.02,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.04,
                                              width: size.width * 0.25,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: 3,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: Container(
                                                        child:
                                                            Icon(Icons.apple),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                            Text(
                                              "+ $index more customers",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * 0.9,
                            child: const Divider(
                              color: MyColors.prime,
                              thickness: 1.5,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}
