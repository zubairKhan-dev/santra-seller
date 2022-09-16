import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/add_product_after_selecting_category.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/bottom.dart';
import 'package:flutter_login_regis_provider/widgets/add_new_product_header.dart';
import 'package:flutter_login_regis_provider/widgets/custom_dropdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Constants/my_colors.dart';
import '../../widgets/input_decoration.dart';
import 'package:provider/provider.dart';
import '../../providers/seller_provider.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var _checkbox = true;
  var _selectedCategory = 'Global Options';

  final List _categories = ['Food', 'Clothing', 'Beauty', 'Global Options'];

  Widget renderCategoryItem() {}

  var product_name,
      category_code,
      product_type,
      prodcut_description,
      prodcut_price,
      alert_quantity,
      payment_mode= '';


  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SellerProvider seller = Provider.of<SellerProvider>(context);

    final loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[CircularProgressIndicator(), Text("Please wait...")],
    );

    var addProductsGlobal = () {
      final form = formKey.currentState;

      if (form.validate()) {
        form.save();

        seller.add_products_global(product_name,
            category_code,
            product_type,
            prodcut_description,
            prodcut_price,
            alert_quantity,
            payment_mode).then((response) {
          print(response);
          if (response['status']) {
            Get.to(() => AddProductAfterSelectingCategory(
                  renderType: _selectedCategory,
                ));
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
                    child: Form(
                      key: formKey,
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
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
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
                                    onSaved: (val) => product_name = val,
                                    autofocus: false,
                                    validator: (value) => value.isEmpty
                                        ? 'Please enter product name'
                                        : null,
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
                                        hintStyle: TextStyle(
                                            color: MyColors.secondLite)),
                                  ),
                                ),
                              ],
                            ),
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
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Color(0xFF265198)),
                                        hintText: "Select category",

                                        // contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF79CCC9)),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF79CCC9)),
                                        ),
                                      ),
                                      iconDisabledColor: MyColors.secondLite,
                                      iconSize: 30,
                                      iconEnabledColor: MyColors.secondLite,
                                      hint: Text(
                                        "Select category",
                                        style: TextStyle(
                                            color: MyColors.secondLite,
                                            fontSize: 16),
                                      ),
                                      items: _categories.map((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _selectedCategory = newValue;
                                          print(_selectedCategory);
                                        });
                                      },
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
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
                                    validator: (value) => value.isEmpty
                                        ? 'Please enter category name'
                                        : null,
                                    onSaved: (val) => prodcut_description = val,
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
                                          validator: (value) => value.isEmpty
                                              ? 'Please enter price'
                                              : null,
                                          onSaved: (val) => prodcut_price = val,
                                          autofocus: false,
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: MyColors.prime),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
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
                                          onSaved: (val) =>
                                              alert_quantity = val,
                                          validator: (value) => value.isEmpty
                                              ? 'Please enter alert quantity'
                                              : null,
                                          autofocus: false,
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: MyColors.prime),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
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
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: Text('COD'),
                                  value: _checkbox,
                                  onChanged: (value) {
                                    setState(() {
                                      _checkbox = !_checkbox;
                                      payment_mode= 'COD';
                                    });
                                    print(_checkbox);
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: CheckboxListTile(
                                  activeColor: MyColors.secondLite,
                                  checkColor: MyColors.prime,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: Text('All Payments'),
                                  value: !_checkbox,
                                  onChanged: (value) {
                                    setState(() {
                                      _checkbox = !_checkbox;
                                      payment_mode='All Payments';
                                    });

                                    print(_checkbox);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: InkWell(
                              onTap: () {
                                addProductsGlobal();
                              },
                              child: seller.isLoading
                                  ? loading
                                  : Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: MyColors.secondLite,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          "Next",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ))),
    );
  }
}
