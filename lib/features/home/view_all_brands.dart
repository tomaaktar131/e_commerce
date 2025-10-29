import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Data/service/api_constant.dart';
import '../../controller/home_page_controller.dart';
import '../../routes/route.dart';

class ViewAllBrands extends StatefulWidget {
  const ViewAllBrands({super.key});

  @override
  State<ViewAllBrands> createState() => _ViewAllBrandsState();
}

class _ViewAllBrandsState extends State<ViewAllBrands> {
  final _controller =Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("All Brands")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(()=>
               GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    final brandLogo = _controller.brands[index].brandImage;
                    final brandName = _controller.brands[index].name;
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
                              height: 40,
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
                  itemCount: _controller.brands.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 2.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
