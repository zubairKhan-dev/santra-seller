import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/providers/seller_provider.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/bottom.dart';
import 'package:flutter_login_regis_provider/widgets/custom_dropdown.dart';
import 'package:flutter_login_regis_provider/widgets/loading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../Constants/my_colors.dart';
import 'package:flushbar/flushbar.dart';

class AddNewCAtegory extends StatefulWidget {
  AddNewCAtegory({Key key}) : super(key: key);
  int selectedIndex = 0;
  @override
  State<AddNewCAtegory> createState() => _AddNewCAtegoryState();
}

class _AddNewCAtegoryState extends State<AddNewCAtegory> {
  final formKey = GlobalKey<FormState>();
  List<String> categoryList = ["Select Category", "Food", "Clothing", "Beauty"];
  String selectedCat = "Select Category";

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  var category_name= '';
  var category_type= '';

  @override
  Widget build(BuildContext context) {
    SellerProvider seller = Provider.of<SellerProvider>(context);

    Size size = MediaQuery.of(context).size;

    //add category
    var addNewCategory = () async {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        seller.add_categories(category_name, category_type).then((response) {
          print(response);
          if (response['status']) {
            Flushbar(
              title: 'Success!',
              message: response['message'],
              duration: Duration(seconds: 3),
            ).show(context);
          } else {
            Flushbar(
              title: 'Fail!',
              message: response['messsage'],
              duration: Duration(seconds: 3),
            ).show(context);
          }
        });
      }
      else {
        Flushbar(
          title: 'Invalid form',
          message: 'Please complete the form properly',
          duration: Duration(seconds: 3),
        ).show(context);
      }
    };

    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Bottom(),
      backgroundColor: MyColors.prime,
      body: SingleChildScrollView(
          child: 
          Form(
            key: formKey,
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
                        validator: (value) =>
                            value.isEmpty ? 'Please enter category name' : null,
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
                        onChanged: ((value) => category_name=value),
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
                        child: 
                        CustomDropdown(null, 'Select category',categoryList, (val)=> category_type= val),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.07),
                      child: ElevatedButton(
                        onPressed: () {
                          addNewCategory();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: MyColors.second,
                        ),
                        child: seller.isLoading
                            ? Loading()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0,
                                    vertical: size.height * 0.02),
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
      )),
    ));
  }
}
