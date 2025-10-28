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

  final nameCtrl = TextEditingController(text: 'Md Bayzid hosen');
  final emailCtrl = TextEditingController(text: 'mdbayazid131@gmail.com');
  final phoneCtrl = TextEditingController(text: '+880 1990641482');
  final countryCtrl = TextEditingController(text: 'Bangladesh');
  final cityCtrl = TextEditingController(text: 'Faridpur');
  final addressCtrl = TextEditingController(text: 'Faridpur sador, Faridpur');

  RxString imagePath=''.obs;
Future getImage() async {
 final ImagePicker picker = ImagePicker();
 final image= await picker.pickImage(source: ImageSource.gallery);

 if(image != null){
imagePath.value= image.path.toString();
 }
}

  // RxList<UserInfoModel> userInfo = RxList<UserInfoModel>();
  //
  // Future<void> fetchUserInfoData() async {
  //   isLoading(true);
  //
  //   final response = await ApiClient.getData(ApiConstant.userInfoEndPoint);
  //   if (response.statusCode == 200) {
  //     List<dynamic> data = response.body['data'];
  //     userInfo.value =
  //         data.map((json) => UserInfoModel.fromJson(json)).toList();
  //   } else {
  //     ApiChecker.checkApi(response);
  //   }
  //   isLoading(false);
  // }

  @override
  void onInit() {
    super.onInit();
    fetchUserInfoData();
  }

  Rxn<UserInfoModel> userInfo = Rxn<UserInfoModel>();

  Future<void> fetchUserInfoData() async {
    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.userInfoEndPoint);

    if (response.statusCode == 200) {
      var data = response.body['data'];
      userInfo.value = UserInfoModel.fromJson(data);
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }

  // Future<void> updateUserInfo({
  //   required String firstName,
  //   required String email,
  //   required String phone,
  //   required String country,
  //   required String city,
  //   required String address,
  // }) async {
  //   isLoading(true);
  //
  //   final body = {
  //     "first_name": firstName,
  //     "email": email,
  //     "phone": phone,
  //     "country": country,
  //     "city": city,
  //     "address": address,
  //   };
  //
  //   final response = await ApiClient.putMultipartData( ApiConstant.userInfoEndPoint, multipartBody: [
  //
  //   ];
  //
  //   if (response.statusCode == 200) {
  //     await fetchUserInfoData();
  //     Get.snackbar("Success", "Profile updated successfully!");
  //   } else {
  //     ApiChecker.checkApi(response);
  //   }
  //
  //   isLoading(false);
  // }

  Future<void> updateUserInfo({
    required String firstName,
    required String email,
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
        "email": email,
        "phone": phone,
        "country": country,
        "city": city,
        "address": address,
      };

      List<MultipartBody> multipartList = [];

      // যদি ছবি থাকে, তাহলে multipartList এ দাও
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
        Get.toNamed(RoutePages.mainPage);// Update view data
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
