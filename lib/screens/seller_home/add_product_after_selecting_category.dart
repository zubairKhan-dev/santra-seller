import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/Constants/my_colors.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/add_images_and_videos_of_product.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/bottom.dart';
import 'package:flutter_login_regis_provider/widgets/add_new_product_header.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddProductAfterSelectingCategory extends StatefulWidget {
  @override
  State<AddProductAfterSelectingCategory> createState() =>
      _AddProductAfterSelectingCategoryState();
  String renderType;
  AddProductAfterSelectingCategory({@required this.renderType});
}

class _AddProductAfterSelectingCategoryState
    extends State<AddProductAfterSelectingCategory> {
  var _type = 'Type 1';
  var _checkbox = true;
  final List _categories = ['Type 1', 'Type 2', 'Type 3', 'Type 4'];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Bottom(),
      backgroundColor: MyColors.prime,
      body: Column(
        children: [
          AddNewProductHeader(),
          widget.renderType == "Food"
              ? renderFoodOptions(size)
              : widget.renderType == "Beauty"
                  ? renderFashionBeautyOptions(size)
                  : renderClothingOptions(size)
        ],
      ),
    ));
  }

  renderFoodOptions(size) {
    return Container(
        height: size.height * 0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Food Options",
                        style:
                            TextStyle(fontSize: 20, color: MyColors.secondLite),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/ingredients_icon.svg",
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
                                  hintText: "Ingredients",
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
                            "assets/images/calories_icon.svg",
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
                                  hintText: "Calories",
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
                            "assets/images/type_icon.svg",
                            color: MyColors.secondLite,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                hintText: 'Type',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.prime),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.prime),
                                ),
                                contentPadding: EdgeInsets.all(10),
                              ),
                              hint: Text('Type'),
                              items: _categories.map((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _type = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            "assets/images/calendar_icon.svg",
                            color: MyColors.secondLite,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: MyColors.prime)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text("Expiry Date",
                                  style: TextStyle(
                                    color: MyColors.second,
                                  )),
                            ),
                          )),
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
                                  "assets/images/timer_icon.svg",
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
                                        hintText: "Preparation Time",
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
                                  "assets/images/delivery_time_icon.svg",
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
                                        hintText: "Delivery Time",
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
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/images/alergy_icon.svg",
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
                                hintText: 'Alergies Details',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 50, horizontal: 15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CheckboxListTile(
                            activeColor: MyColors.second,
                            checkColor: MyColors.prime,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text('Spicy'),
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
                            activeColor: MyColors.second,
                            checkColor: MyColors.prime,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text('Non-spicy'),
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
                          Get.to(() => AddImageAndVideosOfProduct());
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            )));
  }

  renderFashionBeautyOptions(size) {
    return Container(
        height: size.height * 0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Fashion/Beauty Options",
                      style:
                          TextStyle(fontSize: 20, color: MyColors.secondLite),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/ingredients_icon.svg",
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
                                  borderSide: BorderSide(color: MyColors.prime),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.prime),
                                ),
                                hintText: "Ingredients",
                                hintStyle:
                                    TextStyle(color: MyColors.secondLite)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          "assets/images/calendar_icon.svg",
                          color: MyColors.secondLite,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: MyColors.prime)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("Expiry Date",
                                style: TextStyle(
                                  color: MyColors.second,
                                )),
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/images/alergy_icon.svg",
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
                              hintText: 'Alergies Details',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/type_icon.svg",
                          color: MyColors.secondLite,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: 'Skin type',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.prime),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.prime),
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            hint: Text('Skin type'),
                            items: _categories.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _type = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/type_icon.svg",
                          color: MyColors.secondLite,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: 'Product Type',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.prime),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.prime),
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            hint: Text('Product Type'),
                            items: _categories.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _type = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                          onTap: () {
                            Get.to(() => AddImageAndVideosOfProduct());
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
                          )))
                ])));
  }

  renderClothingOptions(size) {
    return Container(
        height: size.height * 0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Clothing Options",
                      style:
                          TextStyle(fontSize: 20, color: MyColors.secondLite),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/ingredients_icon.svg",
                          color: MyColors.secondLite,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: 'Size',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.prime),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.prime),
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            hint: Text('Size'),
                            items: _categories.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _type = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/type_icon.svg",
                          color: MyColors.secondLite,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: 'Type',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.prime),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.prime),
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            hint: Text('Type'),
                            items: _categories.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _type = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CheckboxListTile(
                          activeColor: MyColors.secondLite,
                          checkColor: MyColors.prime,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text('Summer'),
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
                          title: Text('Winter'),
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
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/colors_icon.svg",
                          color: MyColors.secondLite,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: 'Colors',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.prime),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.prime),
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            hint: Text('Colors'),
                            items: _categories.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _type = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                          onTap: () {
                            Get.to(() => AddImageAndVideosOfProduct());
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
                          )))
                ])));
  }
}
