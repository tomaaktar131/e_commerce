import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_colors.dart';

class CustomElevationButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  final bool isLoading;
  const CustomElevationButton({
    super.key,
    required this.label,
    required this.onPress,
    this.isLoading = false
  });

  @override
  Widget build(BuildContext context) {
    return isLoading ? const Center(child: CircularProgressIndicator()) :

    ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 55),
          backgroundColor: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPress,
        child: Text(
          label,
          style: TextStyle(
            color: Color(0xffFEFEFE),
            fontWeight: FontWeight.w500,
            fontSize: 17,
            height: 1.1,
          ),
        ),
      );
  }
}
