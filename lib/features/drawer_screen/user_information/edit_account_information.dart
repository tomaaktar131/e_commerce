import 'dart:io';

import 'package:e_commerce_project/Data/service/api_constant.dart';
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
  final _controller = Get.find<UserInfoController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userInfo = _controller.userInfo.value;

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
          key: _formKey,
          child: ListView(
            children: [
              Align(
                alignment: Alignment.center,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Obx(() {
                      ImageProvider<Object>? backgroundImage;
                      Widget? child;
                      if (_controller.imagePath.value.isNotEmpty) {
                        backgroundImage = FileImage(
                          File(_controller.imagePath.value),
                        );
                      } else if (userInfo?.image != null &&
                          userInfo!.image!.isNotEmpty) {
                        backgroundImage = NetworkImage(
                          "${ApiConstant.baseUrl}"
                          "${userInfo.image!}",
                        );
                      } else {
                        child = const Icon(Icons.person, size: 80);
                      }

                      return CircleAvatar(
                        radius: 80,
                        backgroundImage: backgroundImage,
                        child: child,
                      );
                    }),
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
              _inputField('Name ', _controller.nameCtrl, false),
              _inputField('Email ', _controller.emailCtrl, true),
              _inputField('Phone Number ', _controller.phoneCtrl, false),
              Row(
                children: [
                  Expanded(
                    child: _inputField(
                      'Country ',
                      _controller.countryCtrl,
                      false,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: _inputField('City ', _controller.cityCtrl, false),
                  ),
                ],
              ),

              _inputField('Address ', _controller.addressCtrl, false),

              SizedBox(height: 26),
              CustomElevationButton(
                label: 'Save Changes',
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    _controller.updateUserInfo(
                      firstName: _controller.nameCtrl.text,
                      phone: _controller.phoneCtrl.text,
                      country: _controller.countryCtrl.text,
                      city: _controller.cityCtrl.text,
                      address: _controller.addressCtrl.text,
                      imageFile: _controller.imagePath.value.isNotEmpty
                          ? File(_controller.imagePath.value)
                          : null,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(
    String label,
    TextEditingController controller,
    bool isReadOnly,
  ) {
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
            readOnly: isReadOnly,
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
