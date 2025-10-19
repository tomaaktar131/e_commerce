import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  /// <================================= login page ===============================> ///
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  var loginRememberMe = false.obs;
  loginToggleSwitch(bool value) => loginRememberMe.value = value;

  var loginObscure = false.obs;
  void loginObscurePassword() => loginObscure.value = !loginObscure.value;

  /// <================================= signUp page ===============================> ///
  final signupNameController = TextEditingController();
  final signupEmailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();

  var signupRememberMe = false.obs;
  signupToggleSwitch(bool value) => signupRememberMe.value = value;

  var signupObscure = false.obs;
  void signupObscurePassword() => signupObscure.value = !signupObscure.value;

  /// <================================= forget password page ===============================> ///
  final forgetPasswordEmailController = TextEditingController();
  final forgetPasswordEmailFormKey = GlobalKey<FormState>();

  /// <================================= OTP verification page ===============================> ///

  final otpController = TextEditingController();
  final otpFormKey = GlobalKey<FormState>();

  RxInt secondsRemaining  = 30.obs;
  RxBool enableResent = false.obs;

  Timer? timer;

  void dispostTimer (){
    timer?.cancel();
    secondsRemaining.value =30;
    enableResent.value=false;
  }

  void startTimer(){
    timer?.cancel();
    secondsRemaining.value =30;
    enableResent.value=false;
    timer= Timer.periodic(
      const Duration(seconds: 1), (timer){
    if(secondsRemaining.value>0){
      secondsRemaining.value--;
    }else{
      enableResent.value = true;
      timer.cancel();
    }
    }
    );
  }



  /// <================================= new password page ===============================> ///
  final newPasswordController = TextEditingController();
  final newPasswordFormKey = GlobalKey<FormState>();

  RxBool newPasswordObscure = true.obs;
  RxBool confirmNewPasswordObscure = true.obs;


 String? validNewPassword(String? value){
    if(newPasswordController.text.length<6)return "Minimum password 6 character";
    if(newPasswordController.text!=value) {
      return "Password not match";
    }

    return null;

  }


  /// <================================= all validator logic ===============================> ///

  String? validEmail(String? value) {
    if (value == null || value.isEmpty) return "Please enter your email";
    if (!value.contains('@')) return "Please enter valid email";
    return null;
  }

  String? validPassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Minimum password 6 character';
    }
    return null;
  }

  void submitForm() {
    if (loginFormKey.currentState!.validate()) {
      print("Email : ${loginEmailController.text} ");
      print("Email : ${loginPasswordController.text} ");
      print("Switch : $loginRememberMe ");
      print("Switch : $loginObscure ");
    }
  }
}
