import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/banar_container.dart';
 
class bannerSection extends StatefulWidget {
  bannerSection({super.key});

  @override
  State<bannerSection> createState() => _bannerSectionState();
}
class _bannerSectionState extends State<bannerSection> {
  List<String> imageSliders = [
   Assets.assetsImagesBanner,
   Assets.assetsImagesBanner,
   Assets.assetsImagesBanner,
   Assets.assetsImagesBanner,
   Assets.assetsImagesBanner,
   Assets.assetsImagesBanner,

  ];

  int _currentIndex = 0;  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imageSliders.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return bannerContainer(image: image);
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 120.0,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 1200),
            autoPlayCurve: Curves.ease,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollPhysics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 8.0),
        DotsIndicator(
          dotsCount: imageSliders.length,
          position: _currentIndex.toDouble(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
