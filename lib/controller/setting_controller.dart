import 'package:get/get.dart';
import 'package:e_commerce_project/Data/service/api_clint.dart';
import 'package:e_commerce_project/Data/service/api_constant.dart';
import 'package:e_commerce_project/Data/model/terms&services_data_model.dart';
import 'package:e_commerce_project/Data/service/api_checker.dart';

class SettingController extends GetxController {
  var isLoading = false.obs;

  ///<==========================terms and services ==============================>///
  var termsData = <TermsAndServicesModel>[].obs;

  Future<void> getTermsAndServicesData() async {
    try {
      isLoading(true);

      final response = await ApiClient.getData(ApiConstant.termsAndServicesEndPoints);

      if (response.statusCode == 200) {
        final List<dynamic> dataList = response.body['data'];

        termsData.value =
            dataList.map((item) => TermsAndServicesModel.fromJson(item)).toList();
      } else {
        ApiChecker.checkApi(response);
      }
    } finally {
      isLoading(false);
    }
  }

  ///<==========================privacy policy ==============================>///


  var privacyPolicyData = <TermsAndServicesModel>[].obs;

  Future<void> getPrivacyPolicyData() async {
    try {
      isLoading(true);

      final response = await ApiClient.getData(ApiConstant.privacyPolicyEndPoints);

      if (response.statusCode == 200) {
        final List<dynamic> dataList = response.body['data'];

        privacyPolicyData.value =
            dataList.map((item) => TermsAndServicesModel.fromJson(item)).toList();
      } else {
        ApiChecker.checkApi(response);
      }
    } finally {
      isLoading(false);
    }
  }


///<==========================about us ==============================>///

  var aboutUsData = <TermsAndServicesModel>[].obs;

  Future<void> getAboutUsData() async {
    try {
      isLoading(true);

      final response = await ApiClient.getData(ApiConstant.aboutUsEndPoints);

      if (response.statusCode == 200) {
        final List<dynamic> dataList = response.body['data'];

        aboutUsData.value =
            dataList.map((item) => TermsAndServicesModel.fromJson(item)).toList();
      } else {
        ApiChecker.checkApi(response);
      }
    } finally {
      isLoading(false);
    }
  }

}
