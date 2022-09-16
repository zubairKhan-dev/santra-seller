import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter_login_regis_provider/utility/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status {
  businessRegister,
  logoRegister,
  personalRegister,
  submitApproval,
  
}

class RegisterProvider extends ChangeNotifier {

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
        'message': response.statusMessage
      };
    }

    return result;
  }

  Future<Map<String, dynamic>> logo_register(logo_data) async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");

    Response response = await Dio().post(AppUrl.logoRegister,
        data: {
          'logo_data': logo_data,
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
        'message': response.statusMessage
      };
    }

    return result;
  }

  Future<Map<String, dynamic>> personal_register(first_name, last_name, user_email, phone_number, user_country, user_gender, date_of_birth) async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");

    Response response = await Dio().post(AppUrl.personalRegister,
        data: {
          'first_name': first_name,
          'last_name': last_name,
          'user_email': user_email,
          'phone_number': phone_number,
          'user_country': user_country,
          'user_gender': user_gender,
          'date_of_birth': date_of_birth,
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
        'message': response.statusMessage
      };
    }

    return result;
  }

   Future<Map<String, dynamic>> submit_approval() async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");

    Response response = await Dio().post(AppUrl.submitApproval,
        data: {
          'seller_code': seller_code
        },
        options: options);

    if (response.statusCode == 200) {
      print('submit approval done');
      print(response);
      result = {'status': true, 'message': 'Successful'};
      //var userData = response.data['data']['seller_code'];
    } else {
      result = {
        'status': false,
        'message': response.statusMessage
      };
    }

    return result;
  }
}