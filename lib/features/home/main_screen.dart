import 'package:e_commerce_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../cart/cart_page.dart';
import 'home_page.dart';
import '../wishlist/wishlist_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> dummyProducts = [
    {
      "productTitle": "Stylish Comfortable Tracksuit",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "451",
      "description": '''Stylish Comfortable Tracksuit

Product: 1 T-Shirt + 1 Trouser
Fabric: Imported Sweat blazer & Chine PP
Size:- M, L, XL

Trouser Measurements:
M=Waist-32, Length-37
L=Waist-35, Length-38
XL=Waist-36, Length-39

T-Shirt Measurements:
M=Chest-36, Length-27
L=Chest-38, Length-28
XL=Chest-40, Length-29 ''',
      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "category": "Tracksuit",
    },
    {
      "productTitle": "Trendy Premium Winter Hoodie",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "521",
      "description": '''Trendy Premium Winter Hoodie


      Fabric: Cotton
      Gsm: 300
      Export quality sewing
      Fashionable & Elegant Design
      Made in: Bangladesh

      Size: M,L,XL
      M - Long-27, Chest-38
      L - Length-28, Chest-40
      XL- Chest – Long-29, Chest-42''',

      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "category": "Hoodie",
    },
    {
      "productTitle": "Superhit Exclusive Cotton Katua",
      "size": ["M", "L", "XL", "2XL"],
      "price": "150",
      "description": '''Superhit Exclusive Cotton Katua

১০০% বাস্তব ছবি এক্সক্লুসিভ কটন কাতুয়া,
Fabric: Cotton 
Size measurement:
M - Length 27- Chest 38 🥀
L - Length 28- Chest 40 🥀
XL - Length 29 - Chest 42🥀
XXL- length 30-Chest 44 🥀''',
      "imagePath_1": "assets/images/product/Cotton Katua 1.jpg",
      "imagePath_2": "assets/images/product/Cotton Katua 2.jpg",
      "imagePath_3": "assets/images/product/Cotton Katua 3.jpg",
      "imagePath_4": "assets/images/product/Cotton Katua 4.jpg",
      "category": "Katua",
    },
    {
      "productTitle": "Unique Design Cotton T-Shirt",
      "size": ["M", "L", "XL", "2XL"],
      "price": "199",
      "description": '''Unique Design Cotton T-Shirt
্টাইলিশ, আরামদায়ক আর ডেইলি আউটিং এর জন্য পারফেক্ট। এই Unique Design T-Shirt আপনার ডে-টু-ডে লাইফে আনবে এক নতুন মাত্রা।
👕 Fabric: 100% Cotton – হালকা, সফট আর বাতাস চলাচল করে এমন  কাপড়, যা গরমে আরামে পরা যায়।
⚖ GSM: 150 (প্রায়) – পারফেক্ট লাইটওয়েট, ডেইলি ইউজের জন্য বেস্ট।
🎨 Print: হাই কোয়ালিটি DTF প্রিন্ট – যা দীর্ঘদিন টিকে থাকে, রঙ ফিকে হয় না।
Available Colors: Black | Navy Blue | Grey | White
Size: M, L, XL, XXL''',
      "imagePath_1": "assets/images/product/Cotton T-Shirt 1.jpg",
      "imagePath_2": "assets/images/product/Cotton T-Shirt 2.jpg",
      "imagePath_3": "assets/images/product/Cotton T-Shirt 3.jpg",
      "imagePath_4": "assets/images/product/Cotton T-Shirt 4.jpg",
      "category": "T-Shirt",
    },
  ];

  int currentIndex = 0;
  List<Map<String, dynamic>> favoriteProducts = [];

  // ফেভারিট যোগ/বাদ দেওয়ার ফাংশন
  void toggleFavorite(Map<String, dynamic> product) {
    setState(() {
      if (favoriteProducts.contains(product)) {
        favoriteProducts.remove(product);
      } else {
        favoriteProducts.add(product);
      }
    });
  }

  late final pages = [
    HomePage(
      products: dummyProducts,
      favoriteProducts: favoriteProducts,
      onFavoriteToggle: toggleFavorite,
    ),
    WishlistPage(favoriteProducts: favoriteProducts),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bottomNB_Icon/bnb_home.svg',
              color: currentIndex == 0
                  ? AppColor.primaryColor
                  : AppColor.grayColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bottomNB_Icon/bnb_wishlist.svg',
              color: currentIndex == 1
                  ? AppColor.primaryColor
                  : AppColor.grayColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bottomNB_Icon/bnb_cart.svg',
              color: currentIndex == 2
                  ? AppColor.primaryColor
                  : AppColor.grayColor,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
