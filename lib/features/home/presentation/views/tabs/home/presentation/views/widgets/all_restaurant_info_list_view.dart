import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/features/home/presentation/views/model/restaurant_model.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/restaurant_info_item.dart';

class AllRestaurantInfoListView extends StatelessWidget {
  AllRestaurantInfoListView({super.key});
  List<RestaurantModel> restaurants = [
    RestaurantModel(
      name: "Junior Seafood, Jumeirah 3",
      description: "Thai, International, Continental",
      image: Assets.assetsImagesJunior,
      rating: 4.5,
      price: "AED 7.50",
      ratingCount: "(200+)",
      time: "41 mins",
    ),
        RestaurantModel(
      name: "Sushi Counter, Business Bay 4",
      description: "Sushi, Japanese, Seafood",
      image: Assets.assetsImagesSushi,
      rating: 4.7,
      price: "AED 7.50",
      ratingCount: "(100+)",
      time: "30 mins",
    ),
        RestaurantModel(
      name: "Pizza 2 Go",
      description: "Pizza, Pasta, Healthy",
      image: Assets.assetsImagesPizza,
      rating: 4.5,
      price: "AED 7.00",
      ratingCount: "(191+)",
      time: "40 mins",
    ),
        RestaurantModel(
      name: "Papparoti",
      description: "Beverages, Arabic sweets, Desserts",
      image: Assets.assetsImagesPapparoti,
      rating: 4.4,
      price: "AED 5.50",
      ratingCount: "(40+)",
      time: "26 mins",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:500,
      width: double.infinity,
      child: ListView.separated(
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical:  12.0),
          child: Divider(thickness: 1,  color: Colors.black.withValues(alpha: 0.50),),
        ),
        itemBuilder:
            (context, index) => RestaurantInfoItem(restaurantModel: restaurants[index]),
        scrollDirection: Axis.vertical,
        itemCount: restaurants.length,
      ),
    );
  }
}
