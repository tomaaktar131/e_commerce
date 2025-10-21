import 'package:e_commerce_project/controller/auth_controller.dart';
import 'package:e_commerce_project/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/custom_widgets/custom_elevated_button.dart';
import '../../core/custom_widgets/custom_text_field.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
final AuthController _controller= Get.put(AuthController());

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
                'New Password',
                style: AppTextStyle.largeHeading,
              ),

              SizedBox(height: 200),

              Form(
                key: _controller.newPasswordFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      obscure: _controller.newPasswordObscure.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _controller.newPasswordObscure.value = !_controller.newPasswordObscure.value;
                          });
                        },
                        icon: Icon(
                          _controller.newPasswordObscure.value ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),

                      label: 'Password',
                      hint: 'Enter new Password',
                      controller: _controller.newPasswordController,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      obscure: _controller.confirmNewPasswordObscure.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _controller.confirmNewPasswordObscure.value = !_controller.confirmNewPasswordObscure.value;
                          });
                        },
                        icon: Icon(
                          _controller.confirmNewPasswordObscure.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),

                      label: 'Confirm Password',
                      hint: 'Re enter  Password',
                      validator: _controller.validNewPassword,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 300),

              Text(
                textAlign: TextAlign.center,
                'Please write your new password.',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColor.grayColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'inter',
                  height: 1.4,
                ),
              ),
              SizedBox(height: 25),

              CustomElevationButton(
                label: 'Reset Password',
                onPress: () {
                  if(_controller.newPasswordFormKey.currentState!.validate()) {
                    Get.offAllNamed(RoutePages.loginScreen);
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 16),
            ],
          ),
        ),
      ),
    );
  }
}
