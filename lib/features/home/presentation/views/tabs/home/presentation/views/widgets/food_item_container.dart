import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../core/utils/assets_manager.dart';

class FoodItemContainer extends StatelessWidget {
  const FoodItemContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chicken Schezwan Fried Rice',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.85),
                  fontSize: 12.sp,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Golden fried Chicken pieces wok-tossed with hot and spicy schezwan fried rice with vegetables like green ...',
                maxLines: 4,
                style: TextStyle(

                  overflow: TextOverflow.ellipsis,
                  color: Colors.black.withOpacity(0.50),
                  fontSize: 12.sp,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.h), // بدل 41.h استخدم قيمة ديناميكية
              Text(
                'AED 31.00',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.85),
                  fontSize: 12.sp,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          width: 105.w,
          height: 104.h,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.assetsImagesSzechuan),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ],
    );
  }
}
