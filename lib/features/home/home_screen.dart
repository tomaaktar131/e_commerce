import 'package:e_commerce_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bottomNB_screen/cart_page.dart';
import 'bottomNB_screen/home_page.dart';
import 'bottomNB_screen/wishlist_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> _pages= [
    const HomePage(),
    WishlistPage(),
    CartPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],

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
