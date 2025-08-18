import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/features/home/presentation/views/widgets/restaurant_name_and_love_row.dart';

class BestSpotsContainer extends StatelessWidget {
  const BestSpotsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 220,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(Assets.assetsImagesFood1, fit: BoxFit.fill),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: RestaurantNameAndLoveRow(),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          "Allo Beirut Restaurant",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.star, color: ColorsManager.primary, size: 16),
            SizedBox(width: 5),
            Text(
              "4.5",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            Text(
              "(30+)",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
