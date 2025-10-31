import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import '../../../../../../../../../core/utils/colors_manger.dart';

class RestaurantCardDetails extends StatelessWidget {
  const RestaurantCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 72.w,
              height: 65.h,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.assetsImagesMandarin),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mandarin Oak',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Chinese, Thai, Asian, Noodles, Dumplings',
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: 0.50),
                      fontSize: 10.sp,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: ColorsManager.primary,
                        size: 16.sp,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        '4.7 ',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.85),
                          fontSize: 12.sp,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.01,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        '(1234 reviews)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 19.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:   [
            Expanded(
              child: InfoColumn(title: 'Delivery fee', value: 'AED 6.50',icon: Icons.electric_scooter,),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: InfoColumn(title: 'Delivery time', value: '25-30 min',icon: Icons.timer,),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: InfoColumn(
                title: 'Delivered by',
                value: 'talabat',
                showDivider: false,
                showTalabatLogo: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class InfoColumn extends StatelessWidget {
  final String title;
  final String value;
  final bool showDivider;
  final bool showTalabatLogo;
  final IconData? icon;

  const InfoColumn({
    super.key,
    required this.title,
    required this.value,
    this.showDivider = true,
    this.showTalabatLogo = false,
      this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.50),
                  fontSize: 12.sp,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              showTalabatLogo
                  ? Image.asset(
                    Assets.assetsImagesTalabatSeekLogo,
                    height: 23.h,
                    width: 53.w,
                  )
                  : Row(
                    children: [
                      Icon(icon, color: Colors.black ,size: 12.sp),
                      SizedBox(width: 5.w),
                      Text(
                        value,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
            ],
          ),
        ),
        if (showDivider)
          Container(
            width: 1.w,
            height: 40.h,
            color: Colors.black.withValues(alpha: 0.25),
          ),
      ],
    );
  }
}
