import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:talabat/core/widgets/custom_container_with_icon.dart';
import '../../../../../../../../../core/utils/colors_manger.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({super.key, required this.image, required this.name, required this.price});
  final String image;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 140.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CustomContainerWithIcon(
                icon: FontAwesomeIcons.plus,
                color: ColorsManager.primary,
              ),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          name,
          maxLines: 2,
          style: TextStyle(

            overflow: TextOverflow.ellipsis,

            color: Colors.black.withValues(alpha: 0.85),
            fontSize: 12.sp,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
           price,
          style: TextStyle(
            color: ColorsManager.primary,
            fontSize: 12.sp,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
