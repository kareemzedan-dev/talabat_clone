import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/core/widgets/custom_container_with_icon.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/restaurant_card_details.dart';
import '../../../../../../../../../core/utils/assets_manager.dart';

class RestaurantViewBody extends StatelessWidget {
  const RestaurantViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 220.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    Assets.assetsImagesCoverImage,
                    fit: BoxFit.cover,
                    height: 220.h,
                    width: double.infinity,
                  ),
                ),
                Container(
                  height: 220.h,
                  width: double.infinity,
                  decoration:
                  BoxDecoration(color: Colors.white.withOpacity(0.2)),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 40,
                      ),
                      child: Row(
                        children: [
                          CustomContainerWithIcon(
                              icon: FontAwesomeIcons.arrowLeft),
                          const Spacer(),
                          CustomContainerWithIcon(
                              icon: FontAwesomeIcons.arrowUpFromBracket),
                          SizedBox(width: 8.w),
                          CustomContainerWithIcon(
                              icon: FontAwesomeIcons.magnifyingGlass),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: 343.w,
                      height: 175.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.w,
                            color: Colors.black.withValues(alpha: 0.25),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RestaurantCardDetails(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.menu, color: Colors.black),

                  Expanded(
                    child: TabBar(
                      isScrollable: true,
                      labelColor: ColorsManager.primary,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: ColorsManager.primary,
                      padding: EdgeInsets.zero,
                      tabAlignment: TabAlignment.center,


                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 2,
                      labelStyle: TextStyle(

                          color: Colors.black.withValues(alpha: 0.70),
                          fontSize: 12.sp,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,

                      ),
                      tabs: const [
                        Tab(text: 'Trending 🔥'),
                        Tab(text: 'offers'),
                        Tab(text: 'pizza'),
                        Tab(text: 'Trending 🔥'),
                        Tab(text: 'offers'),
                        Tab(text: 'pizza'),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(
              height: 400.h,
              child: TabBarView(
                children: [
                  Center(child: Text('Menu Content')),
                  Center(child: Text('Reviews Content')),
                  Center(child: Text('Info Content')),
                  Center(child: Text('Menu Content')),
                  Center(child: Text('Reviews Content')),
                  Center(child: Text('Info Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
