import 'package:e_commerce_project/Data/service/api_constant.dart';
import 'package:e_commerce_project/core/theme/app_colors.dart';
import 'package:e_commerce_project/routes/route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Data/model/product_model.dart';
import '../../controller/home_page_controller.dart';
import '../../core/custom_widgets/custom_elevated_button.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _controller = Get.find<HomePageController>();
  @override
  Widget build(BuildContext context) {
    final ProductData product = Get.arguments;
    final controller = Get.find<HomePageController>();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Obx(
                        () => ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: (product.images.isNotEmpty &&
                                  _controller.selectedIndex.value <
                                      product.images.length)
                              ? Image.network(
                                  "${ApiConstant.baseUrl}${product.images[_controller.selectedIndex.value]}",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/no-image-available.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Image.asset(
                              'assets/images/no-image-available.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 15),

                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${product.category}",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1,
                                  color: Color(0xff8F959E),
                                ),
                              ),
                            ),
                            Text(
                              'Price',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                height: 1.1,
                                color: Color(0xff8F959E),
                              ),
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  height: 1.1,
                                  color: Color(0xff1D1E20),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              "\$${product.price}",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                height: 1.1,
                                color: Color(0xff1D1E20),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 21),
                        SizedBox(
                          height: 77,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: product.images.length,
                            itemBuilder: (context, index) {
                              final imageUrl = "${ApiConstant.baseUrl}${product.images[index]}";
                              return InkWell(onTap: () {
                                  _controller.selectedIndex.value= index;

                              },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      imageUrl,
                                      width: 77,
                                      height: 77,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                        'assets/images/no-image-available.jpg',
                                        width: 77,
                                        height: 77,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Size',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  height: 1.1,
                                  color: Color(0xff1D1E20),
                                ),
                              ),
                            ),
                            Text(
                              "Size Guide",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 1.1,
                                color: Color(0xff8F959E),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 60,
                          child: ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.selectSize(index, product);
                                },
                                child: Obx(
                                  () => Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF5F6FA),
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          controller.selectedSizeIndex.value ==
                                              index
                                          ? Border.all(
                                              color: AppColor.primaryColor,
                                              width: 1,
                                            )
                                          : null,
                                    ),
                                    child: Center(
                                      child: Text(
                                        product.sizes![index],
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          height: 1.1,
                                          color: Color(0xff1D1E20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(width: 9),
                            itemCount: product.sizes!.length,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              height: 1.1,
                              color: Color(0xff1D1E20),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        Obx(() {
                          final description = product.description ?? '';
                          final isLongText = description.length > 120;
                          final displayText = controller.isExpanded.value || !isLongText
                              ? description
                              : '${description.substring(0, 120)}... ';

                          return RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 15,
                                height: 1.4,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: displayText),
                                if (isLongText)
                                  TextSpan(
                                    text: controller.isExpanded.value ? ' Read Less' : ' Read More',
                                    style: const TextStyle(
                                      color: Color(0xff1D1E20),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        controller.isExpanded.value = !controller.isExpanded.value;
                                      },
                                  ),
                              ],
                            ),
                          );
                        }),

                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Reviews',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                height: 1.1,
                                color: Color(0xff1D1E20),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RoutePages.allReviewPage);
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
                        SizedBox(height: 15),

                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            final review = controller.reviews[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ======= Row 1: Profile + Name + Rating =======
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Profile image
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundImage: AssetImage(
                                        review['image'],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    // Name + Date
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${review['name']}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff1D1E20),
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(height: 7),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/time_icon.svg',
                                                fit: BoxFit.scaleDown,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                '${review['date']}',
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Rating section
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '${review['rating']}',
                                                style: const TextStyle(
                                                  color: Color(0xff1D1E20),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              const TextSpan(
                                                text: " rating",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: List.generate(5, (
                                            starIndex,
                                          ) {
                                            double rating =
                                                (review['rating'] as num)
                                                    .toDouble();
                                            return Icon(
                                              starIndex < rating.floor()
                                                  ? Icons.star
                                                  : (starIndex < rating
                                                        ? Icons.star_half
                                                        : Icons.star_border),
                                              color: Colors.orange.shade400,
                                              size: 15,
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),

                                /// ======= Review Text =======
                                Text(
                                  '${review['review']}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    height: 1.4,
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Color(0xffFEFEFE),
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutePages.cartPage);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: const Color(0xffFEFEFE),
                      child: SvgPicture.asset(
                        'assets/icons/bag_icon.svg',
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 155,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 25),
        decoration: BoxDecoration(
          color: Color(0xffFEFEFE),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1D1E20),
                      ),
                    ),
                    SizedBox(height: 5),

                    Text(
                      "with VAT, SD",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      " \$${product.price}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1D1E20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            CustomElevationButton(
              label: 'Add to Cart ',
              onPress: () {
                // _cartController.addToCart(_controller.selectedProduct.value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
