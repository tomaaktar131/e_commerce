import 'package:e_commerce_project/core/custom_widgets/custom_elevated_button.dart';
import 'package:e_commerce_project/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../core/theme/app_colors.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  int selectedMethod = 0; //  0 = Mastercard, 1 = PayPal, 2 = Bank
  final _controller =Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Card',
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
            //  Payment Method Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMethodIcon(
                  0,
                  "assets/icons/mastercard.png",
                  "Mastercard",
                ),
                _buildMethodIcon(1, 'assets/icons/paypal.png', "PayPal"),
                _buildMethodIcon(2, 'assets/icons/bank.png', "Bank"),
              ],
            ),
            SizedBox(height: 24),
            SizedBox(height: 20),
            _inputField('Card Owner', _controller.cardOwnerCtrl),
            _inputField('Card Number', _controller.cardNumCtrl),
            Row(
              children: [
                Expanded(child: _inputField('EXP', _controller.cardEXPCtrl)),
                SizedBox(width: 15),
                Expanded(child: _inputField('CVV',_controller.cardCVVCtrl)),
              ],
            ),

            Spacer(),

            //  Add Card Button
            CustomElevationButton(label: 'Add Card', onPress: () {
              Get.toNamed(RoutePages.myCards);
            },)
          ],
        ),
      ),
    );
  }

  Widget _buildMethodIcon(int index, image, String label) {
    bool isSelected = selectedMethod == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = index;
        });
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Color(0xffFFEEE3) : Color(0xffF5F6FA),
            border: isSelected? BoxBorder.all(color: Color(0xffFF5F00),width: 1):null
        ),

        child: Image.asset(image),
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
