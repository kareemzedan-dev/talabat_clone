import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/features/home/presentation/views/model/restaurant_model.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/restaurant_card.dart';

class RestaurantsCardListView extends StatelessWidget {
    RestaurantsCardListView({super.key});
  List<RestaurantModel> restaurants = [
    RestaurantModel(name: "Allo Beirut", time: "32 mins" , image: Assets.assetsImagesAllo),
  RestaurantModel(name: "Laffah", time: "38 mins" , image: Assets.assetsImagesRestaurant2),
    RestaurantModel(name: "Falafil Al\nRabiah Al kha...", time: "44 mins" , image: Assets.assetsImagesRestaurant3),
      RestaurantModel(name: "Barbar", time: "34 mins" , image: Assets.assetsImagesRestaurant4),

  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: RestaurantCard(restaurantModel: restaurants[index],),
            ),
        scrollDirection: Axis.horizontal,
        itemCount: restaurants.length,
      ),
    );
  }
}
