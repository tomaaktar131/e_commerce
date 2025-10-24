import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/home_page_controller.dart';
import '../../routes/route.dart';

class ViewAllProduct extends StatefulWidget {
  const ViewAllProduct({super.key});

  @override
  State<ViewAllProduct> createState() => _ViewAllProductState();
}

class _ViewAllProductState extends State<ViewAllProduct> {
  final _controller=Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    final List args = Get.arguments;
    final List products = args[0];
    final List favouriteProducts = args[1];    return Scaffold(
       appBar:  AppBar(

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
                "${products.length} Items",
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
                      SvgPicture.asset('assets/icons/drawer_icon/sort.svg',fit: BoxFit.scaleDown,),
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
      ),

      MasonryGridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,

        itemBuilder: (context, index) {
          final product =products[index];
          final isFav = favouriteProducts.contains(product);
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

                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      onPressed: (){_controller.toggleFavourite(product);},
                      icon: isFav
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
                    fontSize: 13,
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
