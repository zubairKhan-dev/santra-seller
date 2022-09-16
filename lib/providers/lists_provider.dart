import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/models/user.dart';
import 'package:flutter_login_regis_provider/utility/app_url.dart';
import 'package:flutter_login_regis_provider/utility/shared_preference.dart';
//import 'package:http/http.dart';
import 'package:dio/dio.dart';

class ListsProvider extends ChangeNotifier {
  Future<Map<String, dynamic>> getPrefix(String email, String password) async {
    var result;

    var options = Options(
      contentType: "application/x-www-form-urlencoded; charset=UTF-8",
      followRedirects: false,
    );

    Response response = await Dio().get(AppUrl.getPrefix, options: options);

    if (response.statusCode == 200) {
      print('done-lists');
      print(response);
    } else {}

    return result;
  }
}
