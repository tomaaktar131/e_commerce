import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/setting_controller.dart';

class AboutUs extends StatelessWidget {
   AboutUs({super.key});
  final settingController = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Terms of Service',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            height: 1.1,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                if (settingController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: settingController.aboutUsData.length,
                  itemBuilder: (context, index) {
                    final item = settingController.aboutUsData[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.heading,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff1F2937),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          item.description,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff4B5563),
                          ),
                        ),
                        SizedBox(height: 16),                    ],
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
