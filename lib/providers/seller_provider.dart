import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter_login_regis_provider/utility/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SellerProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoadingState(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // list use in different screens
  List categories_list = [];
  List promotions_list = [];
  List products_list = [];
  List product_details = [];

  // funtion for adding categories
  Future<Map<String, dynamic>> add_categories(
      category_name, category_type) async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");
    setLoadingState(true);
    try {
      Response response = await Dio().post(AppUrl.addCategories,
          data: {
            'category_name': category_name,
            'category_type': category_type,
            'seller_code': seller_code
          },
          options: options);

      if (response.statusCode == 200) {
        setLoadingState(false);
        print('categories added done');
        print(response);
        result = {'status': true, 'message': 'Success'};
      } else {
        setLoadingState(false);
        result = {'status': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e);
      setLoadingState(false);
      result = {'status': false, 'message': 'failed'};
    }

    return result;
  }

  // function for geeting the added categories
  Future<Map<String, dynamic>> view_categories() async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");
    setLoadingState(true);

    try {
      Response response = await Dio().post(AppUrl.viewCategories,
          data: {'seller_code': seller_code}, options: options);

      if (response.statusCode == 200) {
        setLoadingState(false);
        print('view categories done');
        print(response);
        var arr = [];
        (response.data['data'] as List).asMap().entries.map((entry) {
          int idx = entry.key;
          String val = response.data['data'][idx]['category_name'];
          arr.add(val);
          categories_list = arr;
        }).toList();
        result = {'status': true, 'message': 'Success'};
        //var userData = response.data['data']['seller_code'];
      } else {
        setLoadingState(false);
        result = {'status': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e);
      setLoadingState(false);
      result = {'status': false, 'message': 'failed'};
    }

    return result;
  }

  // funtion to add promotions
  Future<Map<String, dynamic>> add_promotions(
    promotion_name,
    promotion_type,
    promotion_description,
    promotion_start,
    promotion_expiry,
    promotion_value,
  ) async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");
    setLoadingState(true);
    try {
      Response response = await Dio().post(AppUrl.addPromotions,
          data: {
            'promotion_name': promotion_name,
            'promotion_type': promotion_type,
            'promotion_description': promotion_description,
            'promotion_start': promotion_start,
            'promotion_expiry': promotion_expiry,
            'promotion_value': promotion_value,
            'seller_code': seller_code
          },
          options: options);

      if (response.statusCode == 200) {
        setLoadingState(false);
        print('add promtions done');
        print(response);
        result = {'status': true, 'message': 'success'};
      } else {
        setLoadingState(false);
        result = {'status': false, 'message': 'failed'};
      }
    } on DioError catch (e) {
      print(e);
      setLoadingState(false);
      result = {'status': false, 'message': 'failed'};
    }

    return result;
  }

  // function to view promotions
  Future<Map<String, dynamic>> view_promotions() async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");
    setLoadingState(true);
    try {
      Response response = await Dio().post(AppUrl.viewPromotions,
          data: {'seller_code': seller_code}, options: options);
      if (response.statusCode == 200) {
        setLoadingState(false);
        result = {'status': true, 'message': 'Success'};
        var arr = [];
        if (response.data['data'].length > 0) {
          (response.data['data'] as List).asMap().entries.map((entry) {
            int idx = entry.key;
            String val = response.data['data'][idx]['promotion_name'];
            arr.add(val);
            promotions_list = arr;
          }).toList();
        }
        print('view promotions');
        print(response);
      } else if (response.statusCode == 430) {
        setLoadingState(false);
        result = {'status': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e);
      setLoadingState(false);
      result = {'status': false, 'message': 'failed'};
    }

    return result;
  }

  // function to add product global
  Future<Map<String, dynamic>> add_products_global(
      product_name,
      category_code,
      product_type,
      prodcut_description,
      prodcut_price,
      alert_quantity,
      payment_mode) async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");
    setLoadingState(true);
    try {
      Response response = await Dio().post(AppUrl.addProductsGlobal,
          data: {
            'product_name': product_name,
            'category_code': category_code,
            'product_type': product_type,
            'prodcut_description': prodcut_description,
            'prodcut_price': prodcut_price,
            'alert_quantity': alert_quantity,
            'payment_mode': payment_mode,
            'seller_code': seller_code
          },
          options: options);

      if (response.statusCode == 200) {
        prefs.setInt('product_code', response.data['data'][0]['product_code']);
        print('add products global');
        print(response);
        setLoadingState(false);
        result = {'status': true, 'message': 'Success'};
      } else {
        setLoadingState(false);
        result = {'status': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e);
      setLoadingState(false);
      result = {'status': false, 'message': 'failed'};
    }

    return result;
  }

  //function to add product in food category
  Future<Map<String, dynamic>> add_products_food(ingredeints, product_calories,
      vegan_veg, expiry_date, allergy_details, spicy_nonspicy) async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");
    int product_code = prefs.getInt('product_code');
    setLoadingState(true);
    try {
      Response response = await Dio().post(AppUrl.addProductsFood,
          data: {
            'ingredeints': ingredeints,
            'product_calories': product_calories,
            'vegan_veg': vegan_veg,
            'expiry_date': expiry_date,
            'allergy_details': allergy_details,
            'spicy_nonspicy': spicy_nonspicy,
            'seller_code': seller_code,
            'product_code': product_code
          },
          options: options);

      if (response.statusCode == 200) {
        print('add products food');
        print(response);
        setLoadingState(false);
        result = {'status': true, 'message': 'Success'};
      } else {
        setLoadingState(false);
        result = {'status': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e);
      setLoadingState(false);
      result = {'status': false, 'message': 'failed'};
    }

    return result;
  }

  //function to add function in beauty category
  Future<Map<String, dynamic>> add_products_beauty(
      skin_types, expiry_date, allergy_details, gender_types) async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");
    int product_code = prefs.getInt('product_code');
    setLoadingState(true);
    try {
      Response response = await Dio().post(AppUrl.addProductsBeauty,
          data: {
            'skin_types': skin_types,
            'expiry_date': expiry_date,
            'allergy_details': allergy_details,
            'gender_types': gender_types,
            'seller_code': seller_code,
            'product_code': product_code
          },
          options: options);

      if (response.statusCode == 200) {
        print('add products beauty');
        print(response);
        setLoadingState(false);
        result = {'status': true, 'message': 'Success'};
      } else {
        setLoadingState(false);
        result = {'status': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e);
      setLoadingState(false);
      result = {'status': false, 'message': 'failed'};
    }

    return result;
  }

  //function to add products in fashion category
  Future<Map<String, dynamic>> add_products_fashion(
      product_size, gender_types, product_season, product_colors) async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");
    int product_code = prefs.getInt('product_code');
    setLoadingState(true);
    try {
      Response response = await Dio().post(AppUrl.addProductsFashion,
          data: {
            'product_size': product_size,
            'product_season': product_season,
            'gender_types': gender_types,
            'product_colors': product_colors,
            'seller_code': seller_code,
            'product_code': product_code
          },
          options: options);

      if (response.statusCode == 200) {
        print('add products fashion');
        print(response);
        setLoadingState(false);
        result = {'status': true, 'message': 'Success'};
      } else {
        setLoadingState(false);
        result = {'status': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e);
      setLoadingState(false);
      result = {'status': false, 'message': 'failed'};
    }

    return result;
  }

  //function to add product images and videos
  Future<Map<String, dynamic>> add_products_images_videos(ylink1, image_1,
      image_2, image_3, image_4, image_5, video_1, video_2, video_3) async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");
    int product_code = prefs.getInt('product_code');
    setLoadingState(true);
    try {
      Response response = await Dio().post(AppUrl.addImagesAndVideos,
          data: {
            'image_1': image_1,
            'image_2': image_2,
            'image_3': image_3,
            'image_4': image_4,
            'image_5': image_5,
            'video_1': video_1,
            'video_2': video_2,
            'video_3': video_3,
            'ylink1': ylink1,
            'seller_code': seller_code,
            'product_code': product_code
          },
          options: options);

      if (response.statusCode == 200) {
        print('add images and videos');
        print(response);
        setLoadingState(false);
        result = {'status': true, 'message': 'Success'};
      } else {
        setLoadingState(false);
        result = {'status': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e);
      setLoadingState(false);
      result = {'status': false, 'message': 'failed'};
    }

    return result;
  }

  //function to view added products
  Future<Map<String, dynamic>> view_products() async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");
    setLoadingState(true);
    try {
      Response response = await Dio().post(AppUrl.viewProducts,
          data: {
            'seller_code': seller_code,
          },
          options: options);

      if (response.statusCode == 200) {
        print('view products');
        print(response.data['data']);
        setLoadingState(false);
        result = {'status': true, 'message': 'Successful'};
        List arr = [];
        if (response.data['data'].length > 0) {
          products_list = response.data['data'];
        }
        print('saved list...........');
        print(products_list);
      } else {
        setLoadingState(false);
        result = {'status': false, 'message': 'failed'};
      }
    } on DioError catch (e) {
      print(e);
      setLoadingState(false);
      result = {'status': false, 'message': 'failed'};
    }

    return result;
  }

  //view product details
  Future<Map<String, dynamic>> view_product_details() async {
    var result;
    var options = Options(contentType: 'application/x-www-form-urlencoded');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String seller_code = prefs.getString("seller_code");
    int product_code = prefs.getInt('product_code');
    setLoadingState(true);
    try {
      Response response = await Dio().post(AppUrl.viewProductDetails,
          data: {'seller_code': seller_code, 'product_code': product_code},
          options: options);

      if (response.statusCode == 200) {
        print('view products');
        print(response.data['data']);
        if (response.data['data'].length > 0) {
          product_details = response.data['data'];
        }
        setLoadingState(false);
        result = {'status': true, 'message': 'Success'};
        print(products_list);
      } else {
        setLoadingState(false);
        result = {'status': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e);
      setLoadingState(false);
      result = {'status': false, 'message': 'failed'};
    }

    return result;
  }
}
