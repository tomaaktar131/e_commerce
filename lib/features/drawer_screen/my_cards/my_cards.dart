import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../routes/route.dart';

class MyCards extends StatefulWidget {
  const MyCards({super.key});

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {

  final String ownerName= 'Md Bayzid Hosen';
  final String cardNumber= '5254 **** **** 7690';
  final String balance= '3,763.87';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cards',
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
                        cardNumber,
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
                        "\$$balance",
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
                        ownerName,
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
                    Get.toNamed(RoutePages.addCard);
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






              ],
            ),
          ),
        ],
      ),
    );
  }
}
