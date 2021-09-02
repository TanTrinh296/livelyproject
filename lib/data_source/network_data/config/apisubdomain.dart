class API {
  static const String domain = 'api-gmhangduc.huongda.net';
  //- fcm
  static const String updateFCM = "/mobile/device";
  //- authen
  static const String registerUser = "/mobile/register";
  static const String updateProfileSocial = "/mobile/login/profile";
  static const String verifiedUser = "/mobile/verified";
  static const String verifiedForgotPass = "/mobile/otp-change-password/verify";
  static const String login = "/mobile/login";
  static const String forgetPassword = "/mobile/forget-password";
  static const String changePassword = "/mobile/change-password";
  static const String otpChangePassword = "/mobile/otp-change-password";
  static const String otpChangePasswordVerify = "/mobile/opt-change-password/verify";
  //- profile
  static const String profile = "/mobile/profile";
  static const String updateProfile = "/mobile/profile";
  //- notification
  static const String listNotification = "/mobile/notifications";
  //- voucher
  static const String listVoucher = "/mobile/coupon";
  //- order
  static const String listOrder = "/mobile/orders";

  //- product
  static const String home = "/mobile/home";
  static const String products = "/mobile/products";
  static const String productDetail = "/mobile/products";
  static const String order = "/mobile/orders";
  static const String checkVoucher = "/mobile/coupon/check";
}
