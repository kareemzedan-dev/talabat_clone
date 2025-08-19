import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/all_restaurant_info_list_view.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/filter_chip_button.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/great_value_deals.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/great_value_deals_list_view.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/promo_category_card.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/restaurant_info_item.dart';

class FoodViewBody extends StatelessWidget {
  const FoodViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FilterChipButton(
                    icon: Icons.swap_vert,
                    label: "Sort by",
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  FilterChipButton(
                    icon: Icons.coffee,
                    label: "Cuisines",
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  FilterChipButton(label: "Rating 4.0+", onTap: () {}),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 130,
              width: double.infinity,
              child: PromoCategoryListView(),
            ),
            SizedBox(height: 40),
            Text(
              'Great value deals',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            GreatValueDealsListView(),
            SizedBox(height: 40),
            Text(
              'All restaurants',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
         AllRestaurantInfoListView(),
          ],
        ),
      ),
    );
  }

  ListView PromoCategoryListView() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        PromoCategoryCard(
          image: Assets.assetsImagesOffer,
          title: "Super \n Saver",
          onTap: () {},
        ),
        SizedBox(width: 12),
        PromoCategoryCard(
          image: Assets.assetsImagesSeller,
          title: "Best Sellers",
          onTap: () {},
        ),
        SizedBox(width: 12),
        PromoCategoryCard(
          image: Assets.assetsImagesPro,
          title: "talabat Pro",
          onTap: () {},
        ),
        SizedBox(width: 12),
        PromoCategoryCard(
          image: Assets.assetsImagesTries,
          title: "Must-tries",
          onTap: () {},
        ),
      ],
    );
  }
}
