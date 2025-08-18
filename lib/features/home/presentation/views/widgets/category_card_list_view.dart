import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/features/home/presentation/views/model/category_card_model.dart';
import 'package:talabat/features/home/presentation/views/widgets/category_card.dart';

class CategoryCardListView extends StatelessWidget {
  CategoryCardListView({super.key});
  List<CategoryCardModel> category = [
    CategoryCardModel(cImage: Assets.assetsImagesBurger, cName: "Food"),
    CategoryCardModel(
      cImage: Assets.assetsImagesTalabtMart,
      cName: "talabat \n  mart",
    ),
    CategoryCardModel(cImage: Assets.assetsImagesGroceries, cName: "Groceries"),
    CategoryCardModel(
      cImage: Assets.assetsImagesHealth,
      cName: "Health & \n  wellness",
    ),
    // CategoryCardModel(cImage: Assets.assetsImagesFlowers, cName: "Flowers"),
    CategoryCardModel(cImage: Assets.assetsImagesCoffee, cName: "Coffee"),

    CategoryCardModel(
      cImage: Assets.assetsImagesMoreshops,
      cName: "More shops",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: double.infinity,

      child: ListView.builder(
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.only( right:  8.0),
              child: CategoryCard(categoryCardModel: category[index]),
            ),
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
      ),
    );
  }
}
