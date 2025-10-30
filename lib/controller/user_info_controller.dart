import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Data/model/user_info_model.dart';
import '../Data/service/api_checker.dart';
import '../Data/service/api_clint.dart';
import '../Data/service/api_constant.dart';
import '../routes/route.dart';

class UserInfoController extends GetxController {
  var isLoading = false.obs;

  /// <================================= User info  ===============================> ///
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final countryCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

   RxString imagePath = ''.obs;
  // Future getImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final image = await picker.pickImage(source: ImageSource.gallery);
  //   print("========================================");
  //   print(imagePath.value);
  //   if (image != null) {
  //     imagePath.value = image.path.toString();
  //
  //   }
  // }


  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath.value = image.path; // reactive variable update
      print("===========================================Selected image path: ${imagePath.value}"); // console print
    } else {
      print("================================No image selected");
    }
  }



  @override
  void onInit() {
    super.onInit();
    fetchUserInfoData();
  }

  Rxn<UserInfoModel> userInfo = Rxn<UserInfoModel>();

  Future<void> fetchUserInfoData({bool updateControllers = false}) async {
    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.userInfoEndPoint);

    if (response.statusCode == 200) {
      var data = response.body['data'];
      userInfo.value = UserInfoModel.fromJson(data);

      if (updateControllers) {
        nameCtrl.text = userInfo.value?.firstName ?? '';
        emailCtrl.text = userInfo.value?.email ?? '';
        phoneCtrl.text = userInfo.value?.phone ?? '';
        countryCtrl.text = userInfo.value?.country ?? '';
        cityCtrl.text = userInfo.value?.city ?? '';
        addressCtrl.text = userInfo.value?.address ?? '';
      }
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }

  Future<void> updateUserInfo({
    required String firstName,
    required String phone,
    required String country,
    required String city,
    required String address,
    File? imageFile, // optional image
  }) async {
    isLoading(true);

    try {
      final body = {
        "first_name": firstName,
        "phone": phone,
        "country": country,
        "city": city,
        "address": address,
      };

      List<MultipartBody> multipartList = [];

      if (imageFile != null) {
        multipartList.add(MultipartBody('image', imageFile));
      }

      final response = await ApiClient.putMultipartData(
        ApiConstant.userInfoEndPoint,
        body,
        multipartBody: multipartList,
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Profile updated successfully!");
        await fetchUserInfoData();
       // Get.toNamed(RoutePages.mainPage); // Update view data
      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e) {
      print("Update Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
