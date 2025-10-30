import 'package:e_commerce_project/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/setting_controller.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final _controller= Get.find<SettingController>();
  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.getPrivacyPolicyData();
      _controller.getAboutUsData();
      _controller.getTermsAndServicesData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            height: 1.1,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            ListTile(
              tileColor: Color(0xffF5F6FA),
              onTap: (){
                Get.toNamed(RoutePages.termsOfServices);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              leading: SvgPicture.asset('assets/icons/setting_tarm&services.svg'),
              title: Text('Terms of Services',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff1D1E20),
              ),),
            ),
            SizedBox(height: 12,),
            ListTile(
              tileColor: Color(0xffF5F6FA),
              onTap: (){Get.toNamed(RoutePages.privacyPolicy);},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              leading: SvgPicture.asset('assets/icons/Setting_privecy_policy.svg'),
              title: Text('Privacy Policys',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff1D1E20),
              ),),
            ),
            SizedBox(height: 12,),
            ListTile(
              tileColor: Color(0xffF5F6FA),
              onTap: (){Get.toNamed(RoutePages.aboutUs);},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              leading: SvgPicture.asset('assets/icons/setting_about_us.svg'),
              title: Text('About Us',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff1D1E20),
              ),),
            ),
            SizedBox(height: 12,),


          ],
        ),
      ),
    );
  }
}
