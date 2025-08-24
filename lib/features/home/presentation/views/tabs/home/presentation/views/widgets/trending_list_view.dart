import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/features/home/presentation/views/model/trending_model.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/trending_item.dart';

class TrendingListView extends StatelessWidget {
    TrendingListView({super.key});
    List<TrendingAndSaversModel> trendingList = [
      TrendingAndSaversModel(tImage: Assets.assetsImagesGalaxy, 
      tName: "Galaxy Smooth \n Milk Chocolate", tFullPrice: "AED 3.75", tBeforeDiscountPrice: "AED 3.75",),
          TrendingAndSaversModel(tImage: Assets.assetsImagesKiri, 
      tName: "Kiri Creamy Tub \n Cheese 200g", tFullPrice: "AED 19.55", tBeforeDiscountPrice: "AED 3.75",),
        
        
          TrendingAndSaversModel(tImage: Assets.assetsImagesSandwitch, 
      tName: "Prince Sandwich \n Biscuit with Ch...", tFullPrice: "AED 3.75", tBeforeDiscountPrice: "AED 3.75",),
          TrendingAndSaversModel(tImage: Assets.assetsImagesKiri, 
      tName: "Kiri Creamy Tub \n Cheese 200g", tFullPrice: "AED 19.55", tBeforeDiscountPrice: "AED 3.75",),
        
    
    ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TrendingItem(trendingModel: trendingList[index],),
            ),
        scrollDirection: Axis.horizontal,
        itemCount: trendingList.length,
      ),
    );
  }
}
