import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/best_spots_list_view.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/category_card_list_view.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/home_header_section.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/promo_code_banner.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/restaurants_card_list_view.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/shortcuts_list_view.dart';

 
class HomeViewTabBody extends StatelessWidget {
  HomeViewTabBody({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeaderSection(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryCardListView(),
                const SizedBox(height: 10),
                const Center(child: PromoCodeBanner()),
                const SizedBox(height: 32),
                const Text(
                  "Shortcuts",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ShortcutsListView(),
                const SizedBox(height: 10),

               
                if (user != null) ...[
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
                BestSpotsListView(),
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
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
