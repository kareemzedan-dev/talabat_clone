import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/features/home/presentation/views/model/foods_model.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/best_spots_container.dart';

class GreatValueDeals extends StatelessWidget {
    GreatValueDeals({super.key,required this.foodsModel});
  FoodsModel foodsModel ;

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 145,
          height: 110,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: Image.asset(foodsModel.image!, fit: BoxFit.fill),
        ),
        SizedBox(height: 10),
        Text(
        foodsModel.name!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 5),
        Text(
         foodsModel.description!,
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.50),
            fontSize: 10,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        buildRatingWidget(
          rating: foodsModel.rate!,
          ratingCount: foodsModel.rateCount!,
        ),
      ],
    );
  }
}
