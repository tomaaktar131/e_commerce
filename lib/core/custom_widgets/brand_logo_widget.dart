import 'package:e_commerce_project/Data/service/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/home_page_controller.dart';
import '../../routes/route.dart';

class BrandLogo extends StatefulWidget {
  BrandLogo({super.key});

  @override
  State<BrandLogo> createState() => _BrandLogoState();
}

class _BrandLogoState extends State<BrandLogo> {
  final _controller =Get.find<HomePageController>();

  @override
  void initState() {
    _controller.fetchBrandsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final brandLogo = _controller.brands[index].brandImage;
            final brandName = _controller.brands[index].name;
            final brandId = _controller.brands[index].id;
            return _controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : InkWell(
                    onTap: () {
                      Get.toNamed(
                        RoutePages.chooseBrandPage,
                         arguments: [brandName, brandLogo],

                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F6FA),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffFEFEFE),
                            ),
                            child: Image.network(
                              "${ApiConstant.baseUrl}"
                              "$brandLogo",
                              fit: BoxFit.scaleDown,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/no-image-available.jpg',
                                  fit: BoxFit.cover,
                                );
                              } ,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              brandName,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                height: 1.1,
                              ),
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
      ),
    );
  }
}
