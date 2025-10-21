import 'package:e_commerce_project/features/auth/login_screen.dart';
import 'package:e_commerce_project/features/auth/signup_screen.dart';
import 'package:e_commerce_project/features/splash/splash_screen.dart';

import 'package:get/get.dart';

import '../features/auth/forgot_password_screen.dart';
import '../features/auth/reset_password_screen.dart';
import '../features/auth/verification_code_screen.dart';
import '../features/cart/cart_page.dart';
import '../features/drawer_screen/setting/about_us.dart';
import '../features/drawer_screen/setting/privacy_policy.dart';
import '../features/drawer_screen/setting/setting.dart';
import '../features/drawer_screen/setting/terms_of_services.dart';
import '../features/drawer_screen/user_information/account_information.dart';
import '../features/drawer_screen/user_information/edit_account_information.dart';
import '../features/home/main_screen.dart';
import '../features/home/product_details.dart';
import '../features/home/view_all_product.dart';
class RoutePages {
  static String splashScreen = '/';
  static String loginScreen = '/login_screen';
  static String signupScreen = '/signup_screen';
  static String forgotPasswordScreen = '/forgot_password_screen';
  static String verificationCodeScreen = '/verification_code_screen';
  static String resetPasswordScreen = '/reset_password_screen';

  static String homeScreen = '/home_screen';

  static String accountInformation = '/account_information';
  static String editAccountInformation = '/edit_account_information';


  static String setting = '/setting';
  static String termsOfServices = '/terms_of_services';
  static String privacyPolicy = '/privacy_policy';
  static String aboutUs = '/about_us';

  // static String homePage = '/home_page';
  // static String wishlistPage = '/wishlist_page';
  static String cartPage = '/cart_page';

  static String productDetails = '/product_details';
  static String viewAllProduct = '/view_all_product';
}


final getPages = [
  GetPage(name: RoutePages.splashScreen, page: () => SplashScreen()),
  GetPage(name: RoutePages.loginScreen, page: () => LoginScreen()),
  GetPage(name: RoutePages.signupScreen, page: () => SignupScreen()),
  GetPage(name: RoutePages.forgotPasswordScreen, page: () => ForgotPasswordScreen()),
  GetPage(name: RoutePages.verificationCodeScreen, page: () => VerificationCodeScreen()),
  GetPage(name: RoutePages.resetPasswordScreen, page: () => ResetPasswordScreen()),
  GetPage(name: RoutePages.homeScreen, page: () => HomeScreen()),


  GetPage(name: RoutePages.accountInformation, page: () => AccountInformation()),
  GetPage(name: RoutePages.editAccountInformation, page: () => EditAccountInformation()),

  GetPage(name: RoutePages.setting, page: () => Setting()),
  GetPage(name: RoutePages.termsOfServices, page: () => TermsOfServices()),
  GetPage(name: RoutePages.privacyPolicy, page: () => PrivacyPolicy()),
  GetPage(name: RoutePages.aboutUs, page: () => AboutUs()),

  // GetPage(name: RoutePages.homePage, page: () => HomePage()),
  // GetPage(name: RoutePages.wishlistPage, page: () => WishlistPage(favouriteProducts: [],)),
  GetPage(name: RoutePages.cartPage, page: () => CartPage()),


  GetPage(name: RoutePages.productDetails, page: () => ProductDetails(),),
  GetPage(name: RoutePages.viewAllProduct, page: () => ViewAllProduct(),),


];
