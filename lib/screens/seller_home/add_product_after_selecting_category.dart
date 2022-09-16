import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/constants/my_colors.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/add_images_and_videos_of_product.dart';
import 'package:flutter_login_regis_provider/widgets/bottom.dart';
import 'package:flutter_login_regis_provider/widgets/add_new_product_header.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../providers/seller_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/input_decoration_standard.dart';
import 'package:flushbar/flushbar.dart';

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

  final formKey = GlobalKey<FormState>();

  var ingredeints,
      product_calories,
      vegan_veg,
      expiry_date,
      allergy_details,
      spicy_nonspicy,
   skin_types, expiry_date_beauty, allergy_details_beauty, gender_types,
   product_size, gender_types_fashion, product_season, product_colors = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SellerProvider seller = Provider.of<SellerProvider>(context);

    return SafeArea(
        child: Scaffold(
      // bottomNavigationBar: Bottom(),
      backgroundColor: MyColors.prime,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddNewProductHeader(),
            widget.renderType == "Food"
                ? renderFoodOptions(size, seller)
                : widget.renderType == "Beauty"
                    ? renderFashionBeautyOptions(size, seller)
                    : renderClothingOptions(size, seller)
          ],
        ),
      ),
    ));
  }

  final loading = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[CircularProgressIndicator(), Text("Please wait...")],
  );

  renderFoodOptions(size, seller) {
    var addProductsFood = () {
      final form = formKey.currentState;

      if (form.validate()) {
        form.save();

        final Future<Map<String, dynamic>> respose = seller.add_products_food(
            ingredeints,
            product_calories,
            vegan_veg,
            expiry_date,
            allergy_details,
            spicy_nonspicy);

        respose.then((response) {
          if (response['status']) {
            Get.to(() => AddImageAndVideosOfProduct());
          } else {
            Flushbar(
              title: "Failed Login",
              message: response['message']['message'].toString(),
              duration: Duration(seconds: 3),
            ).show(context);
          }
        });
      } else {
        Flushbar(
          title: 'Invalid form',
          message: 'Please complete the form properly',
          duration: Duration(seconds: 10),
        ).show(context);
      }
    };

    return Container(
        height: size.height * 0.815,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
                child: Form(
              key: formKey,
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
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.0,
                          vertical: size.height * 0.005),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.1,
                            child: SvgPicture.asset(
                              "assets/images/ingredients_icon.svg",
                              color: MyColors.secondLite,
                              height: size.height * 0.03,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          SizedBox(
                            width: size.width * 0.7,
                            child: TextFormField(
                              onSaved: ((newValue) => ingredeints = newValue),
                              autofocus: false,
                              validator: (value) => value.isEmpty
                                  ? 'Please enter ingredients'
                                  : null,
                              decoration: standardInputDecoration(
                                  "Ingredients", Icons.photo),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.0,
                          vertical: size.height * 0.005),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.1,
                            child: SvgPicture.asset(
                              "assets/images/calories_icon.svg",
                              color: MyColors.secondLite,
                              height: size.height * 0.03,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          SizedBox(
                            width: size.width * 0.7,
                            child: TextFormField(
                              autofocus: false,
                              validator: (value) => value.isEmpty
                                  ? 'Please enter calories'
                                  : null,
                              onSaved: (value) => product_calories = value,
                              decoration: standardInputDecoration(
                                  "Calories", Icons.photo),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.00,
                          vertical: size.height * 0.000),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.1,
                            child: SvgPicture.asset(
                              "assets/images/type_icon.svg",
                              color: MyColors.secondLite,
                              height: size.height * 0.03,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Container(
                            width: size.width * 0.7,
                            child: CustomDropdown(Icon(Icons.flag), 'Type',
                                _categories, (val) => vegan_veg = val),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.0,
                          vertical: size.height * 0.005),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.1,
                            child: SvgPicture.asset(
                              "assets/images/calendar_icon.svg",
                              color: MyColors.secondLite,
                              height: size.height * 0.03,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          SizedBox(
                            width: size.width * 0.7,
                            child: TextFormField(
                              autofocus: false,
                              validator: (value) => value.isEmpty
                                  ? 'Please enter expiry date'
                                  : null,
                              onSaved: (value) => expiry_date = value,
                              decoration: standardInputDecoration(
                                  "Expiry Date", Icons.photo),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.0,
                              vertical: size.height * 0.005),
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.1,
                                child: SvgPicture.asset(
                                  "assets/images/timer_icon.svg",
                                  color: MyColors.secondLite,
                                  height: size.height * 0.025,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              SizedBox(
                                width: size.width * 0.25,
                                child: TextFormField(
                                  autofocus: false,
                                  validator: (value) => value.isEmpty
                                      ? 'Please enter user status'
                                      : null,
                                  // onSaved: (value) => user_status = value,
                                  decoration: standardInputDecoration(
                                      "Preparation Time", Icons.photo),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.0,
                              vertical: size.height * 0.005),
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.1,
                                child: SvgPicture.asset(
                                  "assets/images/delivery_time_icon.svg",
                                  color: MyColors.secondLite,
                                  height: size.height * 0.025,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              SizedBox(
                                width: size.width * 0.3,
                                child: TextFormField(
                                  autofocus: false,
                                  validator: (value) => value.isEmpty
                                      ? 'Please enter user status'
                                      : null,
                                  // onSaved: (value) => user_status = value,
                                  decoration: standardInputDecoration(
                                      "Delivery Time", Icons.photo),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
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
                              onSaved: ((newValue) =>
                                  allergy_details = newValue),
                              textAlign: TextAlign.start,
                              autofocus: false,
                              validator: (value) => value.isEmpty
                                  ? 'Please enter allergy details'
                                  : null,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: MyColors.prime, width: 1),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: MyColors.prime, width: 1),
                                ),
                                label: Text("Alergies Details"),
                                labelStyle:
                                    TextStyle(color: MyColors.secondLite),
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
                              setState(() {
                                _checkbox = !_checkbox;
                                spicy_nonspicy= 'Spicy';
                              });
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
                              setState(() {
                                _checkbox = !_checkbox;
                                spicy_nonspicy= 'Non Spicy';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {
                          addProductsFood();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: MyColors.secondLite,
                              borderRadius: BorderRadius.circular(8)),
                          child: seller.isLoading
                              ? loading
                              : Padding(
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
                  ]),
            ))));
  }

  renderFashionBeautyOptions(size, seller) {
    var addProductsBeauty = () {
      final form = formKey.currentState;

      if (form.validate()) {
        form.save();

        final Future<Map<String, dynamic>> respose = seller.add_products_beauty(
            skin_types,
            expiry_date_beauty,
            allergy_details_beauty,
            gender_types);

        respose.then((response) {
          if (response['status']) {
            Get.to(() => AddImageAndVideosOfProduct());
          } else {
            Flushbar(
              title: "Failed Login",
              message: response['message']['message'].toString(),
              duration: Duration(seconds: 3),
            ).show(context);
          }
        });
      } else {
        Flushbar(
          title: 'Invalid form',
          message: 'Please complete the form properly',
          duration: Duration(seconds: 10),
        ).show(context);
      }
    };

    return Container(
        height: size.height * 0.82,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Fashion/Beauty Options",
                          style: TextStyle(
                              fontSize: 20, color: MyColors.secondLite),
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.0,
                            vertical: size.height * 0.005),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.1,
                              child: SvgPicture.asset(
                                "assets/images/calendar_icon.svg",
                                color: MyColors.secondLite,
                                height: size.height * 0.03,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            SizedBox(
                              width: size.width * 0.7,
                              child: TextFormField(
                                autofocus: false,
                                obscureText: true,
                                validator: (value) => value.isEmpty
                                    ? 'Please enter expiry date'
                                    : null,
                                onSaved: (value) => expiry_date_beauty = value,
                                decoration: standardInputDecoration(
                                    "Expiry date", Icons.photo),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                            SizedBox(width: size.width * 0.04),
                            Container(
                              width: size.width * 0.7,
                              child: TextFormField(
                                autofocus: false,
                                onSaved: (newValue) =>
                                    allergy_details_beauty = newValue,
                                validator: (value) => value.isEmpty
                                    ? 'Please enter allergies details'
                                    : null,
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
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.00,
                            vertical: size.height * 0.000),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.1,
                              child: SvgPicture.asset(
                                "assets/images/type_icon.svg",
                                color: MyColors.secondLite,
                                height: size.height * 0.03,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            Container(
                              width: size.width * 0.7,
                              child: CustomDropdown(
                                  Icon(Icons.flag),
                                  'Skin type',
                                  _categories,
                                  (val) => skin_types = val),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.00,
                            vertical: size.height * 0.000),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.1,
                              child: SvgPicture.asset(
                                "assets/images/type_icon.svg",
                                color: MyColors.secondLite,
                                height: size.height * 0.03,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            Container(
                              width: size.width * 0.7,
                              child: CustomDropdown(
                                  Icon(Icons.flag),
                                  'Gender Type',
                                  _categories,
                                  (val) => gender_types = val),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: InkWell(
                              onTap: () {
                                addProductsBeauty();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: MyColors.secondLite,
                                    borderRadius: BorderRadius.circular(8)),
                                child: seller.isLoading
                                    ? loading
                                    : const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          "Next",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                              )))
                    ]))));
  }

  renderClothingOptions(size, seller) {
    var addProductsFashion = () {
      final form = formKey.currentState;

      if (form.validate()) {
        form.save();

        final Future<Map<String, dynamic>> respose =
            seller.add_products_fashion(product_size, gender_types_fashion,
                product_season, product_colors);

        respose.then((response) {
          if (response['status']) {
            Get.to(() => AddImageAndVideosOfProduct());
          } else {
            Flushbar(
              title: "Failed Login",
              message: response['message']['message'].toString(),
              duration: Duration(seconds: 3),
            ).show(context);
          }
        });
      } else {
        Flushbar(
          title: 'Invalid form',
          message: 'Please complete the form properly',
          duration: Duration(seconds: 10),
        ).show(context);
      }
    };

    return Container(
        height: size.height * 0.81,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
              key: formKey,
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
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.00,
                          vertical: size.height * 0.000),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.1,
                            child: SvgPicture.asset(
                              "assets/images/ingredients_icon.svg",
                              color: MyColors.secondLite,
                              height: size.height * 0.03,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Container(
                            width: size.width * 0.7,
                            child: CustomDropdown(Icon(Icons.flag), 'Size',
                                _categories, (val) => product_size = val),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.00,
                          vertical: size.height * 0.000),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.1,
                            child: SvgPicture.asset(
                              "assets/images/type_icon.svg",
                              color: MyColors.secondLite,
                              height: size.height * 0.03,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Container(
                            width: size.width * 0.7,
                            child: CustomDropdown(
                                Icon(Icons.flag),
                                'Gender Type',
                                _categories,
                                (val) => gender_types = val),
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
                              setState(() {
                                _checkbox = !_checkbox;
                                product_season= 'Summer';
                              });
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
                              setState(() {
                                _checkbox = !_checkbox;
                                product_season= 'Winter';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.00,
                          vertical: size.height * 0.005),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.1,
                            child: SvgPicture.asset(
                              "assets/images/select_category_icon.svg",
                              color: MyColors.secondLite,
                              height: size.height * 0.03,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Container(
                            width: size.width * 0.7,
                            child: CustomDropdown(Icon(Icons.flag), 'Color',
                                _categories, (val) => product_colors),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                            onTap: () {
                              addProductsFashion();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: MyColors.secondLite,
                                  borderRadius: BorderRadius.circular(8)),
                              child: seller.isLoading
                                  ? loading
                                  : const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        "Next",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                            )))
                  ])),
        ));
  }
}
