import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'bottom.dart';
import '../constants/my_colors.dart';
import '../widgets/search_bar.dart';

class AdvancedResults extends StatefulWidget {
  const AdvancedResults({Key key}) : super(key: key);

  @override
  State<AdvancedResults> createState() => _AdvancedResultsState();
}

class _AdvancedResultsState extends State<AdvancedResults> {
  var list = ['1', '2', '3', '4'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Bottom(),
      backgroundColor: MyColors.second,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.025,
                  horizontal: size.width * 0.025),
              decoration: const BoxDecoration(color: MyColors.second),
              child: Padding(
                  padding: const EdgeInsets.all(8.0), child: SearchBar()),
            ),
            Stack(
              children: [
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(size.height * 0.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFECECEC),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    height: size.height * 0.725,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1,
                              vertical: size.height * 0.025),
                          child: Card(
                              elevation: 5,
                              color: MyColors.prime,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(15),
                                alignment: Alignment.center,
                                child: Text(
                                  'Categories',
                                  style: TextStyle(
                                      color: MyColors.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
                        ),
                        SingleChildScrollView(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var item in list)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: size.height * 0.07,
                                    width: size.height * 0.07,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                size.height * 0.01))),
                                  ),
                                ),
                            ],
                          ),
                        )),
                      ],
                    )),
                Container(
                  width: double.infinity,
                  height: size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(size.height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Results',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: MyColors.primary),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1,
                              vertical: size.height * 0.025),
                          child: Card(
                              elevation: 5,
                              color: MyColors.prime,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(15),
                                alignment: Alignment.center,
                                child: Text(
                                  'Products',
                                  style: TextStyle(
                                      color: MyColors.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (var item in list)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: size.height * 0.07,
                                      width: size.height * 0.07,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  size.height * 0.01))),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (var item in list)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: size.height * 0.07,
                                      width: size.height * 0.07,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  size.height * 0.01))),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
