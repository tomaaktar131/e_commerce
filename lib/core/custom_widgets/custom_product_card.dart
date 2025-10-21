// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import '../../controller/product_controller.dart';
// import '../../routes/route.dart';
//
//
// class ProductCard extends StatelessWidget {
//    ProductCard({super.key,});
//   final _productController = Get.put(ProductController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 257,
//       width: 160,
//       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               SizedBox(
//                 height: 203,
//                 width: double.infinity,
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Image.asset(_productController.products[index]["imagePath_1"], fit: BoxFit.fill)),
//               ),
//               Positioned(
//                 top: -1,
//                 right: -3,
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: SvgPicture.asset('assets/icons/favourite_icon.svg'),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             child: GestureDetector(
//               onTap: () {
//                 Get.toNamed(RoutePages.productDetails, arguments: _productController.products[index]);
//               },
//               child: Text(
//                 _productController.products[index]["productName"],
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//                 style: TextStyle(
//                   color: Color(0xff1D1E20),
//                   fontWeight: FontWeight.w500,
//                   fontSize: 11,
//                   height: 1.3,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(
//               '\$${_productController.products[index]["price"]}',
//               style: TextStyle(
//                 color: Color(0xff1D1E20),
//                 fontSize: 13,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
