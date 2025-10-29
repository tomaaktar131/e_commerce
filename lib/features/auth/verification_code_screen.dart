import 'dart:convert';

import 'package:e_commerce_project/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../Data/helpers/time_formater.dart';
import '../../Data/service/api_checker.dart';
import '../../Data/service/api_clint.dart';
import '../../Data/service/api_constant.dart';
import '../../core/custom_widgets/custom_elevated_button.dart';
import '../../routes/route.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final  _controller = Get.find<AuthController>();

  @override
  void initState() {
    _controller.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispostTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffFEFEFE)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                SizedBox(height: 0),
                Text(
                  textAlign: TextAlign.center,
                  'Verification Code',
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
                  key: _controller.otpFormKey,
                  child: Column(
                    children: [
                      Pinput(
                        length: 6,
                        controller: _controller.otpController,
                        validator: (v) {
                          if (v == null || v.length < 4) {
                            return "Enter a valid code";
                          }
                          return null;
                        },
                        defaultPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          textStyle: TextStyle(
                            fontSize: 22,
                            color: Color(0xff1D1E20),
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          textStyle: TextStyle(
                            fontSize: 22,
                            color: Color(0xff1D1E20),
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.orange, width: 2),
                          ),
                        ),
                        errorPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          textStyle: TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),



                if (_controller.enableResent.value)
                  Column(
                    children: [
                      SizedBox(height: 146,),
                      TextButton(
                        onPressed: () async {
                          _controller.startTimer();
                          _controller.isLoading(true);
                          final headers = {'Content-Type': 'application/json'};
                          final response = await ApiClient.postData(
                            ApiConstant.forgetPassword,
                            jsonEncode({"username": Get.arguments}), // Using Get.arguments to get username
                            headers: headers,
                          );
                          if (response.statusCode != 200) {
                            ApiChecker.checkApi(response);
                          }
                          _controller.isLoading(false);
                        },
                        child: Text('Resent OTP'),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      SizedBox(height: 167,),
                      RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: formatTime(_controller.secondsRemaining.value),
                              style: TextStyle(
                                color: Colors.black,
                                height: 1.4,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),

                              children: [
                                TextSpan(
                                  text: "resend confirmation code.",
                                  style: TextStyle(
                                    color: AppColor.grayColor,
                                    height: 1.4,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )),
                    ],
                  ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                CustomElevationButton(
                  isLoading: _controller.isLoading.value,
                  label: 'Confirm Code',
                  onPress: () {
                    if (_controller.otpFormKey.currentState!.validate()) {
                      _controller.otpVerification(_controller.otpController.text, Get.arguments);
                    }
                  },
                ),

                SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
