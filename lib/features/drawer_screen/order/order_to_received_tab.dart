import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class OrderToReceivedTab extends StatefulWidget {
  const OrderToReceivedTab({super.key});

  @override
  State<OrderToReceivedTab> createState() => _OrderToReceivedTabState();
}

class _OrderToReceivedTabState extends State<OrderToReceivedTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                // final item = cartItems[index];

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
                                  // item["title"],
                                  "Cotton Katua",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Color(0xff1D1E20),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      // "\$${item["price"]}(-\$${item["tax"]}Tax)",
                                      '\$${1000}',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text('Qty 1',style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff46494E),
                                    ),)
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: Size(97, 38),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(
                                              color: AppColor.primaryColor,
                                            ),
                                          ),
                                          foregroundColor:AppColor.primaryColor
                                      ),
                                      child: Text('Cancel'),
                                    ),
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
          ],
        ),
      ),
    );
  }
}
