import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatergodyDetailScreen extends StatelessWidget {
  const CatergodyDetailScreen({ key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    //onPressed: () => Get.back(),
                    icon: (const Icon(Icons.arrow_back_ios)),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.015),
                      child: const Text(
                        "Category 1",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  IconButton(
                    onPressed: () {},
                    icon: (const Icon(Icons.add)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(3.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
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
                                      Text(
                                        "Product $index",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87),
                                      ),
                                      Text(
                                        "$index",
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                const VerticalDivider(
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: size.width * 0.7,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Category 1",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.70,
                                        child: Row(
                                          children: [
                                            const Icon(Icons.bar_chart,
                                                color: Colors.grey),
                                            const Text("Total sales 2000 AED"),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                  Icons.arrow_forward_ios),
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
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black)),
                                                      child: Icon(Icons.apple),
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
                        const Divider(
                          color: Colors.grey,
                          thickness: 1.5,
                        )
                      ],
                    );
                  })),
        ],
      ),
    ));
  }
}
