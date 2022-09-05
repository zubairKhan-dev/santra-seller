import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/advance_search.dart';
import 'package:flutter_login_regis_provider/screens/bottom.dart';
import 'package:flutter_login_regis_provider/widgets/search_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/my_colors.dart';
import 'dart:math' as math;

class Search extends StatefulWidget {
  Search({key}) : super(key: key);
  int selectedIndex = 0;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> categoryList = ["Select Category", "Food", "Clothing", "Beauty"];
  String selectedCat = "Select Category";
  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

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
                        Card(
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var item in list)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: size.height * 0.05,
                                    width: size.height * 0.05,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                size.height * 0.01))),
                                  ),
                                ),
                            ],
                          ),
                        )
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
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [],
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
