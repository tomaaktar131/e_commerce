import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_product_card.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEFEFE),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: const Color(0xffF5F6FA),
              child: SvgPicture.asset(
                'assets/icons/bag_icon.svg',
                height: 25,
                width: 25,
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 350,
                  width: 340,
                  child: Image.asset(product.imagePath_1, fit: BoxFit.fill),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
