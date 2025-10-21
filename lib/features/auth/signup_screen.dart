import 'package:e_commerce_project/controller/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/custom_widgets/custom_elevated_button.dart';
import '../../core/custom_widgets/custom_text_field.dart';
import '../../routes/route.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _authController = Get.put(AuthController());
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
                'Sign Up',
                style: AppTextStyle.largeHeading,
              ),

              SizedBox(height: 152),

              Form(
                key: _authController.signupFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Name',
                      hint: 'Enter your Name',
                      controller: _authController.signupNameController,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      validator: _authController.validEmail,
                      label: 'Email',
                      hint: 'Enter your Email',
                      controller: _authController.signupEmailController,
                    ),
                    SizedBox(height: 20),
                    Obx(()=>   CustomTextField(
                      validator: _authController.validPassword,
                      obscure: _authController.signupObscure.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _authController.signupObscure.value =
                                !_authController.signupObscure.value;
                          });
                        },
                        icon: Icon(
                          _authController.signupObscure.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),

                      label: 'Password',
                      hint: 'Enter your Password',
                      controller: _authController.signupPasswordController,
                    ),),
                  ],
                ),
              ),

              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                 Obx(()=> Switch(

                    activeTrackColor: Color(0xff34C759),
                    value: _authController.signupRememberMe.value,
                    onChanged: _authController.signupToggleSwitch,
                  ),)
                ],
              ),

              SizedBox(height: 168),
              SizedBox(height: 25),

              CustomElevationButton(
                label: 'Sign Up',
                onPress: () {
                  if(_authController.signupFormKey.currentState!.validate()) {
                    Get.offAllNamed(RoutePages.homeScreen);
                  }
                },
              ),

              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Haven an account ? ",
                  style: TextStyle(
                    color: AppColor.grayColor,
                    height: 1.4,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),

                  children: [
                    TextSpan(
                      text: "Sign in",
                      style: TextStyle(
                        color: Colors.black,
                        height: 1.4,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
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
