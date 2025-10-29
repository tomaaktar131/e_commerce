import 'package:e_commerce_project/features/auth/login_screen.dart';
import 'package:e_commerce_project/features/auth/signup_screen.dart';
import 'package:e_commerce_project/features/splash/splash_screen.dart';

import 'package:get/get.dart';

import '../features/auth/forgot_password_screen.dart';
import '../features/auth/reset_password_screen.dart';
import '../features/auth/verification_code_screen.dart';
import '../features/cart/add_new_card.dart';
import '../features/cart/add_payment_method.dart';
import '../features/cart/cart_page.dart';
import '../features/drawer_screen/my_cards/add_card.dart';
import '../features/drawer_screen/my_cards/my_cards.dart';
import '../features/drawer_screen/order/order_completed_tab.dart';
import '../features/drawer_screen/order/order_page.dart';
import '../features/drawer_screen/order/order_to_received_tab.dart';
import '../features/drawer_screen/setting/about_us.dart';
import '../features/drawer_screen/setting/privacy_policy.dart';
import '../features/drawer_screen/setting/setting.dart';
import '../features/drawer_screen/setting/terms_of_services.dart';
import '../features/drawer_screen/user_information/account_information.dart';
import '../features/drawer_screen/user_information/edit_account_information.dart';
import '../features/cart/add_delivery_address.dart';
import '../features/home/add_review_page.dart';
import '../features/home/all_review_page.dart';
import '../features/home/choose_brand_page.dart';
import '../features/home/home_page.dart';
import '../features/cart/order_confirmed.dart';
import '../features/home/view_all_brands.dart';
import '../features/main page/main_page.dart';
import '../features/home/product_details.dart';
import '../features/home/view_all_product.dart';
import '../features/wishlist/wishlist_page.dart';

class RoutePages {
  static String splashScreen = '/';
  static String loginScreen = '/login_screen';
  static String signupScreen = '/signup_screen';
  static String forgotPasswordScreen = '/forgot_password_screen';
  static String verificationCodeScreen = '/verification_code_screen';
  static String resetPasswordScreen = '/reset_password_screen';

  static String mainPage = '/main_page';

  static String accountInformation = '/account_information';
  static String editAccountInformation = '/edit_account_information';
  static String myCards = '/MyCards';


  static String orderPage = '/OrderPage';
  static String orderCompletedTab = '/OrderCompletedTab';
  static String orderToReceivedTab = '/OrderToReceivedTab';

  static String setting = '/setting';
  static String termsOfServices = '/terms_of_services';
  static String privacyPolicy = '/privacy_policy';
  static String aboutUs = '/about_us';

  static String homePage = '/home_page';
  static String wishlistPage = '/wishlist_page';
  static String cartPage = '/cart_page';
  static String addCard = '/AddCard';

  static String productDetails = '/product_details';
  static String viewAllProduct = '/view_all_product';
  static String viewAllBrands = '/ViewAllBrands';
  static String chooseBrandPage = '/choose_brandPage';
  static String allReviewPage = '/AllReviewPage';
  static String addReviewPage = '/AddReviewPage';
  static String orderConfirmed = '/OrderConfirmed';
  static String addDeliveryAddress = '/AddDeliveryAddress';
  static String addPaymentMethod = '/AddPaymentMethod';
  static String addNewCard = '/addPaymentMethod';
}

final getPages = [
  GetPage(name: RoutePages.splashScreen, page: () => SplashScreen()),
  GetPage(name: RoutePages.loginScreen, page: () => LoginScreen()),
  GetPage(name: RoutePages.signupScreen, page: () => SignupScreen()),
  GetPage(
    name: RoutePages.forgotPasswordScreen,
    page: () => ForgotPasswordScreen(),
  ),
  GetPage(
    name: RoutePages.verificationCodeScreen,
    page: () => VerificationCodeScreen(),
  ),
  GetPage(
    name: RoutePages.resetPasswordScreen,
    page: () => ResetPasswordScreen(),
  ),
  GetPage(name: RoutePages.mainPage, page: () => MainPage()),

  GetPage(
    name: RoutePages.accountInformation,
    page: () => AccountInformation(),
  ),
  GetPage(
    name: RoutePages.editAccountInformation,
    page: () => EditAccountInformation(),
  ),

  GetPage(name: RoutePages.myCards, page: () => MyCards()),


  GetPage(name: RoutePages.orderPage, page: () => OrderPage()),
  GetPage(name: RoutePages.orderCompletedTab, page: () => OrderCompletedTab()),
  GetPage(
    name: RoutePages.orderToReceivedTab,
    page: () => OrderToReceivedTab(),
  ),

  GetPage(name: RoutePages.setting, page: () => Setting()),
  GetPage(name: RoutePages.termsOfServices, page: () => TermsOfServices()),
  GetPage(name: RoutePages.privacyPolicy, page: () => PrivacyPolicy()),
  GetPage(name: RoutePages.aboutUs, page: () => AboutUs()),

  GetPage(name: RoutePages.homePage, page: () => HomePage()),
  GetPage(name: RoutePages.wishlistPage, page: () => WishlistPage()),
  GetPage(name: RoutePages.cartPage, page: () => CartPage()),
  GetPage(name: RoutePages.addCard, page: () => AddCard()),

  GetPage(name: RoutePages.productDetails, page: () => ProductDetails()),
  GetPage(name: RoutePages.viewAllProduct, page: () => ViewAllProduct()),
  GetPage(name: RoutePages.viewAllBrands, page: () => ViewAllBrands()),
   GetPage(name: RoutePages.chooseBrandPage, page: () => ChooseBrandPage()),
  GetPage(name: RoutePages.allReviewPage, page: () => AllReviewPage()),
  GetPage(name: RoutePages.addReviewPage, page: () => AddReviewPage()),
  GetPage(name: RoutePages.orderConfirmed, page: () => OrderConfirmed()),
  GetPage(
    name: RoutePages.addDeliveryAddress,
    page: () => AddDeliveryAddress(),
  ),
  GetPage(name: RoutePages.addPaymentMethod, page: () => AddPaymentMethod()),
  GetPage(name: RoutePages.addNewCard, page: () => AddNewCard()),
];
