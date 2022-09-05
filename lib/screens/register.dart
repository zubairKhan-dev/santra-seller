import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login_regis_provider/models/user.dart';
import 'package:flutter_login_regis_provider/providers/auth_provider.dart';
import 'package:flutter_login_regis_provider/providers/user_provider.dart';
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

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  final formKey = GlobalKey<FormState>();
  final List _categories = ['Food', 'Clothing', 'Beauty'];

  int selectedPage = 0;

  final _pageOptions = [SellerHome(), SellerHome()];

  var business = true;
  var personal = false;
  var logo = false;
  var status = false;

  String full_name,
      user_email,
      user_password,
      _confirmPassword,
      phone_number,
      user_gender,
      date_of_birth,
      user_date,
      user_status,
      user_country,
      license_id,
      emirates_id,
      license_s_date,
      license_e_date,
      license_city,
      business_email,
      business_number,
      business_date,
      business_name;

  DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController();

  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthProvider auth = Provider.of<AuthProvider>(context);

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
      ],
    );

    var doRegister = () {
      // print('on doRegister');

      // final form = formKey.currentState;
      // if (form.validate()) {
      //   form.save();

      //   auth.loggedInStatus = Status.Authenticating;
      //   auth.notify();

      //   Future.delayed(loginTime).then((_) {
      //     Navigator.pushReplacementNamed(context, '/login');
      //     auth.loggedInStatus = Status.LoggedIn;
      //     auth.notify();
      //   });

      //   // now check confirm password
      //   if (true) {
      //     auth
      //         .register(
      //             full_name,
      //             user_email,
      //             user_password,
      //             phone_number,
      //             user_gender,
      //             date_of_birth,
      //             user_date,
      //             user_status,
      //             user_country,
      //             license_id,
      //             emirates_id,
      //             license_s_date,
      //             license_e_date,
      //             license_city,
      //             business_email,
      //             business_number,
      //             business_date,
      //             business_name)
      //         .then((response) {
      //       if (response['status']) {
      //         print('yaay');
      //         print(response);
      //         User user = response['data'];
      //         Provider.of<UserProvider>(context, listen: false).setUser(user);
      //         Navigator.pushReplacementNamed(context, '/login');
      //       } else {
      //         Flushbar(
      //           title: 'Registration fail',
      //           message: response.toString(),
      //           duration: Duration(seconds: 10),
      //         ).show(context);
      //       }
      //     });
      //   } else {
      //     Flushbar(
      //       title: 'Mismatch password',
      //       message: 'Please enter valid confirm password',
      //       duration: Duration(seconds: 10),
      //     ).show(context);
      //   }
      // } else {
      //   Flushbar(
      //     title: 'Invalid form',
      //     message: 'Please complete the form properly',
      //     duration: Duration(seconds: 10),
      //   ).show(context);
      // }

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SellerHome(),
          ));
    };

    _selectDate(BuildContext context) async {
      DateTime newSelectedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
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
        _selectedDate = newSelectedDate;
        _textEditingController
          ..text = DateFormat.yMMMd().format(_selectedDate)
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
                  onSaved: (value) => full_name = value,
                  decoration: standardInputDecoration(
                      'Business name', Icons.business_center_sharp)),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                // autofocus: false,
                // validator: validateEmail,
                // onSaved: (value) => user_email = value,
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
                  _selectDate(context);
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
                  _selectDate(context);
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
                onSaved: (value) => user_gender = value,
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
                onSaved: (value) => date_of_birth = value,
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
                onSaved: (value) => user_password = value,
                decoration: standardInputDecoration(
                    "Business Number", Icons.phone_android),
              ),
            ),
            // SizedBox(height: 20.0,),
            // Text('Confirm Password'),
            // SizedBox(height: 5.0,),
            // TextFormField(
            //   autofocus: false,
            //   obscureText: true,
            //   validator: (value)=>value.isEmpty?'confirm password':null,
            //   onSaved: (value) => _confirmPassword = value,
            //   decoration: buildInputDecoration("Enter Confirm Password", Icons.lock),
            // ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                validator: (value) =>
                    value.isEmpty ? 'Please enter user date' : null,
                onSaved: (value) => user_date = value,
                decoration:
                    standardInputDecoration("Emirates ID", Icons.perm_identity),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                validator: (value) =>
                    value.isEmpty ? 'Please enter user status' : null,
                onSaved: (value) => user_status = value,
                decoration:
                    standardInputDecoration("License Picture", Icons.photo),
                style: TextStyle(fontSize: 16),
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
              SvgPicture.asset(
                "assets/images/business_logo.svg",
                height: size.height * 0.25,
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
            FullNameInput(),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child:
                  CustomDropdown(Icons.flag, 'Select Nationality', _categories),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.005),
              child: TextFormField(
                autofocus: false,
                validator: validateEmail,
                //onSaved: (value) => user_email = value,
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
                onTap: () {
                  _selectDate(context);
                },
                decoration: standardInputDecoration(
                    "Date of Birth", Icons.calendar_month),
              ),
            ),
          ],
        );
      } else if (status) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
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
              padding: EdgeInsets.all(10),
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
          bottomNavigationBar: Container(
            height: size.height * 0.1,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedIconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: MyColors.prime,
              unselectedItemColor: Colors.black,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                    activeIcon: Container(
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
                      ),
                    ),
                    icon: SvgPicture.asset(
                      "assets/images/home_icon.svg",
                      color: MyColors.second,
                    ),
                    label: "Logo"),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  activeIcon: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
              currentIndex: selectedIndex,
              selectedItemColor: Colors.black,
              onTap: _onItemTapped,
            ),
          ),
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
                      auth.loggedInStatus == Status.Authenticating
                          ? loading
                          : Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.03,
                                  horizontal: size.width * 0.2),
                              child: logo
                                  ? null
                                  : status
                                      ? longButtons(
                                          'Submit for approval', doRegister)
                                      : longButtons("Save", doRegister),
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
