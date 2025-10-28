import 'dart:io';

import 'package:e_commerce_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Data/helpers/prefs_helper.dart';
import '../../Data/utils/app_constants.dart';
import '../../controller/main_page_controller.dart';
import '../../controller/user_info_controller.dart';
import '../../core/custom_widgets/custom_elevated_button.dart';
import '../../routes/route.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _controller = Get.put(UserInfoController());
  final _mainPageController = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    final userInfo = _controller.userInfo.value;

    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 50),
            ListTile(
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: const Color(0xffF5F6FA),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    'assets/icons/drawer_icon/drawer_back.svg',
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
            ),

            SizedBox(height: 40),
            RefreshIndicator(
              onRefresh: () async {
                await _controller.fetchUserInfoData();
              },
              child: ListTile(
                onTap: () {},
                title: Text(
                  userInfo!.firstName,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    height: 1.1,
                  ),
                ),
                leading: CircleAvatar(
                  radius: 22,
                  backgroundColor: const Color(0xffF5F6FA),
                  backgroundImage: _controller.imagePath.isNotEmpty
                      ? FileImage(File(_controller.imagePath.toString()))
                      : null,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(RoutePages.accountInformation);
              },
              title: Text(
                'Account Information',
                style: TextStyle(
                  color: Color(0xff1D1E20),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
              ),
              leading: SvgPicture.asset(
                'assets/icons/drawer_icon/account_info.svg',
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(RoutePages.orderPage);
              },
              title: Text(
                'Order ',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff1D1E20),
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
              ),
              leading: SvgPicture.asset(
                'assets/icons/drawer_icon/order_info.svg',
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(RoutePages.myCards);
              },
              title: Text(
                'My Cards ',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff1D1E20),
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
              ),
              leading: SvgPicture.asset(
                'assets/icons/drawer_icon/my_card_info.svg',
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(RoutePages.setting);
              },
              title: Text(
                'Settings ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
              ),
              leading: SvgPicture.asset(
                'assets/icons/drawer_icon/account_info.svg',
              ),
            ),
            Spacer(),
            ListTile(
              onTap: () {
                Get.bottomSheet(
                  Container(
                    height: 300,
                    padding: EdgeInsets.fromLTRB(20, 8, 20, 44),
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: Color(0xffE0E0E0), width: 1),
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/drawer_icon/bottom_sheed_icon.svg',
                        ),
                        SizedBox(height: 18),
                        Text(
                          'Logout',
                          style: TextStyle(
                            color: Color(0xffE25252),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Are you sure you want to log out?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xff6B7280),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 55),
                                  backgroundColor: Color(0xffF6F2FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      10,
                                    ),
                                    side: BorderSide(
                                      color: AppColor.primaryColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  await PrefsHelper.remove(
                                    AppConstants.bearerToken,
                                  );
                                  Get.offAllNamed(RoutePages.loginScreen);
                                },
                                child: Text(
                                  'Yes, Logout',
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    height: 1.1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: CustomElevationButton(
                                label: 'Cancel',
                                onPress: () {
                                  Get.back();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              title: Text(
                'Logout ',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xffFF5757),
                  fontWeight: FontWeight.w500,
                  height: 1.1,
                ),
              ),
              leading: SvgPicture.asset(
                'assets/icons/drawer_icon/logout_info.svg',
              ),
            ),
            SizedBox(height: 94),
          ],
        ),
      ),
      body: Obx(
        () => _mainPageController.pages[_mainPageController.currentIndex.value],
      ),

      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: _mainPageController.currentIndex.value,
          onTap: (index) {
            _mainPageController.changePage(index);
          },
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottomNB_Icon/bnb_home.svg',
                color: _mainPageController.currentIndex.value == 0
                    ? AppColor.primaryColor
                    : AppColor.grayColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottomNB_Icon/bnb_wishlist.svg',
                color: _mainPageController.currentIndex.value == 1
                    ? AppColor.primaryColor
                    : AppColor.grayColor,
              ),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottomNB_Icon/bnb_cart.svg',
                color: _mainPageController.currentIndex.value == 2
                    ? AppColor.primaryColor
                    : AppColor.grayColor,
              ),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}
