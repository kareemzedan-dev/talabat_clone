import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/features/home/presentation/views/model/foods_model.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/best_spots_container.dart';

class BestSpotsListView extends StatelessWidget {
    BestSpotsListView({super.key});
  List<FoodsModel> foodsModel = [
FoodsModel(image: Assets.assetsImagesGeorgianCuisineTable, name: 'Cafe', rate: 4.2,rateCount:  "(4.2)" ,restaurantImage: Assets.assetsImagesAllo),
FoodsModel(image: Assets.assetsImagesFood1, name: 'Cafe2', rate: 4.2,rateCount:  "(4.2)",restaurantImage: Assets.assetsImagesAllo ),

FoodsModel(image: Assets.assetsImagesFood1, name: 'Cafe3', rate: 4.2,rateCount:  "(4.2)",restaurantImage: Assets.assetsImagesAllo ),
FoodsModel(image: Assets.assetsImagesFood1, name: 'Cafe4', rate: 4.2,rateCount:  "(4.2)" ,restaurantImage: Assets.assetsImagesAllo),

  ];


  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: BestSpotsContainer(foodsModel: foodsModel[index],),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: foodsModel.length,
      ),
    );
  }
}