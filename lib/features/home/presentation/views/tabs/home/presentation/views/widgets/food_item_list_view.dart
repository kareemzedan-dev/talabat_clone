import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'food_item_container.dart';

class FoodItemListView extends StatelessWidget {
  const FoodItemListView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w), // responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp, // responsive font
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8.h), // responsive spacing
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Divider(
                thickness: 1.h, // responsive thickness
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(16.w), // responsive padding
              child: const FoodItemContainer(),
            ),
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
