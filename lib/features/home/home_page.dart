import 'package:e_commerce_project/Data/service/api_constant.dart';
import 'package:e_commerce_project/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controller/home_page_controller.dart';
import '../../core/custom_widgets/brand_logo_widget.dart';
import '../../core/theme/app_colors.dart';
import '../../routes/route.dart';
import '../main page/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    _controller.fetchProductData();
    super.initState();
  }

  final _controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEFEFE),
        elevation: 0,
        leadingWidth: 68,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: CircleAvatar(
              backgroundColor: const Color(0xffF5F6FA),
              child: SvgPicture.asset(
                'assets/icons/drawer_icon/drawer_menu.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RoutePages.cartPage);
              },
              child: CircleAvatar(
                backgroundColor: const Color(0xffF5F6FA),
                child: SvgPicture.asset(
                  'assets/icons/bag_icon.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello', style: AppTextStyle.largeHeading),
                  Text(
                    'Welcome to Laza',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8F959E),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _controller.searchController,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            height: 1.1,
                            color: AppColor.grayColor,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: SvgPicture.asset(
                              'assets/icons/search_product.svg',
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: 'Search...',
                            filled: true,
                            fillColor: Color(0xFFF5F6FA),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/mice_icon_home.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choose Brand',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          height: 1.1,
                          color: Color(0xff1D1E20),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutePages.viewAllBrands);
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            height: 1.1,
                            color: Color(0xff8F959E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BrandLogo(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Arrival',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          height: 1.1,
                          color: Color(0xff1D1E20),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            RoutePages.viewAllProduct,
                            arguments: [
                              _controller.products,
                              _controller.favouriteProducts,
                            ],
                          );
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            height: 1.1,
                            color: Color(0xff8F959E),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  Obx(()=> MasonryGridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _controller.products.length,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,

                      itemBuilder: (context, index) {
                        final product = _controller.products[index];
                        return _controller.isLoading.value
                            ? Center(child: CircularProgressIndicator())
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(RoutePages.productDetails);
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),

                                          child: Image(
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
                                            onPressed: () => _controller
                                                .toggleFavourite(product),
                                            icon:
                                                _controller.favouriteProducts
                                                    .contains(product)
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
                                      Get.toNamed(RoutePages.productDetails);
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
