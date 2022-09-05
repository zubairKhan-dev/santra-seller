import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/add_product_after_selecting_category.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/bottom.dart';
import 'package:flutter_login_regis_provider/widgets/add_new_product_header.dart';
import 'package:flutter_login_regis_provider/widgets/custom_dropdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Constants/my_colors.dart';
import '../../widgets/input_decoration.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var _checkbox = true;
  var _category = 'Global Options';

  final List _categories = ['Food', 'Clothing', 'Beauty', 'Global Options'];

  Widget renderCategoryItem() {
    // if (_category == 'Global Options')
    //return

    // Container(
    //   width: double.infinity,
    //   padding: EdgeInsets.all(10),
    //   color: Colors.grey,
    //   child: Text(
    //     'Add Images',
    //     style: TextStyle(color: Colors.black),
    //   ),
    // ),
    // SizedBox(
    //   height: 20,
    // ),
    // Container(
    //   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //   child: TextFormField(
    //     autofocus: false,
    //     decoration: customInputDecoration(
    //         "Add Pictures", Icons.picture_in_picture),
    //   ),
    // ),
    // Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: Text(
    //     'You can add upto 3 pictures',
    //     style: TextStyle(color: Colors.red),
    //   ),
    // ),
    // Container(
    //   padding: EdgeInsets.all(10),
    //   child: Row(
    //     children: [
    //       for (var item in _categories)
    //         Padding(
    //           padding: const EdgeInsets.symmetric(
    //               vertical: 10, horizontal: 10),
    //           child: Icon(
    //             Icons.image,
    //             size: 48,
    //           ),
    //         ),
    //     ],
    //   ),
    // ),
    // SizedBox(
    //   height: 20,
    // ),
    // Container(
    //   width: double.infinity,
    //   padding: EdgeInsets.all(10),
    //   color: Colors.grey,
    //   child: Text(
    //     'Add Videos',
    //     style: TextStyle(color: Colors.black),
    //   ),
    // ),
    // SizedBox(
    //   height: 20,
    // ),
    // Container(
    //   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //   child: TextFormField(
    //     autofocus: false,
    //     decoration: customInputDecoration(
    //         "Add Videos", Icons.picture_in_picture),
    //   ),
    // ),
    // Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: Text(
    //     'You can add upto 3 pictures',
    //     style: TextStyle(color: Colors.red),
    //   ),
    // ),
    // Container(
    //   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //   child: TextFormField(
    //     autofocus: false,
    //     decoration: customInputDecoration(
    //         "Youtube Video Link", Icons.picture_in_picture),
    //   ),
    // ),
    // Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: Text(
    //     'You can add upto 3 pictures',
    //     style: TextStyle(color: Colors.red),
    //   ),
    // ),
    // SizedBox(
    //   height: 20,
    // ),
    // Container(
    //   width: double.infinity,
    //   padding: EdgeInsets.all(10),
    //   child: FlatButton(
    //     onPressed: () {
    //       // Navigator.push(
    //       //     context,
    //       //     MaterialPageRoute(
    //       //       builder: (context) => Register(),
    //       //     ));
    //     },
    //     color: Colors.red,
    //     textColor: Colors.white,
    //     child: Text('Add Product'),
    //   ),
    // ),

    // else if (_category == 'Food')
    //return
    // SingleChildScrollView(
    //     child: Column(
    //   children: [
    //     Container(
    //       width: double.infinity,
    //       padding: EdgeInsets.all(10),
    //       color: Colors.grey,
    //       child: Text(
    //         'Food Options',
    //         style: TextStyle(color: Colors.black),
    //       ),
    //     ),
    //     Container(
    //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //       child: TextFormField(
    //         autofocus: false,
    //         decoration: customInputDecoration("Ingredients", Icons.food_bank),
    //       ),
    //     ),
    //     Container(
    //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //       child: TextFormField(
    //         autofocus: false,
    //         decoration:
    //             customInputDecoration("Calories", Icons.energy_savings_leaf),
    //       ),
    //     ),
    //     Container(
    //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //       child: DropdownButtonFormField<String>(
    //         decoration: InputDecoration(
    //           hintText: 'Select Category',
    //           contentPadding: EdgeInsets.all(10),
    //           border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(5.0)),
    //         ),
    //         hint: Text('Select Category'),
    //         items: _categories.map((value) {
    //           return DropdownMenuItem<String>(
    //             value: value,
    //             child: new Text(value),
    //           );
    //         }).toList(),
    //         onChanged: (value) {
    //           setState(() {
    //             _category = value;
    //           });
    //         },
    //       ),
    //     ),
    //     Container(
    //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //       child: TextFormField(
    //         autofocus: false,
    //         decoration:
    //             customInputDecoration("Expiry Date", Icons.calendar_month),
    //       ),
    //     ),
    //     Container(
    //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //       child: TextFormField(
    //         autofocus: false,
    //         decoration: InputDecoration(
    //           hintText: 'Allergies detail',
    //           contentPadding:
    //               EdgeInsets.symmetric(vertical: 50, horizontal: 15),
    //           border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(5.0)),
    //         ),
    //       ),
    //     ),
    //     Row(
    //       children: [
    //         Expanded(
    //           flex: 1,
    //           child: CheckboxListTile(
    //             controlAffinity: ListTileControlAffinity.leading,
    //             title: Text('Spicy'),
    //             value: _checkbox,
    //             onChanged: (value) {
    //               // setState(() {
    //               //   _checkbox = !_checkbox;
    //               // });
    //             },
    //           ),
    //         ),
    //         Expanded(
    //           flex: 1,
    //           child: CheckboxListTile(
    //             controlAffinity: ListTileControlAffinity.leading,
    //             title: Text('Non-Spicy'),
    //             value: !_checkbox,
    //             onChanged: (value) {
    //               // setState(() {
    //               //   _checkbox = !_checkbox;
    //               // });
    //             },
    //           ),
    //         )
    //       ],
    //     ),
    //     Container(
    //       width: double.infinity,
    //       padding: EdgeInsets.all(10),
    //       color: Colors.grey,
    //       child: Text(
    //         'Add Images',
    //         style: TextStyle(color: Colors.black),
    //       ),
    //     ),
    //     SizedBox(
    //       height: 20,
    //     ),
    //     Container(
    //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //       child: TextFormField(
    //         autofocus: false,
    //         decoration: customInputDecoration(
    //             "Add Pictures", Icons.picture_in_picture),
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.all(10.0),
    //       child: Text(
    //         'You can add upto 3 pictures',
    //         style: TextStyle(color: Colors.red),
    //       ),
    //     ),
    //     Container(
    //       padding: EdgeInsets.all(10),
    //       child: Row(
    //         children: [
    //           for (var item in _categories)
    //             Padding(
    //               padding: const EdgeInsets.symmetric(
    //                   vertical: 10, horizontal: 10),
    //               child: Icon(
    //                 Icons.image,
    //                 size: 48,
    //               ),
    //             ),
    //         ],
    //       ),
    //     ),
    //     SizedBox(
    //       height: 20,
    //     ),
    //     Container(
    //       width: double.infinity,
    //       padding: EdgeInsets.all(10),
    //       color: Colors.grey,
    //       child: Text(
    //         'Add Videos',
    //         style: TextStyle(color: Colors.black),
    //       ),
    //     ),
    //     SizedBox(
    //       height: 20,
    //     ),
    //     Container(
    //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //       child: TextFormField(
    //         autofocus: false,
    //         decoration:
    //             customInputDecoration("Add Videos", Icons.picture_in_picture),
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.all(10.0),
    //       child: Text(
    //         'You can add upto 3 pictures',
    //         style: TextStyle(color: Colors.red),
    //       ),
    //     ),
    //     Container(
    //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //       child: TextFormField(
    //         autofocus: false,
    //         decoration: customInputDecoration(
    //             "Youtube Video Link", Icons.picture_in_picture),
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.all(10.0),
    //       child: Text(
    //         'You can add upto 3 pictures',
    //         style: TextStyle(color: Colors.red),
    //       ),
    //     ),
    //     SizedBox(
    //       height: 20,
    //     ),
    //     Container(
    //       width: double.infinity,
    //       padding: EdgeInsets.all(10),
    //       child: FlatButton(
    //         onPressed: () {
    //           // Navigator.push(
    //           //     context,
    //           //     MaterialPageRoute(
    //           //       builder: (context) => Register(),
    //           //     ));
    //         },
    //         color: Colors.red,
    //         textColor: Colors.white,
    //         child: Text('Add Product'),
    //       ),
    //     ),
    //   ],
    // ))
    // else if (_category == 'Clothing')
    //   return SingleChildScrollView(
    //       child: Column(
    //     children: [
    //       Container(
    //         width: double.infinity,
    //         padding: EdgeInsets.all(10),
    //         color: Colors.grey,
    //         child: Text(
    //           'Clothing Options',
    //           style: TextStyle(color: Colors.black),
    //         ),
    //       ),
    //       Container(
    //           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //           child:
    //               CustomDropdown(null, 'Size', ['Large', 'Small', 'Medium'])),
    //       Container(
    //           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //           child: CustomDropdown(
    //               null, 'Product Types', ['Men', 'Women', 'Kids'])),
    //       Row(
    //         children: [
    //           Expanded(
    //             flex: 1,
    //             child: CheckboxListTile(
    //               controlAffinity: ListTileControlAffinity.leading,
    //               title: Text('Summer'),
    //               value: _checkbox,
    //               onChanged: (value) {
    //                 // setState(() {
    //                 //   _checkbox = !_checkbox;
    //                 // });
    //               },
    //             ),
    //           ),
    //           Expanded(
    //             flex: 1,
    //             child: CheckboxListTile(
    //               controlAffinity: ListTileControlAffinity.leading,
    //               title: Text('Winter'),
    //               value: !_checkbox,
    //               onChanged: (value) {
    //                 // setState(() {
    //                 //   _checkbox = !_checkbox;
    //                 // });
    //               },
    //             ),
    //           )
    //         ],
    //       ),
    //       Container(
    //           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //           child: CustomDropdown(null, 'Colors', ['Men', 'Women', 'Kids'])),
    //       Container(
    //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //         child: DropdownButtonFormField<String>(
    //           decoration: InputDecoration(
    //             hintText: 'Select Category',
    //             contentPadding: EdgeInsets.all(10),
    //             border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(5.0)),
    //           ),
    //           hint: Text('Select Category'),
    //           items: _categories.map((value) {
    //             return DropdownMenuItem<String>(
    //               value: value,
    //               child: new Text(value),
    //             );
    //           }).toList(),
    //           onChanged: (value) {
    //             setState(() {
    //               _category = value;
    //             });
    //           },
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Container(
    //         width: double.infinity,
    //         padding: EdgeInsets.all(10),
    //         color: Colors.grey,
    //         child: Text(
    //           'Add Images',
    //           style: TextStyle(color: Colors.black),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Container(
    //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //         child: TextFormField(
    //           autofocus: false,
    //           decoration: customInputDecoration(
    //               "Add Pictures", Icons.picture_in_picture),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Text(
    //           'You can add upto 3 pictures',
    //           style: TextStyle(color: Colors.red),
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.all(10),
    //         child: Row(
    //           children: [
    //             for (var item in _categories)
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                     vertical: 10, horizontal: 10),
    //                 child: Icon(
    //                   Icons.image,
    //                   size: 48,
    //                 ),
    //               ),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Container(
    //         width: double.infinity,
    //         padding: EdgeInsets.all(10),
    //         color: Colors.grey,
    //         child: Text(
    //           'Add videos',
    //           style: TextStyle(color: Colors.black),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Container(
    //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //         child: TextFormField(
    //           autofocus: false,
    //           decoration:
    //               customInputDecoration("Add Videos", Icons.picture_in_picture),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Text(
    //           'You can add upto 3 pictures',
    //           style: TextStyle(color: Colors.red),
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //         child: TextFormField(
    //           autofocus: false,
    //           decoration: customInputDecoration(
    //               "Youtube Video Link", Icons.picture_in_picture),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Text(
    //           'You can add upto 3 pictures',
    //           style: TextStyle(color: Colors.red),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Container(
    //         width: double.infinity,
    //         padding: EdgeInsets.all(10),
    //         child: FlatButton(
    //           onPressed: () {
    //             // Navigator.push(
    //             //     context,
    //             //     MaterialPageRoute(
    //             //       builder: (context) => Register(),
    //             //     ));
    //           },
    //           color: Colors.red,
    //           textColor: Colors.white,
    //           child: Text('Add Product'),
    //         ),
    //       ),
    //     ],
    //   ));
    // else if (_category == 'Beauty')
    //   return SingleChildScrollView(
    //       child: Column(
    //     children: [
    //       Container(
    //         width: double.infinity,
    //         padding: EdgeInsets.all(10),
    //         color: Colors.grey,
    //         child: Text(
    //           'Fashion/Beauty Options',
    //           style: TextStyle(color: Colors.black),
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //         child: TextFormField(
    //           autofocus: false,
    //           decoration: customInputDecoration("Ingredients", Icons.food_bank),
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //         child: TextFormField(
    //           autofocus: false,
    //           decoration:
    //               customInputDecoration("Expiry Date", Icons.calendar_month),
    //         ),
    //       ),
    //       Container(
    //           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //           child: CustomDropdown(null, 'Skin Type', ['Oily', 'Non Oily'])),
    //       Container(
    //           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //           child: CustomDropdown(
    //               null, 'Product Types', ['Men', 'Women', 'Kids'])),
    //       Container(
    //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //         child: DropdownButtonFormField<String>(
    //           decoration: InputDecoration(
    //             hintText: 'Select Category',
    //             contentPadding: EdgeInsets.all(10),
    //             border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(5.0)),
    //           ),
    //           hint: Text('Select Category'),
    //           items: _categories.map((value) {
    //             return DropdownMenuItem<String>(
    //               value: value,
    //               child: new Text(value),
    //             );
    //           }).toList(),
    //           onChanged: (value) {
    //             setState(() {
    //               _category = value;
    //             });
    //           },
    //         ),
    //       ),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       Container(
    //         width: double.infinity,
    //         padding: EdgeInsets.all(10),
    //         color: Colors.grey,
    //         child: Text(
    //           'Add Images',
    //           style: TextStyle(color: Colors.black),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Container(
    //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //         child: TextFormField(
    //           autofocus: false,
    //           decoration: customInputDecoration(
    //               "Add Pictures", Icons.picture_in_picture),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Text(
    //           'You can add upto 3 pictures',
    //           style: TextStyle(color: Colors.red),
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.all(10),
    //         child: Row(
    //           children: [
    //             for (var item in _categories)
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                     vertical: 10, horizontal: 10),
    //                 child: Icon(
    //                   Icons.image,
    //                   size: 48,
    //                 ),
    //               ),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       Container(
    //         width: double.infinity,
    //         padding: EdgeInsets.all(10),
    //         color: Colors.grey,
    //         child: Text(
    //           'Add Videos',
    //           style: TextStyle(color: Colors.black),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       Container(
    //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //         child: TextFormField(
    //           autofocus: false,
    //           decoration:
    //               customInputDecoration("Add Videos", Icons.picture_in_picture),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Text(
    //           'You can add upto 3 pictures',
    //           style: TextStyle(color: Colors.red),
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //         child: TextFormField(
    //           autofocus: false,
    //           decoration: customInputDecoration(
    //               "Youtube Video Link", Icons.picture_in_picture),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Text(
    //           'You can add upto 3 pictures',
    //           style: TextStyle(color: Colors.red),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Container(
    //         width: double.infinity,
    //         padding: EdgeInsets.all(10),
    //         child: FlatButton(
    //           onPressed: () {
    //             // Navigator.push(
    //             //     context,
    //             //     MaterialPageRoute(
    //             //       builder: (context) => Register(),
    //             //     ));
    //           },
    //           color: Colors.red,
    //           textColor: Colors.white,
    //           child: Text('Add Product'),
    //         ),
    //       ),
    //     ],
    //   ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: Bottom(),
          backgroundColor: MyColors.prime,
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddNewProductHeader(),
              Container(
                height: size.height * 0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Global Options",
                          style: TextStyle(
                              fontSize: 20, color: MyColors.secondLite),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/product_name_icon.svg",
                              color: MyColors.secondLite,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextFormField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: MyColors.prime),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: MyColors.prime),
                                    ),
                                    hintText: "Product name",
                                    hintStyle:
                                        TextStyle(color: MyColors.secondLite)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/select_category_icon.svg",
                              color: MyColors.secondLite,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  hintText: 'Select Category',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: MyColors.prime),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: MyColors.prime),
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                                hint: Text('Select Category'),
                                items: _categories.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _category = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              "assets/images/description_icon.svg",
                              color: MyColors.secondLite,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextFormField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: MyColors.prime, width: 1),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: MyColors.prime, width: 1),
                                  ),
                                  hintText: 'Description',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 50, horizontal: 15),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/payment_methods_icon.svg",
                                    color: MyColors.secondLite,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: MyColors.prime),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: MyColors.prime),
                                          ),
                                          hintText: "Price",
                                          hintStyle: TextStyle(
                                              color: MyColors.secondLite)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/alert_quantity_icon.svg",
                                    color: MyColors.secondLite,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: MyColors.prime),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: MyColors.prime),
                                          ),
                                          hintText: "Alert quantity",
                                          hintStyle: TextStyle(
                                              color: MyColors.secondLite)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CheckboxListTile(
                              activeColor: MyColors.secondLite,
                              checkColor: MyColors.prime,
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text('COD'),
                              value: _checkbox,
                              onChanged: (value) {
                                // setState(() {
                                //   _checkbox = !_checkbox;
                                // });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: CheckboxListTile(
                              activeColor: MyColors.secondLite,
                              checkColor: MyColors.prime,
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text('All Payments'),
                              value: !_checkbox,
                              onChanged: (value) {
                                // setState(() {
                                //   _checkbox = !_checkbox;
                                // });
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => AddProductAfterSelectingCategory(
                                  renderType: _category,
                                ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: MyColors.secondLite,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ))),
    );
  }
}
