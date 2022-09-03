import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './category_detail_screen.dart';

class ViewPromotions extends StatelessWidget {
  ViewPromotions({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'View Promotions',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.grey[300],
              iconTheme: IconThemeData(color: Colors.black),
            ),
            body: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CatergodyDetailScreen(),
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.height * 0.012),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Text("Promotion $index"),
                                trailing: SizedBox(
                                    width: 40,
                                    child: const Icon(Icons.arrow_forward_ios)),
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
