class AppUrl {

  static const String baseUrl = 'https://santra.ae/v1';

  static const String login = baseUrl + '/?api=login_seller';
  static const String register = baseUrl + '/?api=sign_up_seller';
  static const String forgotPassword = baseUrl + '/forgot_password';
  static const String otpVerification= baseUrl + '/?api=verify';
}