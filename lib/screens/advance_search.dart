import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/advanced_results.dart';
import 'package:flutter_login_regis_provider/utility/widgets.dart';
import 'package:flutter_login_regis_provider/widgets/custom_dropdown.dart';
import '../constants/my_colors.dart';
import '../widgets/search_bar.dart';
import '../screens/bottom.dart';

class AdvacedSearch extends StatefulWidget {
  const AdvacedSearch({Key key}) : super(key: key);

  @override
  State<AdvacedSearch> createState() => _AdvacedSearchState();
}

class _AdvacedSearchState extends State<AdvacedSearch> {
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
                      color: MyColors.prime,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    height: size.height * 0.75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                      ],
                    )),
                Container(
                  width: double.infinity,
                  height: size.height * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(size.height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Advance Search',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: MyColors.primary),
                          ),
                        ),
                        Row(children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: CustomDropdown(
                                    null, 'Select Category', list)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(10),
                                child: CustomDropdown(
                                    null, 'Select Reviews', list)),
                          ),
                        ]),
                        Padding(
                          padding: EdgeInsets.all(size.height *0.05),
                          child: longButtons('Search', () {
                            Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdvancedResults()
                      ));
                          }),
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
