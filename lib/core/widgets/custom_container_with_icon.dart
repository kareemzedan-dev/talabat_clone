import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors_manger.dart';

class CustomContainerWithIcon extends StatelessWidget {
  const CustomContainerWithIcon({super.key, required this.icon,
  this.onTap,
    this.color = ColorsManager.black});
  final IconData icon;
  final Color color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(100),


      ),
      child: Icon(
        size: 16.sp,
        icon,
        color:color,
      ),
    );
  }
}
