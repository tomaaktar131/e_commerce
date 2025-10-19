import 'dart:io';

import 'package:e_commerce_project/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/product_controller.dart';
import '../../../controller/user_info_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/brand_logo_widget.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_product_card.dart';
import '../../../routes/route.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(UserInfoController());
  final _productController = Get.put(ProductController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEFEFE),
        elevation: 0,
        leadingWidth: 68,
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CircleAvatar(

                backgroundColor: const Color(0xffF5F6FA),
                child: GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: SvgPicture.asset(
                    'assets/icons/drawer_icon/drawer_menu.svg',
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: const Color(0xffF5F6FA),
              child: SvgPicture.asset(
                'assets/icons/bag_icon.svg',
                height: 25,
                width: 25,
              ),
            ),
          ),
        ],
      ),

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
            ListTile(
              onTap: () {},
              title: Text(
                _controller.nameCtrl.text,
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
              onTap: () {},
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
              onTap: () {},
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
                                onPressed: () {Get.offAllNamed(RoutePages.loginScreen);},
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
                                onPress: () { Get.back();},
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: AppTextStyle.largeHeading,
                ),
                Text(
                  'Welcome to Laza',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff8F959E),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        // controller: controller,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          height: 1.1,
                          color: AppColor.grayColor,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: SvgPicture.asset('assets/icons/search_product.svg',height: 20,width: 20,fit: BoxFit.none,),
                          hintText: 'Search...',
                          filled: true,
                          fillColor: Color(0xFFF5F6FA),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: SvgPicture.asset('assets/icons/mice_icon_home.svg',height: 24,width: 24,fit: BoxFit.none,),
                    )
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Choose Brand',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,height: 1.1,color: Color(0xff1D1E20)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('View All',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,height: 1.1,color: Color(0xff8F959E))),
                    ),
                  ],
                ),
              ],
            ),
          ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BrandLogo(imagePath: 'assets/icons/brand_logo/adidas.svg', label: 'Adidas',),
                  BrandLogo(imagePath: 'assets/icons/brand_logo/adidas.svg', label: 'Adidas',),
                  BrandLogo(imagePath: 'assets/icons/brand_logo/adidas.svg', label: 'Adidas',),
                  BrandLogo(imagePath: 'assets/icons/brand_logo/adidas.svg', label: 'Adidas',),
                  BrandLogo(imagePath: 'assets/icons/brand_logo/adidas.svg', label: 'Adidas',),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Arrival',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,height: 1.1,color: Color(0xff1D1E20)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('View All',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,height: 1.1,color: Color(0xff8F959E))),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _productController.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final product = _productController.products[index];
                      return ProductCard(product: product);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),


    );
  }
}
