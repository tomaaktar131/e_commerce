import 'package:get/get.dart';

import '../../core/custom_widgets/custom_snackbar.dart';


class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) async {
    if (response.statusCode !=200 || response.statusCode!=201) {
      if (response.statusCode == 401) {


      } else {
        showCustomSnackBar(response.statusText!, getXSnackBar: getXSnackBar);
      }
    }
  }
}