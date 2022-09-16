import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/widgets/loading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../providers/seller_provider.dart';
import 'package:provider/provider.dart';
import '../../Constants/my_colors.dart';
import 'bottom.dart';

class ProductDescription extends StatefulWidget {
  ProductDescription({Key key}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescription();
}

class _ProductDescription extends State<ProductDescription> {
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SellerProvider seller =
          Provider.of<SellerProvider>(context, listen: false);
      seller.view_product_details();
    });
  }

  @override
  Widget build(BuildContext context) {
    SellerProvider seller = Provider.of<SellerProvider>(context);
    Size size = MediaQuery.of(context).size;

    var st = seller.product_details[0]['product_image_1'];
    var sub = st.substring(3, st.length);

    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Bottom(),
      body:
      seller.isLoading
            ? Container(
              alignment: Alignment.center,
                child: Loading(),
              )
            : 
       SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Container(
                  height: size.height * 0.4,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          'http://api.santra.ae/' + sub,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              seller.product_details[0]['product_name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: MyColors.prime,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  seller.product_details[0]['product_price'],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: const Text(
                    "Description",
                    style: TextStyle(color: MyColors.secondLite, fontSize: 22),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Divider(
                    color: MyColors.prime,
                    thickness: 1.5,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: size.height * 0.1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      seller.product_details[0]['product_description'],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: const Text(
                    "Reviews",
                    style: TextStyle(color: MyColors.secondLite, fontSize: 22),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Divider(
                    color: MyColors.prime,
                    thickness: 1.5,
                  ),
                ),
                Container(
                  height: size.height * 0.3,
                  child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Image.asset("assets/images/kfc.png"),
                                  )),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RatingBar.builder(
                                    ignoreGestures: true,
                                    itemSize: 20,
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    unratedColor: MyColors.prime,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: MyColors.second,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Text(
                                    "3/5",
                                    style: TextStyle(
                                        color: MyColors.secondLite,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                              subtitle: const Text("Review is Important"),
                            ),
                            const Divider(
                              thickness: 1.5,
                            )
                          ],
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: Text(
                    "Total Score",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: MyColors.secondLite, fontSize: 22),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.2,
                  ),
                  child: const Divider(
                    color: MyColors.prime,
                    thickness: 1.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: MyColors.secondLite),
                    height: size.height * 0.18,
                    alignment: Alignment.center,
                    child: RichText(
                      text: const TextSpan(
                        text: '3',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                              text: '/5',
                              style: TextStyle(color: MyColors.prime)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: const Text(
                    "Similar products",
                    style: TextStyle(color: MyColors.secondLite, fontSize: 22),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Divider(
                    color: MyColors.prime,
                    thickness: 1.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height * 0.2,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Image.asset(
                              "assets/images/kfc.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.1, vertical: 15),
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
                          "Add To Cart",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
      ),
    ));
  }
}
