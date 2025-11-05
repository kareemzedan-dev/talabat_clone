import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../../core/utils/assets_manager.dart';
import 'food_item_card.dart';

class RestaurantTrendingSection extends StatelessWidget {
  const RestaurantTrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trending 🔥',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,  // responsive font
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h), // responsive spacing

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w, // responsive spacing
                mainAxisSpacing: 10.h,  // responsive spacing
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) => const FoodItemCard(
                name: 'Chicken Schezwan Fried Rice',
                price: 'AED 31.00',
                image: Assets.assetsImagesSzechuan,
              ),
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}
