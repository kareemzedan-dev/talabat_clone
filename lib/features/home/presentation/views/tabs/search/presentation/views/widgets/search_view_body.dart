import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/core/widgets/custom_search_text_field.dart';
import 'package:talabat/features/home/presentation/views/tabs/search/presentation/views/widgets/search_body.dart';

class SearchTabViewBody extends StatelessWidget {
  const SearchTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, String>>> tabData = {
      "Food": [
        {
          "image": Assets.assetsImagesGroceriesSearchIc,
          "title": "Food Delivery",
          "subtitle": "From groceries and fresh products to household supplies.",
          "buttonText": "Search groceries",
        },
      ],
      "Groceries": [
        {
          "image": Assets.assetsImagesGroceriesSearchIc,
          "title": "Shop for all daily essentials",
          "subtitle": "From groceries and fresh products to household supplies.",
          "buttonText": "Search groceries",
        },
      ],
      "Health & wellness": [
        {
          "image": Assets.assetsImagesHealthSearchIc,
          "title": "Find health & wellness stores",
          "subtitle": "From groceries and fresh products to household supplies.",
          "buttonText": "Search health & wellness",
        },
      ],
      "Flowers": [
        {
          "image": Assets.assetsImagesFlowerSearchIc,
          "title": "Find the perfect gift",
          "subtitle": "Order beautiful flowers, bouquets, or plants for every occasion.",
          "buttonText": "Send Flowers",
        },
      ],
      "More shops": [
        {
          "image": Assets.assetsImagesMoreSearchIc,
          "title": "Explore far and wide",
          "subtitle": "Search for a range of products at a variety of shops.",
          "buttonText": "Search more products",
        },
      ],
    };

    final tabs = tabData.keys.toList();

    return DefaultTabController(
      length: tabs.length,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchTextField(
                hintTexts: [
                  'Search food',
                  'Search groceries',
                  'Search health',
                  'Search flowers',
                  'Search more',
                ],
              ),
              const SizedBox(height: 16),

         
              TabBar(
                isScrollable: true,
                labelColor: ColorsManager.primary,
                unselectedLabelColor: Colors.grey,
                indicatorColor: ColorsManager.primary,
                labelPadding: const EdgeInsets.only(right: 32),
                tabs: tabs.map((t) => Tab(text: t)).toList(),
              ),

              const SizedBox(height: 16),

              
              Expanded(
                child: TabBarView(
                  children: tabs.map((tab) {
                    final items = tabData[tab]!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24,top: 148),
                          child: SearchBody(
                            image: item["image"],
                            title: item["title"],
                            subtitle: item["subtitle"],
                            buttonText: item["buttonText"],
                            onTap: () {
                              print("Tapped on ${item["title"]}");
                            },
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
