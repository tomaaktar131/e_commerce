import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WishlistPage extends StatefulWidget {

  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: IconButton(onPressed: () { Get.back();}, icon: Icon(Icons.arrow_back),

        )
      ),
      centerTitle: true,
      title: Text('Wishlist',style: TextStyle(
        fontSize: 17,fontWeight: FontWeight.w600,height: 1.1,color: Color(0xff1D1E20)
      ),),
      backgroundColor: const Color(0xFFFEFEFE),
      elevation: 0,
      leadingWidth: 68,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CircleAvatar(
            radius: 22,
            backgroundColor: const Color(0xffF5F6FA),
            child: SvgPicture.asset(
              'assets/icons/bag_icon.svg',
              height: 25,
              width: 25,
            ),
          ),
        ),
      ],
    ),);
  }
}
