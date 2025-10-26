import 'package:e_commerce_project/core/theme/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Data/helpers/prefs_helper.dart';
import '../../Data/utils/app_constants.dart';
import '../../routes/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    jumpToNextPage();
  }

  // jumpToNextPage() {
  //   Future.delayed(Duration(seconds: 3), () {
  //     Get.offNamed(RoutePages.loginScreen);
  //   });
  // }

  jumpToNextPage() {
    Future.delayed(Duration(seconds: 3), () async {
      var token = await PrefsHelper.getString(AppConstants.bearerToken);
      debugPrint(" issue token : $token");
      if (token.isNotEmpty) {
        Get.offAllNamed(RoutePages.mainPage);
      } else {
        Get.offAllNamed(RoutePages.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(child: SvgPicture.asset('assets/icons/splash_icon.svg',fit: BoxFit.none,)),
    );
  }
}
