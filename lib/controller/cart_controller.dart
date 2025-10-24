import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  final RxString address = "Chhatak, Sunamgonj 12/8AB, Sylhet".obs;
  final RxString city = "Sylhet".obs;
  final RxString cardName = "Visa Classic".obs;
  final RxString cardNum = " **** 7690".obs;

  double get subtotal => cartItems.fold(0.0, (sum, item) {
    final price = item["price"];
    final quantity = item["quantity"];

    final safePrice = price is num
        ? price
        : price is String
        ? double.tryParse(price) ?? 0.0
        : 0.0;

    final safeQuantity = quantity is num ? quantity : 1;

    return sum + safePrice * safeQuantity;
  });

  double get shipping => 10;
  double get total => subtotal + shipping;

  increment(index) {
    cartItems[index]['quantity']++;
    cartItems.refresh();
  }

  decrement(index) {
    if (cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
      cartItems.refresh();
    }
  }

  delete(int index) {
    Get.defaultDialog(
      title: "Delete",
      middleText: "Are you sure you want to delete this item?",
      actions: [
        TextButton(
          onPressed: () {
            cartItems.removeAt(index);
            Get.back();
          },
          child: Text("Yes"),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text("No"),
        ),
      ],
    );
  }

  void addToCart(Map<String, dynamic> product) {
    final index = cartItems.indexWhere(
      (item) => item["productTitle"] == product["productTitle"],
    );
    if (index != -1) {
      cartItems[index]["quantity"] = (cartItems[index]["quantity"] ?? 0) + 1;
      cartItems.refresh();
    } else {
      // ✅ নতুন item এ quantity reset করে add করো
      cartItems.add({
        ...product,
        "quantity": 1, // ✅ Always start from 1
      });
    }
  }

  ///<========================delivery address add=================>///
  final phoneCtrl = TextEditingController(text: '+880 1990641482');
  final countryCtrl = TextEditingController(text: 'Bangladesh');
  final cityCtrl = TextEditingController(text: 'Faridpur');
  final addressCtrl = TextEditingController(text: 'Faridpur sador, Faridpur');
  RxBool isSaveAddress = false.obs;
}
