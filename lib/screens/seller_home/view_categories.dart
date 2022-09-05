import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Constants/my_colors.dart';
import 'bottom.dart';
import 'category_detail_screen.dart';

class ViewCategories extends StatelessWidget {
  const ViewCategories({Key key}) : super(key: key);

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
                        horizontal: size.width * 0.01,
                        vertical: size.height * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05),
                            child: SvgPicture.asset(
                              "assets/images/arrow_back.svg",
                              height: size.height * 0.03,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.15,
                                  vertical: size.height * 0.015),
                              child: const Text(
                                "View Categories",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
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
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Get.to(() => CatergodyDetailScreen()),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                                vertical: size.height * 0.012),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Text(
                                    "Category $index",
                                    style: TextStyle(
                                        color: MyColors.second, fontSize: 20),
                                  ),
                                  trailing: SizedBox(
                                    width: 120,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: MyColors.second,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Text(
                                              "$index",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Products",
                                            style: TextStyle(
                                                color: MyColors.second),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                            "assets/images/arrow_forward.svg",
                                            color: MyColors.prime,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                // Row(
                                //   children: [
                                //     Text("Category $index"),
                                //     Spacer(),
                                //     Container(
                                //       decoration: BoxDecoration(
                                //           color: Colors.red, shape: BoxShape.circle),
                                //       child: Padding(
                                //         padding: const EdgeInsets.all(4.0),
                                //         child: Text("$index"),
                                //       ),
                                //     ),
                                //     Icon(Icons.arrow_forward_ios)
                                //   ],
                                // ),
                                Divider(
                                  height: 10,
                                  thickness: 1,
                                  color: Colors.black,
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
