import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/core/widgets/image_and_text.dart';

class TalabatMartOffersListView extends StatelessWidget {
  const TalabatMartOffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    // هنا بتحط كل الصور والأسامي في Lists
    final List<String> images = [
      Assets.assetsImagesOffer1,
      Assets.assetsImagesOffer2,
      Assets.assetsImagesOffer3,
      Assets.assetsImagesOffer4,
    
    ];

    final List<String> titles = [
      "Today’s \n Best Deals",
      "Everyday \n Discounts",
      "Imported 💥",
      "The Ara \n Taste",
 
    ];

    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: ImageAndText(
            image: images[index],
            text: titles[index],
          ),
        ),
      ),
    );
  }
}
