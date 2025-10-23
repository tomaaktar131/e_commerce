import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/cart_controller.dart';
import '../../core/custom_widgets/custom_elevated_button.dart';
import '../../core/theme/app_colors.dart';
import '../../routes/route.dart';

class AddPaymentMethod extends StatefulWidget {
  const AddPaymentMethod({super.key});

  @override
  State<AddPaymentMethod> createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
final _controller =Get.put(CartController());
  bool _isSaveAddress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xff1D1E20),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 185,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 185,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F6FA),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: ClipRRect(
                        child: Image(
                          image: AssetImage('assets/images/debit_card_bg.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      right: 25,
                      child: SvgPicture.asset(
                        'assets/images/product/visa_icon_on_card.svg',
                      ),
                    ),
                    Positioned(
                      top: 89,
                      left: 25,
                      child: Text(
                        'Visa Classic',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFEFEFE),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 111,
                      left: 25,
                      child: Text(
                        '5254 **** **** 7690',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,

                          color: Color(0xffFEFEFE),
                          letterSpacing: 3.85,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 143,
                      left: 25,
                      child: Text(
                        '3,763.87',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFEFEFE),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      left: 25,
                      child: Text(
                        'Mrh Raju',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFEFEFE),
                        ),
                      ),
                    ),
                  ],
                );
              },
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 10);
              },
              itemCount: 2,
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RoutePages.addNewCard);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: AppColor.primaryColor),
                    ),
                    foregroundColor: AppColor.primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/add_new_card_+.svg'),
                      SizedBox(width: 5),
                      Text('Add new card'),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                _inputField('Card Owner', _controller.cardOwnerCtrl),
                _inputField('Card Number', _controller.cardNumCtrl),
                Row(
                  children: [
                    Expanded(child: _inputField('EXP', _controller.cardEXPCtrl)),
                    SizedBox(width: 15),
                    Expanded(child: _inputField('CVV', _controller.cardCVVCtrl)),
                  ],
                ),

                Row(
                  children: [
                    Text(
                      'Save card info',
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
                      inactiveTrackColor: Color(0xff34C759),

                      value: _isSaveAddress,
                      onChanged: (bool value) {
                        setState(() {
                          _isSaveAddress = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 120),

                CustomElevationButton(
                  label: 'Save card',
                  onPress: () {
                    Get.toNamed(RoutePages.cartPage);
                  },
                ),
              ],
            ),
          ),
        ],
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
            readOnly: true,
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
