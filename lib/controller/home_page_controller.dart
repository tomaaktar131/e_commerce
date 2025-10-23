import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController{
  ///<========= Product Details page ==============> ///

  RxInt selectedIndex=0.obs;
  RxBool isExpanded = false.obs;

  ///<===============home page=================>///

RxBool isClicked =false.obs;

///<================Add review page =================>///
  final TextEditingController nameController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  RxDouble rating = 2.5.obs;


}