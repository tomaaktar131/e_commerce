import 'package:get/get.dart';

import '../features/cart/cart_page.dart';
import '../features/home/home_page.dart';
import '../features/wishlist/wishlist_page.dart';

class MainPageController extends GetxController{
  /// <=========== Bottom Navigation Bar ===============>///

  RxInt currentIndex = 0.obs;


  RxList pages = [
    HomePage(),
    WishlistPage(),
    CartPage(),
  ].obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}