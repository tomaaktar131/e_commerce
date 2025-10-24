import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/home_page_controller.dart';
import '../../routes/route.dart';

class BrandLogo extends StatelessWidget {

   BrandLogo({super.key, });

final _controller=Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
         final brandLogo= _controller.brands[index]['icon'];
         final brandName= _controller.brands[index]["name"];
          return InkWell(
            onTap: (){
              Get.toNamed(RoutePages.chooseBrandPage,arguments: [brandName,brandLogo]);
            },
            child: Container(
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
                    child: SvgPicture.asset(brandLogo,fit:BoxFit.scaleDown,),
                  ),
                  SizedBox(width: 10),
                  Text(
                    brandName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 10);
        },
        itemCount: _controller.brands.length,
      ),
    );
  }
}
