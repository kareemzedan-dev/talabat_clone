// ShopByCategoryWidget.dart
import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';

class ShopByCategoryWidget extends StatelessWidget {
  const ShopByCategoryWidget({super.key});

  final List<Map<String, String>> categories = const [
    {"title": "Fruits", "image": Assets.assetsImagesFruit},
    {"title": "Milk & Yogurts", "image": Assets.assetsImagesMilk},
    {"title": "Cheese & Butter", "image": Assets.assetsImagesCheese},
    {"title": "Bakery", "image": Assets.assetsImagesBakery},
    {"title": "Poultry, Eggs,& Deli", "image": Assets.assetsImagesEggs},
    {"title": "Sweet Snacks", "image": Assets.assetsImagesSweet},
    {"title": "Biscuits & Wafers", "image": Assets.assetsImagesBiscuits},
    {"title": "Salted Snacks", "image": Assets.assetsImagesSalted},
    {"title": "Nuts and Seeds", "image": Assets.assetsImagesNuts},
    {"title": "Beverages", "image": Assets.assetsImagesBeverages},
    {"title": "Ice Cream", "image": Assets.assetsImagesIceCream},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 26,
      ),
      itemCount: categories.length + 1,
      itemBuilder: (context, index) {
        if (index == categories.length) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Assets.assetsImagesRectangle),
                              SizedBox(height: 1),
                        Image.asset(Assets.assetsImagesRectangle),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Assets.assetsImagesRectangle),
                              SizedBox(height: 1),
                        Image.asset(Assets.assetsImagesRectangle),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: const Text(
                  "View all categories",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ],
          );
        } else {
          // العناصر العادية
          final category = categories[index];
          return ShopByCategoryItem(
            title: category["title"]!,
            image: category["image"]!,
          );
        }
      },
    );
  }
}

class ShopByCategoryItem extends StatelessWidget {
  final String title;
  final String image;

  const ShopByCategoryItem({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),
        Flexible(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withValues(alpha: 0.70),
              fontSize: 12,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
            ),

            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
