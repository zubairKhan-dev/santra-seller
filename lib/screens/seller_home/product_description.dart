import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDescription extends StatefulWidget {
  ProductDescription({ key}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescription();
}

class _ProductDescription extends State<ProductDescription> {
  List<String> categoryList = ["Select Category", "Food", "Clothing", "Beauty"];
  String selectedCat = "Select Category";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.settings),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: TextFormField(
                        // controller: searchController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          labelText: "Search products",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.shopping_cart)
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "3D view",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            height: size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/auth_icon.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "100AED",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.black,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Description",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: size.height * 0.1,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Product description will go here"),
            ),
          ),
          Container(
            color: Colors.black,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Reviews",
                style: TextStyle(color: Colors.white),
              ),
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
                        title: RatingBar.builder(
                          ignoreGestures: true,
                          itemSize: 20,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
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
          Container(
            color: Colors.black,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Total Score",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            height: size.height * 0.2,
            alignment: Alignment.center,
            child: const Text("3.5", textScaleFactor: 10),
          ),
          Container(
            color: Colors.black,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Similar products",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * 0.1,
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
                      child: Image.asset("assets/images/kfc.png"),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Add to cart"),
            ),
          )
        ]),
      ),
    ));
  }
}
