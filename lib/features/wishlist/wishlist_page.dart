import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../routes/route.dart';

class WishlistPage extends StatefulWidget {
  final List<Map<String, dynamic>> favoriteProducts;

  const WishlistPage({super.key, required this.favoriteProducts});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.favoriteProducts.length} Items",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1D1E20),
                      ),
                    ),
                    SizedBox(height: 5),

                    Text(
                      "in wishlist",
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
                            SvgPicture.asset('assets/icons/edit_pen_.svg',fit: BoxFit.scaleDown,),
                            SizedBox(width: 5,),
                            Text(
                              'Edit',
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
            widget.favoriteProducts.isEmpty
                ?  Column(
              crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 3,),
                    Text(
                      "No favorite products yet",
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.favoriteProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final product = widget.favoriteProducts[index];
                      final isFav = widget.favoriteProducts.contains(product);
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
                                        if (widget.favoriteProducts.contains(
                                          product,
                                        )) {
                                          widget.favoriteProducts.remove(
                                            product,
                                          );
                                        } else {
                                          widget.favoriteProducts.add(product);
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

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Wishlist',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          height: 1.1,
          color: Color(0xff1D1E20),
        ),
      ),
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
    );
  }
}
