import 'package:e_commerce_project/core/custom_widgets/custom_elevated_button.dart';
import 'package:e_commerce_project/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({super.key});

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  final _formKey = GlobalKey<FormState>();
  final _phoneCtrl = TextEditingController(text: '+880 1990641482');
  final _countryCtrl = TextEditingController(text: 'Bangladesh');
  final _cityCtrl = TextEditingController(text: 'Faridpur');
  final _addressCtrl = TextEditingController(text: 'Faridpur sador, Faridpur');
  bool isSaveAddress = false;
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 120),
                  Row(
                    children: [
                      Expanded(child: _inputField("Country", _countryCtrl)),
                      SizedBox(width: 10),
                      Expanded(child: _inputField("City", _cityCtrl)),
                    ],
                  ),
                  _inputField('Phone Number', _phoneCtrl),
                  _inputField('Address', _addressCtrl),
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

                Switch(
                  activeTrackColor: Color(0xff34C759),
                  activeThumbColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor:Color(0xff34C759) ,

                  value: isSaveAddress,
                  onChanged: (bool value) {
                    setState(() {
                      isSaveAddress=value;
                    });

                  },
                ),
              ],
            ),
            Spacer(),
            CustomElevationButton(label: 'Save Address', onPress: () {
              Get.toNamed(RoutePages.cartPage);
            },)
          ],
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
