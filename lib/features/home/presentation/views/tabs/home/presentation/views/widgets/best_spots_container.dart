import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/features/home/presentation/views/model/foods_model.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/restaurant_name_and_love_row.dart';

class BestSpotsContainer extends StatelessWidget {
    BestSpotsContainer({super.key, required this.foodsModel});
  FoodsModel foodsModel ;

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
              child: ClipRRect(
  borderRadius: BorderRadius.circular(16),
  child: Image.asset(
    foodsModel.image!,
    fit: BoxFit.cover,
    height: 220,
    width: 160,
  ),
),

            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: RestaurantNameAndLoveRow(rImage:foodsModel.restaurantImage! ,),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
        foodsModel.name!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 5),
        buildRatingWidget(
          rating:  foodsModel.rate!,
          ratingCount: foodsModel.rateCount!,
        ),
      ],
    );
  }

 
}
  Row buildRatingWidget({
    required double rating,
    required String ratingCount,
  }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.star, color: ColorsManager.primary, size: 16),
          SizedBox(width: 5),
          Text(
          rating.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),
          Text(
           ratingCount.toString(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
  }