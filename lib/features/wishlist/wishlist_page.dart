import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Data/service/api_constant.dart';
import '../../controller/home_page_controller.dart';
import '../../routes/route.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final _controller =Get.find<HomePageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_controller.favouriteProducts.length} Items",
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
                            SvgPicture.asset(
                              'assets/icons/edit_pen_.svg',
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(width: 5),
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
            _controller.favouriteProducts.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 3),
                      Text(
                        "No favorite products yet",
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  )
                : MasonryGridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _controller.favouriteProducts.length,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,

                    itemBuilder: (context, index) {
                      final product = _controller.favouriteProducts[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    RoutePages.productDetails,arguments: product);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),

                                  child:Image(
                                    height: 203,
                                    width: double.infinity,
                                    image: NetworkImage(
                                      "${ApiConstant.baseUrl}${product.images[0]}",
                                    ),
                                    fit: BoxFit.cover,
                                    errorBuilder:  (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/images/no-image-available.jpg',
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                              ),

                              Obx(
                                () => Positioned(
                                  top: 10,
                                  right: 10,
                                  child: IconButton(
                                    onPressed: () {
                                      _controller.toggleFavourite(product);
                                    },
                                    icon:
                                        _controller.favouriteProducts.contains(
                                          product,
                                        )
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
                                RoutePages.productDetails,arguments: product);

                            },
                            child: Text(
                              product.name,
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
                            '\$${product.price}',
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
