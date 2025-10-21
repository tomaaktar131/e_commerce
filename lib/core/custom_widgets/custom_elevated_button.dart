import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomElevationButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  const CustomElevationButton({
    super.key,
    required this.label,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 55),
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
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
