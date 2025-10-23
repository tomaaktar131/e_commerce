import 'package:e_commerce_project/core/custom_widgets/custom_elevated_button.dart';
import 'package:e_commerce_project/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class OrderConfirmed extends StatelessWidget {
  const OrderConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 169),
            Image.asset('assets/images/order_confirmed.png'),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Order Confirmed!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1D1E20),
                ),
              ),
            ),
            SizedBox(height: 170),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){
                  Get.offNamed(RoutePages.orderPage);
                },
                child: Text(
                  'Go to Orders',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            SizedBox(height: 15,),
            Spacer(),
            CustomElevationButton(label: 'Continue Shopping', onPress: () {
              Get.offNamed(RoutePages.homeScreen);
            },)
          ],
        ),
      ),
    );
  }
}
