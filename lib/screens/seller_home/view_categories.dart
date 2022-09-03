import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './category_detail_screen.dart';

class ViewCategories extends StatelessWidget {
  const ViewCategories({key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: (const Icon(Icons.arrow_back_ios)),
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.2,
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
        ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () { Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CatergodyDetailScreen(),
                            ));},
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.012),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text("Category $index"),
                        trailing: SizedBox(
                          width: 40,
                          child: Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.red, shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "$index",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios)
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
      ],
    )));
  }
}
