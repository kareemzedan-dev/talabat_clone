import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/core/utils/routes_manager.dart';
import 'package:talabat/features/home/presentation/views/model/category_card_model.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/category_card.dart';

class CategoryCardListView extends StatelessWidget {
  CategoryCardListView({super.key});
  List<CategoryCardModel> category = [
    CategoryCardModel(cImage: Assets.assetsImagesBurger, cName: "Food", id: 1),
    CategoryCardModel(
      cImage: Assets.assetsImagesTalabtMart,
      cName: "talabat \n  mart",
      id: 2,
    ),
    CategoryCardModel(
      cImage: Assets.assetsImagesGroceries,
      cName: "Groceries",
      id: 3,
    ),
    CategoryCardModel(
      cImage: Assets.assetsImagesHealth,
      cName: "Health & \n  wellness",
      id: 4,
    ),
    // CategoryCardModel(cImage: Assets.assetsImagesFlowers, cName: "Flowers"),
    CategoryCardModel(
      cImage: Assets.assetsImagesCoffee,
      cName: "Coffee",
      id: 5,
    ),

    CategoryCardModel(
      cImage: Assets.assetsImagesMoreshops,
      cName: "More shops",
      id: 6,
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
              padding: const EdgeInsets.only(right: 8.0),
         child: CategoryCard(
  categoryCardModel: category[index],
  ontap: () {
    final selected = category[index];
    switch (selected.id) {
      case 1:
        Navigator.pushNamed(context, RoutesManager.food);
        break;
      case 2:
      print("talabat mart");
       Navigator.pushNamed(context, RoutesManager.talabatMart);
        break;
      case 3:
      print("groceries");
//        Navigator.pushNamed(context, RoutesManager.groceries);
        break;
      case 4:
      print("health");
    //    Navigator.pushNamed(context, RoutesManager.health);
        break;
      case 5:
      print("coffee");
    //    Navigator.pushNamed(context, RoutesManager.coffee);
        break;
      case 6:
      print("more shops");
    //    Navigator.pushNamed(context, RoutesManager.moreShops);
        break;
      default:
        // fallback
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Page not found")),
        );
    }
  },
),

            ),
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
      ),
    );
  }
}
