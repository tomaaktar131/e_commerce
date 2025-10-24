import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DebitCardWidget extends StatelessWidget {
  final String ownerName;
  final String cardType;
  final String cardNumber;
  final String balance;

  const DebitCardWidget({
    super.key,
    required this.ownerName,
    required this.cardType,
    required this.cardNumber,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 185,
          width: 300,
          decoration: BoxDecoration(
            color: Color(0xffF5F6FA),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/debit_card_bg.png',
              fit: BoxFit.cover,
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
            cardType,
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
            "\$ $balance",
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
  }
}