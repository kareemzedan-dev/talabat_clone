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
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trending 🔥',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h),


            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 2,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) => const FoodItemCard(
                name: 'Chicken Schezwan Fried Rice',
                price: 'AED 31.00',
                image: Assets.assetsImagesSzechuan,
              ),
              itemCount: 10,
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}
