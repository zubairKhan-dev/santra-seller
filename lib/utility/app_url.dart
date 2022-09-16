class AppUrl {

  static const String baseUrl = 'https://api.santra.ae/';

  static const String login = baseUrl + '/?api=login_seller';
  static const String register = baseUrl + '/?api=sign_up_seller';
  static const String forgotPassword = baseUrl + '/forgot_password';
  static const String sendOtp= baseUrl + '/v1/?api=verify';
  static const String getPrefix= baseUrl + 'v1?api=get_prefixes';
  static const String addNewPassword= baseUrl + 'v1/?api=add_password';
  static const String businessRegister= baseUrl + 'v1/?api=seller_business';
  static const String logoRegister= baseUrl + 'v1/?api=seller_logo';
  static const String personalRegister= baseUrl + 'v1/?api=seller_personal';
  static const String getCities= baseUrl + 'v1/?api=get_cities';
  static const String submitApproval= baseUrl + 'v1/?api=submit_approval';
  static const String addCategories= baseUrl + 'v1/?api=add_categories';
  static const String viewCategories= baseUrl + 'v1/?api=view_categories';
  static const String addPromotions= baseUrl + 'v1/?api=add_promotion';
  static const String viewPromotions= baseUrl + 'v1/?api=view_promotion';
  static const String addProductsGlobal= baseUrl + 'v1/?api=add_products_global';
  static const String addProductsFood= baseUrl + 'v1/?api=add_product_food';
  static const String viewProducts= baseUrl + 'v1/?api=view_products';
  static const String addProductsBeauty= baseUrl + 'v1/?api=add_product_beauty';
  static const String addProductsFashion= baseUrl + 'v1/?api=add_product_fashion';
  static const String addImagesAndVideos= baseUrl + 'v1/?api=add_product_visual';
  static const String viewProductDetails= baseUrl + 'v1/?api=view_product_details';
  
}