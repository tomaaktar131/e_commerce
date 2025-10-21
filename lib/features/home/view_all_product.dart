import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/route.dart';

class ViewAllProduct extends StatefulWidget {
  const ViewAllProduct({super.key});

  @override
  State<ViewAllProduct> createState() => _ViewAllProductState();
}

class _ViewAllProductState extends State<ViewAllProduct> {
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

      GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          final isFav = favouriteProducts.contains(product);
          return Card(
            elevation: 0,
            color: Color(0xffFEFEFE),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 203,
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            RoutePages.productDetails,
                            arguments: product,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            product["imagePath_1"],
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 10,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (favouriteProducts.contains(
                              product,
                            )) {
                              favouriteProducts.remove(
                                product,
                              );
                            } else {
                              favouriteProducts.add(product);
                            }
                          });
                        },
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        RoutePages.productDetails,
                        arguments: product,
                      );
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Text(
                    '\$${product["price"]}',
                    style: TextStyle(
                      color: Color(0xff1D1E20),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

    ],
  ),
),

    );
  }
}
