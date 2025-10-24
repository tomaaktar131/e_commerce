import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/my_cards_controller.dart';
import '../../../core/custom_widgets/debit_card_widget.dart';
import '../../../core/theme/app_colors.dart';
import '../../../routes/route.dart';

class MyCards extends StatefulWidget {
  const MyCards({super.key});

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {

  final _controller = Get.put(MyCardsController());

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
      body: SingleChildScrollView(
        child: Column(
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
      ),
    );
  }
}


