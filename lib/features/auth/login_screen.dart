import 'package:e_commerce_project/controller/view_product_controller.dart';
import 'package:e_commerce_project/core/theme/app_colors.dart';
import 'package:e_commerce_project/core/theme/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_project/routes/route.dart';

import '../../controller/auth_controller.dart';
import '../../core/custom_widgets/custom_elevated_button.dart';
import '../../core/custom_widgets/custom_text_field.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authController = Get.put(AuthController());
  final ctrl =  Get.put( ViewProductController());
  @override
  Widget build(BuildContext context) {
    // ctrl.getProducts();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              SizedBox(height: 105),

              Text(
                textAlign: TextAlign.center,
                'Welcome',
                style: AppTextStyle.largeHeading,
              ),

              Text(
                textAlign: TextAlign.center,
                'Please enter your data to continue',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColor.grayColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'inter',
                  height: 1.1,
                ),
              ),

              SizedBox(height: 120),

              Form(
                key: _authController.loginFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      validator: _authController.validUser,
                      label: 'Username',
                      hint: 'Enter your username',
                      controller: _authController.loginUserNameController,
                    ),
                    SizedBox(height: 20),
                    Obx(
                      () => CustomTextField(
                        validator: _authController.validPassword,
                        obscure: _authController.loginObscure.value,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _authController.loginObscure.value =
                                  !_authController.loginObscure.value;
                            });
                          },
                          icon: Icon(
                            _authController.loginObscure.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),

                        label: 'Password',
                        hint: 'Enter your Password',
                        controller: _authController.loginPasswordController,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  recognizer:TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(RoutePages.forgotPasswordScreen);
                    },
                  text: 'Forgot password?',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1.1,
                    color: Color(0xffEA4335),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    'Remember me',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff1D1E20),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Manrope',
                      height: 1.1,
                    ),
                  ),
                  Spacer(),

                  Obx(
                    () => Switch(
                      activeTrackColor: Color(0xff34C759),
                      activeThumbColor: Colors.white,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor:Color(0xff34C759) ,

                      value: _authController.loginRememberMe.value,
                      onChanged: _authController.loginToggleSwitch,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 120),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      'By connecting your account confirm that you agree \n with our ',
                  style: TextStyle(
                    color: AppColor.grayColor,
                    height: 1.4,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: 'Term and Condition',
                      style: TextStyle(
                        color: Colors.black,
                        height: 1.4,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),

              Obx(()=>
                 CustomElevationButton(
                  label: 'Login',
                  isLoading: _authController.isLoading.value,

                  onPress: () {
                    if (_authController.loginFormKey.currentState!.validate()) {
                      _authController.login(_authController.loginUserNameController.text, _authController.loginPasswordController.text);
                    }
                  },
                ),
              ),

              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Haven't an account ? ",
                  style: TextStyle(
                    color: AppColor.grayColor,
                    height: 1.4,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),

                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                        height: 1.4,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(RoutePages.signupScreen);
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 16),
            ],
          ),
        ),
      ),
    );
  }
}
