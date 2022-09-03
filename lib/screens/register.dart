import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login_regis_provider/models/user.dart';
import 'package:flutter_login_regis_provider/providers/auth_provider.dart';
import 'package:flutter_login_regis_provider/providers/user_provider.dart';
import './seller_home/index.dart';
import 'package:flutter_login_regis_provider/utility/validator.dart';
import 'package:flutter_login_regis_provider/utility/widgets.dart';
import 'package:flutter_login_regis_provider/widgets/custom_dropdown.dart';
import 'package:flutter_login_regis_provider/widgets/fullname_input.dart';
import 'package:flutter_login_regis_provider/widgets/input_decoration.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  final formKey = GlobalKey<FormState>();
  final List _categories = ['Food', 'Clothing', 'Beauty'];

  int selectedPage = 0;

  final _pageOptions = [
    SellerHome(),
    SellerHome()
  ];

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

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                  autofocus: false,
                  //validator: validateEmail,
                  onSaved: (value) => full_name = value,
                  decoration: customInputDecoration(
                      'Business name', Icons.business_center_sharp)),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                autofocus: false,
                validator: validateEmail,
                onSaved: (value) => user_email = value,
                decoration:
                    customInputDecoration("License ID", Icons.perm_identity),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                autofocus: false,
                //validator: validateEmail,
                controller: _textEditingController,
                onTap: () {
                  _selectDate(context);
                },
                decoration: customInputDecoration(
                    "License insurence date", Icons.calendar_month),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                autofocus: false,
                //validator: validateEmail,
                controller: _textEditingController,
                onTap: () {
                  _selectDate(context);
                },
                decoration: customInputDecoration(
                    "License Expiry date", Icons.calendar_month),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                autofocus: false,
                //validator: validateEmail,
                onSaved: (value) => user_gender = value,
                decoration: customInputDecoration(
                    "License Issuance city", Icons.location_city_rounded),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                autofocus: false,
                //validator: validateEmail,
                onSaved: (value) => date_of_birth = value,
                decoration: customInputDecoration("Business Email", Icons.mail),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                validator: (value) =>
                    value.isEmpty ? 'Please enter password' : null,
                onSaved: (value) => user_password = value,
                decoration: customInputDecoration(
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
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                validator: (value) =>
                    value.isEmpty ? 'Please enter user date' : null,
                onSaved: (value) => user_date = value,
                decoration:
                    customInputDecoration("Emirates ID", Icons.perm_identity),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                validator: (value) =>
                    value.isEmpty ? 'Please enter user status' : null,
                onSaved: (value) => user_status = value,
                decoration:
                    customInputDecoration("License Picture", Icons.photo),
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
              Image.asset(
                'assets/images/camera_circle.png',
                height: 250,
              ),
              //const Spacer(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Upload you image here',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: CustomDropdown(Icons.location_off, 'Enter location', _categories),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                autofocus: false,
                validator: validateEmail,
                //onSaved: (value) => user_email = value,
                decoration: customInputDecoration("Email", Icons.email),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                autofocus: false,
                //validator: validateEmail,
                controller: _textEditingController,
                onTap: () {
                  _selectDate(context);
                },
                decoration: customInputDecoration(
                    "License insurence date", Icons.calendar_month),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                autofocus: false,
                //validator: validateEmail,
                //controller: _textEditingController,
                onTap: () {
                  _selectDate(context);
                },
                decoration: customInputDecoration(
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
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      elevation: 10,
                      color: Colors.grey,
                      child: Container(
                        padding: EdgeInsets.all(45),
                        child: Text(
                          'Business',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      elevation: 10,
                      color: Colors.grey,
                      child: Container(
                        padding: EdgeInsets.all(45),
                        child: Text(
                          'Business',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      elevation: 10,
                      color: Colors.grey,
                      child: Container(
                        padding: EdgeInsets.all(45),
                        child: Text(
                          'Business',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      elevation: 10,
                      color: Colors.grey,
                      child: Container(
                        padding: EdgeInsets.all(45),
                        child: Text(
                          'Business',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      elevation: 10,
                      color: Colors.green,
                      child: Container(
                        padding: EdgeInsets.all(45),
                        child: Column(
                          children: [
                            Text(
                              'Live',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      elevation: 10,
                      color: Colors.green,
                      child: Container(
                        padding: EdgeInsets.all(45),
                        child: Column(
                          children: [
                            Text(
                              'Live',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            //onTap : () {},
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
        //  onTap: (index){
        //     setState(() {
        //       selectedPage = index;
        //     });
        //   },
          // currentIndex: selectedPage, 
          // body: _pageOptions[selectedPage],
      ),
      body: SingleChildScrollView(
        child: Container(
          //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 100,
                // ),
                Row(
                  children: [
                    SizedBox(
                      width: 2.5,
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.5),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                                backgroundColor: business ? Colors.blue : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  business = true;
                                  personal = false;
                                  logo = false;
                                  status = false;
                                });
                              },
                              child: Text(
                                'Business',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: business ? Colors.white : Colors.black,
                                ),
                              )),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.5),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                                backgroundColor: logo ? Colors.blue : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  business = false;
                                  personal = false;
                                  logo = true;
                                  status = false;
                                });
                              },
                              child: Text(
                                'Logo',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: logo ? Colors.white : Colors.black,
                                ),
                              )),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.5),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side:
                                    BorderSide(width: 1.0, color: Colors.black),
                                backgroundColor: personal ? Colors.blue : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  business = false;
                                  personal = true;
                                  logo = false;
                                  status = false;
                                });
                              },
                              child: Text(
                                'Personal',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: personal ? Colors.white : Colors.black,
                                ),
                              )),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.5),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side:
                                    BorderSide(width: 1.0, color: Colors.black),
                                backgroundColor: status ? Colors.blue : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    business = false;
                                    personal = false;
                                    logo = false;
                                    status = true;
                                  });
                                });
                              },
                              child: Text(
                                'status',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: status ? Colors.white : Colors.black,
                                ),
                              )),
                        )),
                    SizedBox(
                      width: 2.5,
                    ),
                  ],
                ),
                Container(
                    width: double.infinity,
                    color: Colors.grey,
                    padding: EdgeInsets.all(20),
                    child: business
                        ? RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.business_center_sharp,
                                      size: 24),
                                  alignment: PlaceholderAlignment.middle,
                                ),
                                TextSpan(
                                    text: "  Business Details",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ],
                            ),
                          )
                        : logo
                            ? RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(Icons.camera, size: 24),
                                      alignment: PlaceholderAlignment.middle,
                                    ),
                                    TextSpan(
                                        text: "  Business Logo",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ],
                                ),
                              )
                            : personal
                                ? RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(Icons.perm_identity,
                                              size: 24),
                                          alignment:
                                              PlaceholderAlignment.middle,
                                        ),
                                        TextSpan(
                                            text: "  Personal Details",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  )
                                : RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child:
                                              Icon(Icons.auto_graph, size: 24),
                                          alignment:
                                              PlaceholderAlignment.middle,
                                        ),
                                        TextSpan(
                                            text: "  Status",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  )),
                //here
                SizedBox(
                  height: 5,
                ),
                _getRegister(),
                SizedBox(
                  height: 20,
                ),
                auth.loggedInStatus == Status.Authenticating
                    ? loading
                    : Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: longButtons('Save', doRegister),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
