import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandLogo extends StatelessWidget {
  BrandLogo({super.key});

 final List brands = [
    {"name": "Adidas", "icon": "assets/icons/brand_logo/adidas.svg"},
    {"name": "Nike", "icon": "assets/icons/brand_logo/nike.svg"},
    {"name": "Fila", "icon": "assets/icons/brand_logo/fila.svg"},
    {"name": "Adidas", "icon": "assets/icons/brand_logo/adidas.svg"},
    {"name": "Nike", "icon": "assets/icons/brand_logo/nike.svg"},
    {"name": "Fila", "icon": "assets/icons/brand_logo/fila.svg"},
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            height: 50,
            width: 115,
            decoration: BoxDecoration(
              color: Color(0xffF5F6FA),
              borderRadius: BorderRadius.circular(10),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffFEFEFE),
                  ),
                  child: SvgPicture.asset(brands[index]['icon'],fit:BoxFit.scaleDown,),
                ),
                SizedBox(width: 10),
                Text(
                  brands[index]["name"],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          );
        },
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 10);
        },
        itemCount: brands.length,
      ),
    );
  }
}
