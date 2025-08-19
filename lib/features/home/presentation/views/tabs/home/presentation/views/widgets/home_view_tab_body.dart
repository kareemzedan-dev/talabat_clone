import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/best_spots_container.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/category_card.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/category_card_list_view.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/home_header_section.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/promo_code_banner.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/restaurant_card.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/restaurants_card_list_view.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/shortcuts_list_view.dart';

class HomeViewTabBody extends StatelessWidget {
  const HomeViewTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeaderSection(),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                CategoryCardListView(),
                SizedBox(height: 10),
                Center(child: PromoCodeBanner()),
                SizedBox(height: 32),
                Text(
                  "Shortcuts",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                ShortcutsListView(),
                SizedBox(height: 10),
                Text(
                  "Yalla, find the best spots for you",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                BestSpotsContainer(),
                SizedBox(height: 20),
                Text(
                  'Popular restaurants nearby',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 10),
                 RestaurantsCardListView(),
                SizedBox(height: 50),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
