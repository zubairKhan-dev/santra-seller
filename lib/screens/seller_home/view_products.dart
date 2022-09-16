import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/product_description.dart';
import 'package:flutter_login_regis_provider/widgets/loading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/my_colors.dart';
import '../../providers/seller_provider.dart';
import 'package:provider/provider.dart';

class ViewProducts extends StatefulWidget {
  ViewProducts({key}) : super(key: key);

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  var list = ["1", "2", "3", "4", "5", "6", "7", "8"];

  // view products funtion calling
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SellerProvider seller =
          Provider.of<SellerProvider>(context, listen: false);
      seller.view_products();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SellerProvider seller = Provider.of<SellerProvider>(context);

    return SafeArea(
      child: Scaffold(
          // bottomNavigationBar: Bottom(),
          backgroundColor: MyColors.prime,
          body: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.05,
                    horizontal: size.width * 0.05),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset(
                            "assets/images/arrow_back.svg",
                            height: size.height * 0.03,
                            color: Colors.white,
                          )),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: SizedBox(
                            height: size.height * 0.05,
                            child: TextFormField(
                              // controller: searchController,
                              decoration: InputDecoration(
                                isDense: true,
                                prefixIcon: const Icon(Icons.search),
                                hintText: "Search products",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: size.height * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Add Product",
                                  style: TextStyle(
                                      color: MyColors.secondLite, fontSize: 17),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset(
                                  "assets/images/plus_blue_icon.svg",
                                  height: size.height * 0.02,
                                ),
                              ]),
                        ),
                        Container(
                            height: size.height * 0.78,
                            child: seller.isLoading
                                ? Loading()
                                : seller.products_list.length > 0
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: seller.products_list.length,
                                        itemBuilder: (context, index) {
                                          var str = seller.products_list[index]
                                              ['product_image_1'];
                                          var sub =
                                              str.substring(3, str.length);
                                          return Column(
                                            children: [
                                              GestureDetector(
                                                onTap: (() => Get.to(() =>
                                                    ProductDescription())),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      height: size.height * 0.1,
                                                      child: Image.network(
                                                        'http://api.santra.ae/' +
                                                            sub,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Row(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              5.0),
                                                                      child:
                                                                          RichText(
                                                                        text:
                                                                            TextSpan(
                                                                          text: seller.products_list[index]
                                                                              [
                                                                              'product_name'],
                                                                          style:
                                                                              TextStyle(color: MyColors.second),
                                                                          children: const <
                                                                              TextSpan>[
                                                                            TextSpan(
                                                                              text: '/ Category 1',
                                                                              style: TextStyle(color: MyColors.prime),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              5.0),
                                                                      child:
                                                                          Container(
                                                                        width: size.width *
                                                                            0.65,
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                SvgPicture.asset("assets/images/sales_graph_icon.svg"),
                                                                                SizedBox(
                                                                                  width: 2,
                                                                                ),
                                                                                Text(
                                                                                  'Total Sales ' + ' 2000 AED',
                                                                                  style: TextStyle(color: Color.fromARGB(255, 114, 113, 113)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SvgPicture.asset("assets/images/arrow_forward.svg")
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              5.0),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Icon(Icons
                                                                              .add_card),
                                                                          SizedBox(
                                                                            width:
                                                                                3,
                                                                          ),
                                                                          Icon(Icons
                                                                              .add_a_photo_outlined),
                                                                          SizedBox(
                                                                            width:
                                                                                3,
                                                                          ),
                                                                          Icon(Icons
                                                                              .emoji_emotions),
                                                                          SizedBox(
                                                                            width:
                                                                                3,
                                                                          ),
                                                                          Icon(Icons
                                                                              .access_alarm),
                                                                          Text(
                                                                            '+ 3 more Customers',
                                                                            style:
                                                                                TextStyle(color: Colors.grey),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    index == 2
                                                                        ? Container(
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(10)),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                                                              child: Row(
                                                                                children: [
                                                                                  Text(
                                                                                    "Rejected",
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.close,
                                                                                    size: 15,
                                                                                    color: Colors.white,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          )
                                                                        : Container(
                                                                            decoration:
                                                                                BoxDecoration(color: MyColors.secondLite, borderRadius: BorderRadius.circular(10)),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                                                              child: Row(
                                                                                children: [
                                                                                  Text(
                                                                                    "Accepted",
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.done,
                                                                                    size: 15,
                                                                                    color: Colors.white,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: size.width * 0.9,
                                                child: Divider(
                                                  color: MyColors.prime,
                                                  thickness: 1.5,
                                                ),
                                              )
                                            ],
                                          );
                                        })
                                    : Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text('No Products Found'),
                              ),),
                      ],
                    ),
                  )),
            ],
          ))),
    );
  }
}
