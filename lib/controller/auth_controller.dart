import 'dart:async';
import 'dart:convert';

import 'package:e_commerce_project/routes/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Data/helpers/prefs_helper.dart';
import '../Data/service/api_checker.dart';
import '../Data/service/api_clint.dart';
import '../Data/service/api_constant.dart';
import '../Data/utils/app_constants.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  /// <================================= login page ===============================> ///
  final loginUserNameController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  var loginRememberMe = false.obs;
  loginToggleSwitch(bool value) => loginRememberMe.value = value;

  var loginObscure = false.obs;
  void loginObscurePassword() => loginObscure.value = !loginObscure.value;

  login(String userName, password) async {
    isLoading(true);
    var headers = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
      ApiConstant.login,
      jsonEncode({"username": userName, "password": password}),
      headers: headers,
    );
    if (response.statusCode == 200) {
      await PrefsHelper.setString(
        AppConstants.bearerToken,
        response.body['access'],
      );
      Get.offAllNamed(RoutePages.mainPage);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }

  /// <================================= signUp page ===============================> ///
  final signupNameController = TextEditingController();
  final signupUsernameController = TextEditingController();
  final signupEmailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();

  var signupRememberMe = false.obs;
  signupToggleSwitch(bool value) => signupRememberMe.value = value;

  var signupObscure = false.obs;
  void signupObscurePassword() => signupObscure.value = !signupObscure.value;

  signUp(firstName, userName, email, password) async {
    isLoading(true);
    var headers = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
      ApiConstant.signup,
      jsonEncode({
        "first_name": firstName,
        "email": email,
        "username": userName,
        "password": password,
      }),
      headers: headers,
    );
    if (response.statusCode == 200) {
      await PrefsHelper.setString(
        AppConstants.bearerToken,
        response.body['access'],
      );
      Get.offAllNamed(RoutePages.mainPage);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }

  /// <================================= forget password page ===============================> ///
  final forgetPasswordUserController = TextEditingController();
  final forgetPasswordUserFormKey = GlobalKey<FormState>();

  forgetPassword(userName) async {
    isLoading(true);
    final headers = {'Content-Type': 'application/json'};
    final response = await ApiClient.postData(
      ApiConstant.forgetPassword,
      jsonEncode({"username": userName}),
      headers: headers,
    );

    if(response.statusCode==200){
      Get.toNamed(RoutePages.verificationCodeScreen,arguments:userName);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }

  /// <================================= OTP verification page ===============================> ///

  final otpController = TextEditingController();
  final otpFormKey = GlobalKey<FormState>();

  RxInt secondsRemaining = 30.obs;
  RxBool enableResent = false.obs;

  Timer? timer;

  void dispostTimer() {
    timer?.cancel();
    secondsRemaining.value = 30;
    enableResent.value = false;
  }

  void startTimer() {
    timer?.cancel();
    secondsRemaining.value = 30;
    enableResent.value = false;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        enableResent.value = true;
        timer.cancel();
      }
    });
  }

  otpVerification(String otp, userName) async {
    isLoading(true);
    final headers = {'Content-Type': 'application/json'};
    final response = await ApiClient.postData(
      ApiConstant.otoVerify(userName),
      jsonEncode({"otp": otp}),
      headers: headers,
    );

    if(response.statusCode==200){
      Get.toNamed(RoutePages.resetPasswordScreen,arguments: response.body['access']);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }




  /// <================================= new password page ===============================> ///
  final newPasswordController = TextEditingController();
  final newPasswordFormKey = GlobalKey<FormState>();

  RxBool newPasswordObscure = true.obs;
  RxBool confirmNewPasswordObscure = true.obs;

  String? validNewPassword(String? value) {
    if (newPasswordController.text.length < 6)
      return "Minimum password 6 character";
    if (newPasswordController.text != value) {
      return "Password not match";
    }

    return null;
  }

  resetPassword(String newPassword, refreshToken) async {
    isLoading(true);
    var headers = {'Content-Type': 'application/json',
      'Authorization': 'Bearer $refreshToken'};
    var response = await ApiClient.postData(
      ApiConstant.resetPassword,
      jsonEncode( {
        "new_password":newPassword,
      }),
      headers: headers,
    );
    if (response.statusCode == 200) {
      Get.offAllNamed(RoutePages.loginScreen);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }

  /// <================================= all validator logic ===============================> ///

  String? validEmail(String? value) {
    if (value == null || value.isEmpty) return "Please enter your email";
    if (!value.contains('@')) return "Please enter valid email";
    return null;
  }

  String? validUser(String? value) {
    if (value == null || value.isEmpty) return "Please enter your UserName";
    return null;
  }

  String? validPassword(String? value) {
    if (value == null || value.length < 5) {
      return 'Minimum password 5 character';
    }
    return null;
  }
}
