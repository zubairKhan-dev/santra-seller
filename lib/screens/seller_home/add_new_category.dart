import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/my_colors.dart';

class AddNewCAtegory extends StatefulWidget {
  AddNewCAtegory({key}) : super(key: key);
  int selectedIndex = 0;
  @override
  State<AddNewCAtegory> createState() => _AddNewCAtegoryState();
}

class _AddNewCAtegoryState extends State<AddNewCAtegory> {
  List<String> categoryList = ["Select Category", "Food", "Clothing", "Beauty"];
  String selectedCat = "Select Category";
  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedIconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: MyColors.prime,
        unselectedItemColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              activeIcon: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03, vertical: 2),
                child: Container(
                    height: 40,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.second,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/images/home_icon.svg",
                        color: MyColors.prime,
                      ),
                    )),
              ),
              icon: SvgPicture.asset(
                "assets/images/home_icon.svg",
                color: MyColors.second,
              ),
              label: "Logo"),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            activeIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.second,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/dashboard_icon.svg",
                      color: MyColors.prime,
                    ),
                  )),
            ),
            icon: Container(
              height: 40,
              child: SvgPicture.asset(
                "assets/images/dashboard_icon.svg",
                color: MyColors.second,
              ),
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            activeIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.second,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/user_icon.svg",
                      color: MyColors.prime,
                    ),
                  )),
            ),
            icon: SvgPicture.asset(
              "assets/images/user_icon.svg",
              color: MyColors.second,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.second,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/cart_icon.svg",
                      color: MyColors.prime,
                    ),
                  )),
            ),
            backgroundColor: Colors.black,
            icon: SvgPicture.asset(
              "assets/images/cart_icon.svg",
              color: MyColors.second,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            activeIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.second,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/notification_icon.svg",
                      color: MyColors.prime,
                    ),
                  )),
            ),
            icon: SvgPicture.asset(
              "assets/images/notification_icon.svg",
              color: MyColors.second,
            ),
            label: 'Notification',
          ),
        ],
        currentIndex: widget.selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      backgroundColor: MyColors.prime,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.05, horizontal: size.width * 0.05),
              decoration: const BoxDecoration(color: MyColors.second),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "assets/images/settings_icon.svg",
                          height: size.height * 0.025,
                        )),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/notification_icon_teal.svg",
                        height: size.height * 0.025,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.68,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.07,
                          vertical: size.height * 0.03),
                      child: const Text(
                        "Add New Category",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.07),
                      child: TextFormField(
                        // controller: searchController,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.prime),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.prime),
                          ),
                          labelText: "Category name",
                          labelStyle: TextStyle(color: MyColors.second),
                          fillColor: Colors.white,
                        ),
                        cursorColor: MyColors.prime,
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.07),
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: MyColors.prime))),
                        child: DropdownButton<String>(
                          value: selectedCat,
                          icon: Expanded(
                            child: Row(
                              children: const [
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.arrow_drop_down),
                                ),
                              ],
                            ),
                          ),
                          elevation: 16,
                          underline: const SizedBox(),
                          onChanged: (String newValue) {
                            setState(() {
                              selectedCat = newValue;
                              print(newValue);
                            });
                          },
                          items: categoryList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value.toString(),
                                style: const TextStyle(
                                  color: MyColors.second,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.07),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: MyColors.second,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0, vertical: size.height * 0.02),
                          child: const Text("Add Categories"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}