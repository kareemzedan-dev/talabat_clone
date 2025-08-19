import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/features/home/presentation/views/model/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  RestaurantCard({super.key, required this.restaurantModel});
  RestaurantModel restaurantModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container(
            height: 100,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: const Color(0xFFD9D9D9)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(restaurantModel.image!, fit: BoxFit.cover),
            ),
          ),

          SizedBox(height: 8),
          Opacity(
            opacity: 0.85,
            child: Text(
              restaurantModel.name!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.assetsImagesIconamoonClockThin,
                height: 16,
                width: 16,
              ),
              SizedBox(width: 4),
              Text(
                restaurantModel.time!,
                style: TextStyle(
                  color: const Color(0x931E1E1E),
                  fontSize: 12,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
