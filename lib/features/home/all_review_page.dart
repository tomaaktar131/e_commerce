import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/home_page_controller.dart';
import '../../routes/route.dart';

class AllReviewPage extends StatelessWidget {
   AllReviewPage({super.key});

   final _controller =Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reviews",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Color(0xff1D1E20),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            //  Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " ${_controller.reviews.length} Reviews",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.orange),
                        Text(
                          _controller.averageRating().toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        backgroundColor: Color(0xffFF7043),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(RoutePages.addReviewPage);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/add_review_icon.svg',
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Add Review",
                            style: TextStyle(
                              color: Color(0xffFEFEFE),
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            //  Review List
            Expanded(
              child: Obx(
                ()=> ListView.builder(
                  itemCount: _controller.reviews.length,
                  itemBuilder: (context, index) {
                    final review = _controller.reviews[index];
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
                              backgroundImage: AssetImage(review['image']),
                            ),
                            const SizedBox(width: 10),
                            // Name + Date
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                  children: List.generate(5, (starIndex) {
                                    double rating = (review['rating'] as num)
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
