import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login_regis_provider/models/user.dart';
import 'package:flutter_login_regis_provider/providers/auth_provider.dart';
import 'package:flutter_login_regis_provider/providers/register_provider.dart';
import 'package:flutter_login_regis_provider/providers/user_provider.dart';

import 'package:flutter_login_regis_provider/screens/dashboard.dart';
import 'package:flutter_login_regis_provider/widgets/input_decoration_standard.dart';
import './seller_home/index.dart';
import 'package:flutter_login_regis_provider/utility/validator.dart';
import 'package:flutter_login_regis_provider/utility/widgets.dart';
import 'package:flutter_login_regis_provider/widgets/custom_dropdown.dart';
import 'package:flutter_login_regis_provider/widgets/fullname_input.dart';
import 'package:flutter_login_regis_provider/widgets/input_decoration.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/my_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/bottom.dart';
import 'package:dio/dio.dart';
import '../utility/app_url.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  List cities = [];
  List arr = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCities();
  }

  Future<Map<String, dynamic>> getCities() async {
    var result;

    Response response = await Dio().get(AppUrl.getCities);

    if (response.statusCode == 200) {
      print('done-lists');
      print(response.data['data'][0]['city_name']);
      arr = [];
      (response.data['data']).asMap().entries.map((entry) {
        int idx = entry.key;
        String val = response.data['data'][idx]['city_name'];
        arr.add(val);
      }).toList();
      setState(() {
        cities = arr;
      });

      print('citieeesssssss');
      print(cities);
    } else {}

    return result;
  }

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  final formKey = GlobalKey<FormState>();
  final List _categories = ['Food', 'Clothing', 'Beauty'];

  int selectedPage = 0;

  final _pageOptions = [SellerHome(), SellerHome()];

  var business = true;
  var personal = false;
  var logo = false;
  var status = false;
  var first_name;
  var last_name;
  var user_email;
  var phone_number;
  var user_country;
  var user_gender;
  var date_of_birth;

  String business_name,
      license_id,
      emirates_id,
      license_city,
      business_email,
      business_number;

  var seller_code;

  DateTime _license_s_date;
  DateTime _license_e_date;
  TextEditingController _textEditingController = TextEditingController();
  var logo_data;

  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  filePick() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      print('file picker========');
      print(result.files.single.path);
      File file = File(result.files.single.path);
      List<int> fileInByte = file.readAsBytesSync();
      String fileInBase64 = base64Encode(fileInByte);
      print('file in base 64');
      print(fileInBase64);
      setState(() {
        logo_data = fileInBase64;
      });
      return fileInBase64;
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthProvider auth = Provider.of<AuthProvider>(context);
    RegisterProvider register = Provider.of<RegisterProvider>(context);

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
      ],
    );

    var doRegister = () async {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        if (true) {
          register
              .seller_business(
                  business_name,
                  license_id,
                  emirates_id,
                  _license_s_date,
                  _license_e_date,
                  license_city,
                  business_email,
                  business_number)
              .then((response) {
            if (response['status']) {
              print('yaay');
              print(response);
            } else {
              Flushbar(
                title: 'Registration fail',
                message: response.toString(),
                duration: Duration(seconds: 10),
              ).show(context);
            }
          });
        } else {
          Flushbar(
            title: 'Mismatch password',
            message: 'Please enter valid confirm password',
            duration: Duration(seconds: 10),
          ).show(context);
        }
      } else {
        Flushbar(
          title: 'Invalid form',
          message: 'Please complete the form properly',
          duration: Duration(seconds: 10),
        ).show(context);
      }
    };

    var logoRegister = () async {
      register.logo_register(logo_data).then((response) {
        if (response['status']) {
          print('yaay logo!!');
          print(response);
        } else {
          Flushbar(
            title: 'Registration fail',
            message: response.toString(),
            duration: Duration(seconds: 10),
          ).show(context);
        }
      });
    };

    var personalRegister = () async {
      register
          .personal_register(first_name, last_name, user_email, phone_number,
              user_country, user_gender, date_of_birth)
          .then((response) {
        if (response['status']) {
          print('yaay personal!!');
          print(response);
        } else {
          Flushbar(
            title: 'Registration fail',
            message: response.toString(),
            duration: Duration(seconds: 10),
          ).show(context);
        }
      });
    };

    var submitApproval = () async {
      register.submit_approval().then((response) {
        if (response['status']) {
          print('yaay submit!!');
          print(response);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SellerHome(),
              ));
        } else {
          Flushbar(
            title: 'Registration fail',
            message: response.toString(),
            duration: Duration(seconds: 10),
          ).show(context);
        }
      });
    };

    _selectDateS(BuildContext context) async {
      DateTime newSelectedDate = await showDatePicker(
          context: context,
          initialDate:
              _license_s_date != null ? _license_s_date : DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2040),
          builder: (BuildContext context, Widget child) {
            return Theme(
              data: ThemeData.dark().copyWith(
                colorScheme: ColorScheme.dark(
                  primary: Colors.deepPurple,
                  onPrimary: Colors.white,
                  surface: Colors.blueGrey,
                  onSurface: Colors.yellow,
                ),
                dialogBackgroundColor: Colors.blue[500],
              ),
              child: child,
            );
          });

      if (newSelectedDate != null) {
        _license_s_date = newSelectedDate;
        _textEditingController
          ..text = DateFormat.yMMMd().format(_license_e_date)
          ..selection = TextSelection.fromPosition(TextPosition(
              offset: _textEditingController.text.length,
              affinity: TextAffinity.upstream));
      }
    }

    _selectDateE(BuildContext context) async {
      DateTime newSelectedDate = await showDatePicker(
          context: context,
          initialDate:
              _license_s_date != null ? _license_s_date : DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2040),
          builder: (BuildContext context, Widget child) {
            return Theme(
              data: ThemeData.dark().copyWith(
                colorScheme: ColorScheme.dark(
                  primary: Colors.deepPurple,
                  onPrimary: Colors.white,
                  surface: Colors.blueGrey,
                  onSurface: Colors.yellow,
                ),
                dialogBackgroundColor: Colors.blue[500],
              ),
              child: child,
            );
          });

      if (newSelectedDate != null) {
        _license_s_date = newSelectedDate;
        _textEditingController
          ..text = DateFormat.yMMMd().format(_license_e_date)
          ..selection = TextSelection.fromPosition(TextPosition(
              offset: _textEditingController.text.length,
              affinity: TextAffinity.upstream));
      }
    }

    Widget _getRegister() {
      if (business) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                  autofocus: false,
                  //validator: validateEmail,
                  onSaved: (value) => business_name = value,
                  decoration: standardInputDecoration(
                      'Business name', Icons.business_center_sharp)),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                // autofocus: false,
                // validator: validateEmail,
                onSaved: (value) => license_id = value,
                decoration:
                    standardInputDecoration("License ID", Icons.perm_identity),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                autofocus: false,
                //validator: validateEmail,
                controller: _textEditingController,
                onTap: () {
                  _selectDateS(context);
                },
                decoration: standardInputDecoration(
                    "License insurence date", Icons.calendar_month),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                autofocus: false,
                //validator: validateEmail,
                controller: _textEditingController,
                onTap: () {
                  _selectDateE(context);
                },
                decoration: standardInputDecoration(
                    "License Expiry date", Icons.calendar_month),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                autofocus: false,
                //validator: validateEmail,
                onSaved: (value) => license_city = value,
                decoration: standardInputDecoration(
                    "License Issuance city", Icons.location_city_rounded),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                autofocus: false,
                //validator: validateEmail,
                onSaved: (value) => business_email = value,
                decoration:
                    standardInputDecoration("Business Email", Icons.mail),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                validator: (value) =>
                    value.isEmpty ? 'Please enter password' : null,
                onSaved: (value) => business_number = value,
                decoration: standardInputDecoration(
                    "Business Number", Icons.phone_android),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                validator: (value) =>
                    value.isEmpty ? 'Please enter user date' : null,
                onSaved: (value) => emirates_id = value,
                decoration:
                    standardInputDecoration("Emirates ID", Icons.perm_identity),
              ),
            ),
          ],
        );
      } else if (logo) {
        return Container(
          width: double.infinity,
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  filePick();
                },
                child: SvgPicture.asset(
                  "assets/images/business_logo.svg",
                  height: size.height * 0.25,
                ),
              ),

              //const Spacer(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Upload your business logo',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    color: MyColors.secondLite),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )),
        );
      } else if (personal) {
        return Column(
          children: [
            FullNameInput((val) => first_name = val, (val) => last_name = val),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.flag_outlined,
                      color: MyColors.primary,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: CustomDropdown(
                        Icons.flag, 'Select Nationality', cities, (val){setState(() {
                          user_country= val;
                        });}),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                autofocus: false,
                //validator: validateEmail,
                onSaved: (value) => user_email = value,
                decoration: standardInputDecoration("Email", Icons.email),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                autofocus: false,
                //validator: validateEmail,
                //controller: _textEditingController,
                onSaved: (value) => date_of_birth = value,
                decoration: standardInputDecoration(
                    "Date of Birth", Icons.calendar_month),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                autofocus: false,
                //validator: validateEmail,
                //controller: _textEditingController,
                onSaved: (value) => phone_number = value,
                decoration:
                    standardInputDecoration("Phone Number", Icons.phone),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                autofocus: false,
                //validator: validateEmail,
                //controller: _textEditingController,
                onSaved: (value) => user_gender = value,
                decoration:
                    standardInputDecoration("Gender", Icons.perm_identity),
              ),
            ),
          ],
        );
      } else if (status) {
        return Column(
          children: [
            Container(
              //padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(150.0)),
                        elevation: 10,
                        color: Colors.grey,
                        child: Container(
                          padding: EdgeInsets.all(45),
                          child: Column(
                            children: [
                              SvgPicture.asset("assets/images/business.svg",
                                  height: size.height * 0.03,
                                  color: Colors.white),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                'Business',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.report_gmailerrorred, color: Colors.red),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(150.0)),
                        elevation: 10,
                        color: MyColors.prime,
                        child: Container(
                          padding: EdgeInsets.all(45),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/images/business.svg",
                                height: size.height * 0.03,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                'Business',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          // Text('Completed', style: TextStyle(color: MyColors.primary),),
                          Icon(
                            Icons.check,
                            color: MyColors.prime,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              //padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(150.0)),
                        elevation: 10,
                        color: MyColors.prime,
                        child: Container(
                          padding: EdgeInsets.all(45),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/images/business.svg",
                                height: size.height * 0.03,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                'Business',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          // Text('Completed', style: TextStyle(color: MyColors.primary),),
                          Icon(
                            Icons.check,
                            color: MyColors.prime,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(150.0)),
                        elevation: 10,
                        color: MyColors.prime,
                        child: Container(
                          padding: EdgeInsets.all(45),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/images/business.svg",
                                height: size.height * 0.03,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                'Business',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          // Text('Completed', style: TextStyle(color: MyColors.primary),),
                          Icon(
                            Icons.check,
                            color: MyColors.prime,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      }
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColors.prime,
          bottomNavigationBar:
              Container(height: size.height * 0.1, child: Bottom()),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  //height: size.height * 0.15,
                  child: Form(
                    key: formKey,
                    child: Container(
                      height: size.height * 0.18,
                      padding: EdgeInsets.fromLTRB(size.width * 0.05,
                          size.height * 0.05, size.width * 0.05, 0.0),
                      decoration: const BoxDecoration(color: MyColors.prime),
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColors.primeLite,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                        ),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: business
                                        ? MyColors.primary
                                        : MyColors.secondLite,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Icon(
                                        Icons.check_circle,
                                        color: MyColors.prime,
                                        size: size.height * 0.02,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              business = true;
                                              personal = false;
                                              logo = false;
                                              status = false;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                size.height * 0.01),
                                            child: SvgPicture.asset(
                                              "assets/images/business.svg",
                                              height: size.height * 0.025,
                                            ),
                                          )),
                                      Text(
                                        'Business',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      Spacer(),
                                      if (business)
                                        SvgPicture.asset(
                                          "assets/images/pointer.svg",
                                          height: size.height * 0.01,
                                          alignment: Alignment.bottomCenter,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: logo
                                        ? MyColors.primary
                                        : MyColors.secondLite,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Icon(
                                        Icons.check_circle,
                                        color: MyColors.prime,
                                        size: size.height * 0.02,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              business = false;
                                              personal = false;
                                              logo = true;
                                              status = false;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                size.height * 0.01),
                                            child: SvgPicture.asset(
                                              "assets/images/logo_r.svg",
                                              height: size.height * 0.025,
                                            ),
                                          )),
                                      Text(
                                        'Logo',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      Spacer(),
                                      if (logo)
                                        SvgPicture.asset(
                                          "assets/images/pointer.svg",
                                          height: size.height * 0.01,
                                          alignment: Alignment.bottomCenter,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: personal
                                        ? MyColors.primary
                                        : MyColors.secondLite,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Icon(
                                        Icons.check_circle,
                                        color: MyColors.prime,
                                        size: size.height * 0.02,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              business = false;
                                              personal = true;
                                              logo = false;
                                              status = false;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                size.height * 0.01),
                                            child: SvgPicture.asset(
                                              "assets/images/personal.svg",
                                              height: size.height * 0.025,
                                            ),
                                          )),
                                      Text(
                                        'Personal',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      Spacer(),
                                      if (personal)
                                        SvgPicture.asset(
                                          "assets/images/pointer.svg",
                                          height: size.height * 0.01,
                                          alignment: Alignment.bottomCenter,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: status
                                        ? MyColors.primary
                                        : MyColors.secondLite,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15)),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Icon(
                                        Icons.check_circle,
                                        color: MyColors.prime,
                                        size: size.height * 0.02,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              business = false;
                                              personal = false;
                                              logo = false;
                                              status = true;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                size.height * 0.01),
                                            child: SvgPicture.asset(
                                              "assets/images/status.svg",
                                              height: size.height * 0.025,
                                            ),
                                          )),
                                      Text(
                                        'Status',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      Spacer(),
                                      if (status)
                                        SvgPicture.asset(
                                          "assets/images/pointer.svg",
                                          height: size.height * 0.01,
                                          alignment: Alignment.bottomCenter,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //here
                  ),
                ),
                Container(
                  //height: size.height * 0.69,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          child: Padding(
                            padding: EdgeInsets.all(size.height * 0.01),
                            child: Text(
                                business
                                    ? "Business Details"
                                    : logo
                                        ? 'Business Logo'
                                        : personal
                                            ? 'Personal Details'
                                            : 'Status',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      _getRegister(),

                      //Spacer(),
                      auth.loggedInStatus == true
                          ? loading
                          : Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.03,
                                  horizontal: size.width * 0.2),
                              child: business
                                  ? longButtons('Save', doRegister)
                                  : logo
                                      ? longButtons('Save', logoRegister)
                                      : personal
                                          ? longButtons(
                                              'Save', personalRegister)
                                          : longButtons(
                                              'Submit for approval',submitApproval)
                                            )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
