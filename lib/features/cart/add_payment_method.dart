import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../controller/my_cards_controller.dart';
import '../../core/custom_widgets/custom_elevated_button.dart';
import '../../core/custom_widgets/debit_card_widget.dart';
import '../../core/theme/app_colors.dart';
import '../../routes/route.dart';

class AddPaymentMethod extends StatefulWidget {
  const AddPaymentMethod({super.key});

  @override
  State<AddPaymentMethod> createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
final _controller =Get.put(MyCardsController());

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
                final card = _controller.cards[index];
                return DebitCardWidget(
                  ownerName: card['ownerName']!,
                  cardType: card['cardType']!,
                  cardNumber: card['cardNumber']!,
                  balance: card['balance']!,
                );
              },
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 10);
              },
              itemCount: _controller.cards.length,
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
                    Obx(()=> Switch(
                        activeTrackColor: Color(0xff34C759),
                        activeThumbColor: Colors.white,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Color(0xff34C759),

                        value: _controller.isSaveAddress.value,
                        onChanged: (value)=>_controller.toggleSwitch(value),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.18),

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
