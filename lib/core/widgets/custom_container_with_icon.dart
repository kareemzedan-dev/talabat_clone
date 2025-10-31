import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors_manger.dart';

class CustomContainerWithIcon extends StatelessWidget {
  const CustomContainerWithIcon({super.key, required this.icon,   this.color = ColorsManager.black});
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(),
      ),
      child: Icon(
        size: 16.sp,
        icon,
        color:color,
      ),
    );
  }
}
