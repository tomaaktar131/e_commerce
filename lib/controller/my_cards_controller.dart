import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCardsController extends GetxController {
  ///<============= my cards===============///

  RxList<Map<String, String>> cards = [
    {
      'ownerName': 'Md Bayzid Hosen',
      'cardNumber': '5254 **** **** 7690',
      'balance': '3,763.87',
      'cardType': 'Visa Classic',
    },
    {
      'ownerName': 'Md',
      'cardNumber': '5254 **** **** 7690',
      'balance': '3,763.87',
      'cardType': 'Visa Classic',
    },
    {
      'ownerName': 'Jane Doe',
      'cardNumber': '4123 **** **** 5678',
      'balance': '5,120.50',
      'cardType': 'Visa Gold',
    },
  ].obs;
  RxBool isSaveAddress = false.obs;
  toggleSwitch(bool value) {
    isSaveAddress.value = value;
  }

  final formKey = GlobalKey<FormState>();
  final cardOwnerCtrl = TextEditingController(text: 'Md Bayzid Hosen');
  final cardNumCtrl = TextEditingController(text: "+880 1893032348");
  final cardEXPCtrl = TextEditingController(text: '25/25');
  final cardCVVCtrl = TextEditingController(text: "7763");

  RxInt selectedIndex = 0.obs;

  selectedMethod(index) {
    selectedIndex.value = index;
    refresh();
  }
}
