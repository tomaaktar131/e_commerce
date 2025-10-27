
import 'package:e_commerce_project/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/custom_widgets/custom_elevated_button.dart';
import '../../core/custom_widgets/custom_text_field.dart';
import '../../routes/route.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final  _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffFEFEFE)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              SizedBox(height: 0),
              Text(
                textAlign: TextAlign.center,
                'Forgot Password',
                style: AppTextStyle.largeHeading,
              ),

              SizedBox(height: 68),
              SizedBox(
                height: 166,
                width: 225,
                child: SvgPicture.asset(
                  'assets/images/forget_image.svg',
                  fit: BoxFit.none,
                ),
              ),
              SizedBox(height: 80),

              Form(
                key: _authController.forgetPasswordUserFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      validator:_authController.validUser ,
                      label: 'Username',
                      hint: 'Enter your username',
                      controller: _authController.forgetPasswordUserController,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              SizedBox(height: 40),

              SizedBox(height: 168),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      "Please write your email to receive an\n confirmation code to set a new password.",
                  style: TextStyle(
                    color: AppColor.grayColor,
                    height: 1.4,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),

              Obx(()=> CustomElevationButton(
                  label: 'Confirm User Name',
                  isLoading: _authController.isLoading.value,
                  onPress: () {
                    if(_authController.forgetPasswordUserFormKey.currentState!.validate()) {
                      _authController.forgetPassword(_authController.forgetPasswordUserController.text.trim());
                    }
                  },
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
