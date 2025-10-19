import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class BrandLogo extends StatelessWidget {
  final String imagePath;
  final String label;
  const BrandLogo({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffF5F6FA),
            borderRadius: BorderRadius.circular(10)
        ),
        height: 50,
        width: 115,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath),
            SizedBox(width: 18,),
            Text(label,style: TextStyle(
              fontWeight: FontWeight.w500,fontSize: 15,height: 1.1,
            ),),
          ],
        ),
      ),
    );
  }
}
