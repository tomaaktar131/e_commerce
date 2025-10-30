import 'package:e_commerce_project/Data/service/api_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WishlistController extends GetxController {
  final String userId = "25"; // তোমার user id (লগইন ইউজারের আইডি)
  final String baseUrl = "https://e-bazar-latest.onrender.com/shoping/wisher";

  // প্রতিটা প্রোডাক্টের জন্য: true মানে user wish করেছে
  RxMap<int, bool> wishlistStatus = <int, bool>{}.obs;

  // ✅ প্রোডাক্ট অনুযায়ী wishers list লোড করা
  Future<void> loadProductWisherList(int productId) async {
    try {
      final response = await http.get(Uri.parse("${ApiConstant.baseUrl}" "${ApiConstant.wisherListEndPoints(productId)}"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // ধরছি data["wisher"] হলো সেই list যেখানে user id গুলো আছে
        List wishers = data["wishers"];

        // দেখব আমার userId ওখানে আছে কিনা
        bool isWished = wishers.contains(userId);


        wishlistStatus[productId] = isWished;
      }
    } catch (e) {
      print("Error loading wisher list: $e");
    }
  }

  // ❤️ Toggle wishlist (add/remove)
  Future<void> toggleWishlist(int productId) async {
    try {
      final isWished = wishlistStatus[productId] ?? false;

      // Server এ POST request পাঠানো হবে, ওখানে user id backend handle করবে
      final response = await http.post(Uri.parse("${ApiConstant.baseUrl}" "${ApiConstant.wisherListEndPoints(productId)}"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"user": userId}));

      if (response.statusCode == 200) {
        // Success হলে toggle করে দেবে
        wishlistStatus[productId] = !isWished;
      } else {
        print("Failed to toggle wishlist: ${response.statusCode}");
      }
    } catch (e) {
      print("Toggle wishlist error: $e");
    }
  }
}
