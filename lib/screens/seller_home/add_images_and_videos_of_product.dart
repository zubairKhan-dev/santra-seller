import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/bottom.dart';
import 'package:flutter_login_regis_provider/widgets/add_new_product_header.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Constants/my_colors.dart';

class AddImageAndVideosOfProduct extends StatefulWidget {
  const AddImageAndVideosOfProduct({Key key}) : super(key: key);

  @override
  State<AddImageAndVideosOfProduct> createState() =>
      _AddImageAndVideosOfProductState();
}

class _AddImageAndVideosOfProductState
    extends State<AddImageAndVideosOfProduct> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Bottom(),
      backgroundColor: MyColors.prime,
      body: Container(
        child: Column(
          children: [
            AddNewProductHeader(),
            Container(
                height: size.height * 0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Add Images",
                              style: TextStyle(
                                  fontSize: 20, color: MyColors.secondLite),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/add_pictures_icon.svg",
                                    color: MyColors.secondLite,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: MyColors.prime)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Add Pictures",
                                              style: TextStyle(
                                                color: MyColors.second,
                                              )),
                                          Spacer(),
                                          Container(
                                            width: size.width * 0.18,
                                            child: Row(
                                              children: [
                                                Text("Upload",
                                                    style: TextStyle(
                                                      color: MyColors.second,
                                                    )),
                                                Expanded(
                                                  child: SvgPicture.asset(
                                                    "assets/images/arrow_up_icon.svg",
                                                    height: 10,
                                                    color: MyColors.secondLite,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.12),
                            child: Text(
                              "You can upload upto 5 Images",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 100,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: Image.asset("assets/images/kfc.png"),
                                  );
                                }),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.1),
                            child: Divider(
                              height: size.height * 0.1,
                              color: MyColors.prime,
                              thickness: 1.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Add Videos",
                              style: TextStyle(
                                  fontSize: 20, color: MyColors.secondLite),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/add_video_icon.svg",
                                    color: MyColors.secondLite,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: MyColors.prime)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Add Videos",
                                              style: TextStyle(
                                                color: MyColors.second,
                                              )),
                                          Spacer(),
                                          Container(
                                            width: size.width * 0.18,
                                            child: Row(
                                              children: [
                                                Text("Upload",
                                                    style: TextStyle(
                                                      color: MyColors.second,
                                                    )),
                                                Expanded(
                                                  child: SvgPicture.asset(
                                                    "assets/images/arrow_up_icon.svg",
                                                    height: 10,
                                                    color: MyColors.secondLite,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.12),
                            child: Text(
                              "You can upload upto 3 Videos",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
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
                                        "Add Product",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  )))
                        ])))
          ],
        ),
      ),
    ));
  }
}
