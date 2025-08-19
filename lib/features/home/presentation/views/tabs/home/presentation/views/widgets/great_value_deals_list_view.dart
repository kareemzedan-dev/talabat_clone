import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/features/home/presentation/views/model/foods_model.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/great_value_deals.dart';

class GreatValueDealsListView extends StatelessWidget {
    GreatValueDealsListView({super.key});
 List<FoodsModel> foodsModel =[
   FoodsModel(image: Assets.assetsImagesFood1,
    name: "Malak Al Tawouk, R...", description: "Lebanese, Shawarma",  rate: 4.7 ,rateCount: "(50+)"),
   FoodsModel(image: Assets.assetsImagesPoke,
    name: "Poke & Co", description: "Poke, Healthy",  rate: 4.5 ,rateCount: "(200+)"),
  FoodsModel(image: Assets.assetsImagesHealthFood,
    name: "Healthy", description: "Healthy, Bo",  rate: 4.1 ,rateCount: "(20+)"),

  
  
  
 ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GreatValueDeals(foodsModel: foodsModel[index],),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: foodsModel.length,
      ),
    );
  }
}
