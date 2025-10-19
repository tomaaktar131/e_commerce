import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../routes/route.dart';

class Product {
  final String productName;
  final String productTitle;
  final String imagePath_1;
  final String imagePath_2;
  final String imagePath_3;
  final String imagePath_4;
  final double price;
  final String category;
  final String description;
  final List<String> size;

  Product({
    required this.productTitle,
    required this.imagePath_1,
    required this.imagePath_2,
    required this.imagePath_3,
    required this.imagePath_4,
    required this.category,
    required this.description,
    required this.size,
    required this.productName,
    required this.price,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 257,
      width: 160,
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 203,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(product.imagePath_1, fit: BoxFit.fill)),
              ),
              Positioned(
                top: -1,
                right: -3,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/favourite_icon.svg'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RoutePages.productDetails, arguments: product);
              },
              child: Text(
                product.productName,
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$${product.price}',
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
  }
}
