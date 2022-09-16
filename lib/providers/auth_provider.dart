import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/models/user.dart';
import 'package:flutter_login_regis_provider/utility/app_url.dart';
import 'package:flutter_login_regis_provider/utility/shared_preference.dart';
//import 'package:http/http.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut,
}

class AuthProvider extends ChangeNotifier {
  bool h= true;
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  Status get registeredInStatus => _registeredInStatus;

  set registeredInStatus(Status value) {
    _registeredInStatus = value;
  }

  Future<Map<String, dynamic>> register(
      full_name,
      user_email,
      user_password,
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
      business_name) async {
    var options = Options(
      headers: {
        "authorization": "Bearer f0086611491bff3fadb2466130bc7471fb450161"
      },
      contentType: "application/x-www-form-urlencoded; charset=UTF-8",
      followRedirects: false,
    );

    Response response = await Dio().post(AppUrl.register,
        data: {
          'full_name': full_name,
          'user_email': user_email,
          'user_password': user_password,
          'phone_number': phone_number,
          'user_gender': user_gender,
          'date_of_birth': date_of_birth,
          'user_date': user_date,
          'user_status': user_status,
          'user_country': user_country,
          'license_id': license_id,
          'emirates_id': emirates_id,
          'license_s_date': license_s_date,
          'license_e_date': license_e_date,
          'license_city': license_city,
          'business_email': business_email,
          'business_number': business_number,
          'business_date': business_date,
          'business_name': business_name
        },
        options: options);

    if (response.statusCode == 200) {
      print('done');
      print(response);
    } else {}

    // Response otpResponse = await Dio().post(
    //   AppUrl.otpVerification,
    //   data: {
    //     'user_number': phone_number
    //   },
    //   options: options
    // );

    // if (response.statusCode == 200) {

    //   print('otp done');
    //   print(response);
    // }
    // final Map<String, dynamic> apiBodyData = {
    //   'email': email,
    //   'password': password
    // };

    // String token= '8eb440ea8126dc73d5e106a08cf57361dd6ece1b';

    // return await post(
    //   AppUrl.register,
    //   body: json.encode(apiBodyData),
    //   headers: {
    //     'Content-Type':'application/json',
    //     'authentication': 'Bearer $token'
    //     }
    // ).then(onValue)
    // .catchError(onError);
  }

  Future<Map<String, dynamic>> sendOtp(mobile) async {
    print('mobile is here bitch');
    print(mobile);

//     var options = Options(
//       headers: {
// contentType: "multipart/form-data",
//       },

//       //followRedirects: false,
//     );

    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');

    Response response = await Dio().post('https://api.santra.ae/v1/?api=verify',
        data: {"user_number": mobile}, options: options);

    if (response.statusCode == 200) {
      print('otp done');
      print(response);
      result = true;
    }

    return result;
  }

  notify() {
    notifyListeners();
  }

  // static Future<FutureOr> onValue (Response response) async {
  //   var result ;

  //   final Map<String, dynamic> responseData = json.decode(response.body);

  //   print(responseData);

  //   if(response.statusCode == 200){

  //     var userData = responseData['data'];

  //     // now we will create a user model
  //     User authUser = User.fromJson(responseData);

  //     // now we will create shared preferences and save data
  //     UserPreferences().saveUser(authUser);

  //     result = {
  //       'status':true,
  //       'message':'Successfully registered',
  //       'data':authUser
  //     };

  //   }else{
  //     result = {
  //       'status':false,
  //       'message':'Successfully registered',
  //       'data':responseData
  //     };
  //   }
  //   return result;
  // }

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    var options = Options(
      headers: {
        "authorization": "Bearer d38c472399952b1dc45fd6082aff9d44cca31b78"
      },
      contentType: "application/x-www-form-urlencoded; charset=UTF-8",
      followRedirects: false,
    );

    Response response = await Dio().post(AppUrl.login,
        data: {'user_name': email, 'user_password': password},
        options: options);

    if (response.statusCode == 200) {
      print('done');
      print(response);
      // final Map<String, dynamic> responseData = json.decode(response.body);

      // print(responseData);

      // var userData = responseData['Content'];

       //User authUser = User.fromJson(userData);

      // UserPreferences().saveUser(authUser);

      // _loggedInStatus = Status.LoggedIn;
      // notifyListeners();

      // result = {'status': true, 'message': 'Successful', 'user': authUser};

    } else {
      // _loggedInStatus = Status.NotLoggedIn;
      // notifyListeners();
      // result = {
      //   'status': false,
      //   'message': json.decode(response.body)['error']
      // };
    }

    return result;
  }

  Future<Map<String, dynamic>> addNewPassword(mobile, password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');

    Response response = await Dio().post(AppUrl.addNewPassword,
        data: {
          "user_password": password,
          "user_number": mobile,
        },
        options: options);

    if (response.statusCode == 200) {
      print('password added done');
      print(response);
      
      prefs.setString('seller_code', response.data['data'][0]['seller_code']);
      var userData = response.data['data'];

      //now we will create a user model
      User authUser = User.fromJson(userData);

  // now we will create shared preferences and save data
      UserPreferences().saveUser(authUser);
      result = {'status': true, 'message': 'Successful', 'data': authUser};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.statusMessage)
      };
    }

    return result;
  }

  Future<Map<String, dynamic>> seller_business(business_name, license_id, emirates_id, license_s_date, license_e_date, license_city, business_email, business_number) async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");

    Response response = await Dio().post(AppUrl.businessRegister,
        data: {
          'business_name': business_name,
          'license_id': license_id,
          'emirates_id': emirates_id,
          'license_s_date': license_s_date,
          'license_e_date': license_e_date,
          'license_city': license_city,
          'business_email': business_email,
          'business_number': business_number,
          'seller_code': seller_code
        },
        options: options);

    if (response.statusCode == 200) {
      print('business added done');
      print(response);
      result = {'status': true, 'message': 'Successful'};
      //var userData = response.data['data']['seller_code'];
    } else {
      result = {
        'status': false,
        'message': json.decode(response.statusMessage)
      };
    }

    return result;
  }

  static onError(error) {
    print('the error is ${error.detail}');
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
