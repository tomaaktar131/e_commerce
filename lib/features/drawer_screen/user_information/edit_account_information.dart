import 'dart:io';

import 'package:e_commerce_project/core/theme/app_colors.dart';
import 'package:e_commerce_project/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../controller/user_info_controller.dart';
import '../../../core/custom_widgets/custom_elevated_button.dart';

class EditAccountInformation extends StatefulWidget {
  const EditAccountInformation({super.key});

  @override
  State<EditAccountInformation> createState() => _EditAccountInformationState();
}

class _EditAccountInformationState extends State<EditAccountInformation> {
  final _controller = Get.put(UserInfoController());
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
        child: Form(
          key: _controller.formKey,
          child: ListView(
            children: [
              Align(
                alignment: Alignment.center,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: _controller.imagePath.isNotEmpty
                          ? FileImage(File(_controller.imagePath.toString()))
                          : null,
                    ),
                    Positioned(
                      bottom: -16,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          _controller.getImage();
                        },
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            'assets/images/profile_edit_pen.svg',
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _inputField('Name ', _controller.nameCtrl),
              _inputField('Email ', _controller.emailCtrl),
              _inputField('Phone Number ', _controller.phoneCtrl),
              Row(
                children: [
                  Expanded(
                    child: _inputField('Country ', _controller.countryCtrl),
                  ),
                  SizedBox(width: 15),
                  Expanded(child: _inputField('City ', _controller.cityCtrl)),
                ],
              ),

              _inputField('Address ', _controller.addressCtrl),

              SizedBox(height: 26),
              CustomElevationButton(
                label: 'Save Changes',
                onPress: () {
                  if (_controller.formKey.currentState!.validate()) {
                    Get.toNamed(RoutePages.homeScreen);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              height: 1.1,
              color: Color(0xff1D1E20),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: controller,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              height: 1.1,
              color: AppColor.grayColor,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF5F6FA),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) =>
                value == null || value.isEmpty ? 'Enter $label' : null,
          ),
        ],
      ),
    );
  }
}
