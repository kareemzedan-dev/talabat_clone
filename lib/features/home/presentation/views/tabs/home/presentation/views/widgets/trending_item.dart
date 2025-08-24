import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/core/widgets/image_and_text.dart';
import 'package:talabat/features/home/presentation/views/model/trending_model.dart';

class TrendingItem extends StatelessWidget {
    TrendingItem({super.key , required this.trendingModel});
  TrendingAndSaversModel trendingModel ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageAndText(
          image:  trendingModel.tImage,
          text: trendingModel.tName,
          istrending: true,
        ),
        SizedBox(height: 4),
        Text(
          trendingModel.tFullPrice,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
