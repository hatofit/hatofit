class APIConstant {
  APIConstant._();

  static APIConstant get = APIConstant._();

  String baseUrl = "https://api.hatofit.com";
  // String baseUrl = "http://192.168.243.169:3000";

  String authRegister = "/api/auth/register";
  String authLogin = "/api/auth/login";
  String authMe = "/api/auth/me";
  String authUpdate = "/api/auth/update";
  String forgotPassword = "/api/auth/forgot-password";
  String resetPassword = "/api/auth/reset-password";
  String verifyCode = "/api/auth/verify-code";

  String exercise = "/api/exercise";

  String report = "/api/report";
  String reportShare = "/api/report/share";

  String session = "/api/session";
  String sessionShared = "/api/session/shared";

  String image = "/api/image";
}
