import 'dart:io';

import 'package:e_commerce_project/core/theme/app_colors.dart';
import 'package:e_commerce_project/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/user_info_controller.dart';
import '../../../Data/service/api_constant.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({super.key});

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  final _controller = Get.find<UserInfoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Account Information',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            height: 1.1,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Obx(
                      () {
                        final userInfo = _controller.userInfo.value;
                    ImageProvider<Object>? backgroundImage;
                    Widget? child;

                    if (_controller.imagePath.value.isNotEmpty) {
                      backgroundImage =
                          FileImage(File(_controller.imagePath.value));
                    }
                    else if (userInfo?.image != null &&
                        userInfo!.image!.isNotEmpty) {
                      backgroundImage = NetworkImage("${ApiConstant.baseUrl}"
                          "${userInfo.image!}",);
                    }
                    else {
                      child = const Icon(Icons.person, size: 80);
                    }

                    return CircleAvatar(
                      radius: 80,
                      backgroundImage: backgroundImage,
                      child: child,
                    );
                  }),
            ),
            SizedBox(height: 20),
            Obx(() {
              final userInfo = _controller.userInfo.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow('Name', userInfo?.firstName ?? ''),
                  SizedBox(height: 10),
                  _infoRow('Email', userInfo?.email ?? ''),
                  SizedBox(height: 10),
                  _infoRow('Phone Number', userInfo?.phone ?? ''),

                  SizedBox(height: 10),
                  _infoRow('Country', userInfo?.country ?? ""),
                  SizedBox(height: 10),
                  _infoRow('City', userInfo?.city ?? ""),
                  SizedBox(height: 10),
                  _infoRow('Address', userInfo?.address ?? ""),
                  SizedBox(height: 25),
                ],
              );
            }),
            ElevatedButton(
              onPressed: () {
                _controller.fetchUserInfoData(updateControllers: true);

                Get.toNamed(RoutePages.editAccountInformation);
              },

              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 55),
                backgroundColor: Color(0xffFEFEFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  side: BorderSide(color: AppColor.primaryColor, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/edit_pen_icon.svg'),
                  Text(' Edit', style: TextStyle(color: AppColor.primaryColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColor.grayColor,
              height: 1.1,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 1.1,
              color: Color(0xff1D1E20),
            ),
          ),
        ],
      ),
    );
  }
}
