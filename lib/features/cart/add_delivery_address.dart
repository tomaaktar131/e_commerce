import 'package:e_commerce_project/core/custom_widgets/custom_elevated_button.dart';
import 'package:e_commerce_project/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../core/theme/app_colors.dart';

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({super.key});

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
final _controller =Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Address',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xff1D1E20),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    SizedBox(height: 120),
                    Row(
                      children: [
                        Expanded(child: _inputField("Country", _controller.countryCtrl)),
                        SizedBox(width: 10),
                        Expanded(child: _inputField("City", _controller.cityCtrl)),
                      ],
                    ),
                    _inputField('Phone Number', _controller.phoneCtrl),
                    _inputField('Address', _controller.addressCtrl),
                  ],
                ),
              ),
        
              Row(
                children: [
                  Text(
                    'Save as primary address',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff1D1E20),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Manrope',
                      height: 1.1,
                    ),
                  ),
                  Spacer(),
        
                  Obx(()=> Switch(
                      activeTrackColor: Color(0xff34C759),
                      activeThumbColor: Colors.white,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor:Color(0xff34C759) ,
        
                      value: _controller.isSaveAddress.value,
                      onChanged: (bool value) {
                        _controller.isSaveAddress.value=value;
        
        
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              CustomElevationButton(
                label: 'Save Address',
                onPress: () {
                  Get.toNamed(RoutePages.cartPage);
                },
              )
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
