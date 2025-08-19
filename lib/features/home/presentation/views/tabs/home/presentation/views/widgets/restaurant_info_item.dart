import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/features/home/presentation/views/model/restaurant_model.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/best_spots_container.dart';

class RestaurantInfoItem extends StatelessWidget {
  RestaurantInfoItem({super.key, required this.restaurantModel});
  RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 60,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.black.withValues(alpha: 0.25),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                restaurantModel.image!,
                fit: BoxFit.cover,
                width: 70,
                height: 60,
              ),
            ),
          ),
          SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                restaurantModel.name!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4),
              Text(
                restaurantModel.description!,
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.50),
                  fontSize: 10,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4),
              buildRatingWidget(
                rating: restaurantModel.rating!,
                ratingCount: restaurantModel.ratingCount!,
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(Assets.assetsImagesPhClockLight),
                  SizedBox(width: 4),
                  Text(
                    restaurantModel.time!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    Assets.assetsImagesHealthiconsVespaMotorcycleOutline,
                  ),
                  SizedBox(width: 4),
                  Text(
                    restaurantModel.price!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
