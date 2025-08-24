import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/features/home/presentation/views/model/category_card_model.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/shortcuts_card.dart';

class ShortcutsListView extends StatelessWidget {
  ShortcutsListView({super.key});
  List<CategoryCardModel> category = [
    CategoryCardModel(
      cImage: Assets.assetsImagesOrders,
      cName: "Past\norders",
      
    ),
    CategoryCardModel(
      cImage: Assets.assetsImagesSaver,
      cName: "Super\nSaver",
    ),
    CategoryCardModel(
      cImage: Assets.assetsImagesMustTries,
      cName: 'Must-tries',
    ),
    CategoryCardModel(cImage: Assets.assetsImagesGiveBack, cName: "Give Back"),
    CategoryCardModel(
      cImage: Assets.assetsImagesBestSellers,
      cName: "Best\nSellers",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: ShortcutsCard(categoryCardModel: category[index]),
            ),
            itemCount:category.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
