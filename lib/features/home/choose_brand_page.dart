import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/home_page_controller.dart';
import '../../routes/route.dart';

class ChooseBrandPage extends StatefulWidget {
  const ChooseBrandPage({super.key});

  @override
  State<ChooseBrandPage> createState() => _ChooseBrandPageState();
}

class _ChooseBrandPageState extends State<ChooseBrandPage> {
  final _controller =Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final brandName = args[0];
    final brandLogo = args[1];

    final filteredProducts = _controller.products
        .where((product) => product["brand"] == brandName)
        .toList();
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Container(
          padding: EdgeInsets.all(10),
          height: 45,
          width: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffF5F6FA),
          ),
          child: SvgPicture.asset(brandLogo,),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${filteredProducts.length} Items",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1D1E20),
                      ),
                    ),
                    SizedBox(height: 5),

                    Text(
                      "Available in stock",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Container(
                      height: 37,
                      width: 60,

                      decoration: BoxDecoration(
                        color: Color(0xffF5F6FA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/sort.svg',fit: BoxFit.scaleDown,),
                            SizedBox(width: 5,),
                            Text(
                              'Sort',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff1D1E20),
                                height: 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),SizedBox(height: 20,),
            MasonryGridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredProducts.length,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,

              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              RoutePages.productDetails,
                            );_controller.setSelectedProduct(product);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),

                            child: Image(
                              height: 203,
                              width: double.infinity,
                              image: AssetImage(product["imagePath_1"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Obx(()=>
                           Positioned(
                            top: 10,
                            right: 10,
                            child: IconButton(
                              onPressed: () {
                                _controller.toggleFavourite(product);
                              },
                              icon: _controller.favouriteProducts.contains(product)
                                  ? Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.red,
                                      size: 20,
                                    )
                                  : SvgPicture.asset(
                                      'assets/icons/favourite_icon.svg',
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          RoutePages.productDetails,

                        );_controller.setSelectedProduct(product);
                      },
                      child: Text(
                        product["productTitle"],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Color(0xff1D1E20),
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          height: 1.3,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '\$${product["price"]}',
                      style: TextStyle(
                        color: Color(0xff1D1E20),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
