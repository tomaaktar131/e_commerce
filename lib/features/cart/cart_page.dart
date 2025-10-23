import 'package:e_commerce_project/core/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../routes/route.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> cartItems = [
    {
      "title": "Men's Tie-Dye T-Shirt Nike Sportswear (Blue)",
      "price": 45,
      "tax": 4.0,
      "quantity": 1,
      "image": "assets/images/person_1.png",
    },
    {
      "title": "Men's Tie-Dye T-Shirt Nike Sportswear (Red)",
      "price": 45,
      "tax": 4.0,
      "quantity": 1,
      "image": "assets/images/person_1.png",
    },
    {
      "title": "Men's Tie-Dye T-Shirt Nike Sportswear (Red)",
      "price": 45,
      "tax": 4.0,
      "quantity": 1,
      "image": "assets/images/person_1.png",
    },
    {
      "title": "Men's Tie-Dye T-Shirt Nike Sportswear (Red)",
      "price": 45,
      "tax": 4.0,
      "quantity": 1,
      "image": "assets/images/person_1.png",
    },
  ];

  final String address = "Chhatak, Sunamgonj 12/8AB, Sylhet";
  final String city = "Sylhet";
  final String cardName= "Visa Classic";
  final String cardNum = " **** 7690";

  @override
  Widget build(BuildContext context) {
    double subtotal = cartItems.fold(0, (sum, item) => sum + item["price"]);
    double shipping = 10;
    double total = subtotal + shipping;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            height: 1.1,
            color: Color(0xff1D1E20),
          ),
        ),
        backgroundColor: const Color(0xFFFEFEFE),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ✅ Cart Items
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Card(
                      color: Color(0xffF5F6FA),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ✅ বড় Image
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  height: 100,
                                  width: 100,
                                  image: AssetImage(
                                    'assets/images/product/Cotton Katua 1.jpg',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            // ✅ Text Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["title"],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Color(0xff1D1E20),
                                    ),
                                  ),
                                  Text(
                                    "\$${item["price"]}(-\$${item["tax"]}Tax)",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/quantity+.svg',
                                      ),
                                      SizedBox(width: 20),
                                      Text('1'),
                                      SizedBox(width: 20),
                                      SvgPicture.asset(
                                        'assets/icons/quantity-.svg',
                                      ),
                                      Spacer(),
                                      SvgPicture.asset(
                                        'assets/icons/delete_from_card.svg',
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Address',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Color(0xff1D1E20),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.navigate_next_sharp),
                    onPressed: () {
                      Get.toNamed(RoutePages.addDeliveryAddress);
                    },
                  ),
                ],
              ),

              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                leading: Image.asset('assets/images/map&location.png'),
                trailing: SvgPicture.asset('assets/icons/check.svg'),
                title: Text(
                  address,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1D1E20),
                  ),
                ),
                subtitle: Text(
                  city,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Method ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Color(0xff1D1E20),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.navigate_next_sharp),
                    onPressed: () {
                      Get.toNamed(RoutePages.addPaymentMethod);
                    },
                  ),
                ],
              ),

              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                leading: Image.asset('assets/images/visa&bg.png'),
                trailing: SvgPicture.asset('assets/icons/check.svg'),
                title: Text(
                  cardName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1D1E20),
                  ),
                ),
                subtitle: Text(
                  cardNum,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    Row(children: [Text('Order Info')]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "\$$subtotal",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1D1E20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping cost",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "\$${shipping}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1D1E20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "\$${total}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1D1E20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              // ✅ Checkout Button
              CustomElevationButton(label: 'Checkout', onPress: () {
                Get.offNamed(RoutePages.orderConfirmed);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
