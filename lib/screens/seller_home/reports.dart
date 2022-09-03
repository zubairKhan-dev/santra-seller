import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/report_detail.dart';
import 'package:get/get.dart';
import './category_detail_screen.dart';

class Reports extends StatelessWidget {
  Reports({key}) : super(key: key);

  final List<String> entries = <String>['Orders', 'Revenue', 'Daily', 'Weekly', 'Monthly', 'Sales', 'Customers'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Row(
            children: [
              Icon(Icons.data_exploration),
              SizedBox(width: 10,),
              Text('Reports'),
            ],
          ),
          backgroundColor: Colors.grey,
          ),
            body: Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: entries.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () { Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportDetail(),
                            ));},
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.012),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text(entries[index]),
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
