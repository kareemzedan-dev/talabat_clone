import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/core/widgets/custom_search_text_field.dart';
import 'package:talabat/core/widgets/image_and_text.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/banner_section.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/shop_by_category_widget.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/talabat_mart_offers_list_view.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/top_savers_list_view.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/trending_item.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/trending_list_view.dart';

class TalabatMartViewBody extends StatefulWidget {
  const TalabatMartViewBody({super.key});

  @override
  State<TalabatMartViewBody> createState() => _TalabatMartViewBodyState();
}

class _TalabatMartViewBodyState extends State<TalabatMartViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
        CustomSearchTextField(
  hintTexts: [
    'Search Products',
    'Search for Milk',
    'Search for Eggs',
    'Search for Bread',
  ],
),

            const SizedBox(height: 10),
            TalabatMartOffersListView(),
            const SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset(Assets.assetsImagesNotoFire),
                const SizedBox(height: 10),
                Text(
                  'Trending now',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Image.asset(Assets.assetsImagesMdiLightArrowLeft),
              ],
            ),

            const SizedBox(height: 10),
            TrendingListView(),
            const SizedBox(height: 10),

            Text(
              'Shop by category',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            ShopByCategoryWidget(),
                  const SizedBox(height: 10),
            bannerSection(),
            const SizedBox(height: 10),

            Row(
              children: [
                Text(
                  'Top savers',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Image.asset(Assets.assetsImagesMdiLightArrowLeft),
              ],
            ),
            SizedBox(height: 10),
            TopSaversListView(),
       
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
