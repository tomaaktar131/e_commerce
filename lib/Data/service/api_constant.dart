
class ApiConstant{

  static String baseUrl="https://e-bazar-latest.onrender.com";

  static String getProduct = "/shoping/products/";
  static String login="/auth/login/";
  static String signup="/auth/signup/";
  static String forgetPassword="/auth/forgetpassword/";
  static String otoVerify(String userName)=>"/auth/vefiry_for_forget/$userName/";
  static String resetPassword="/auth/reset_password/";

  static String productDataEndPoint = "/shoping/products/";
  static String brandDataEndPoint = "/shoping/brands/";


  static String userInfoEndPoint = "/auth/profile/";



  static String singleProduct="/shoping/products/8";


}