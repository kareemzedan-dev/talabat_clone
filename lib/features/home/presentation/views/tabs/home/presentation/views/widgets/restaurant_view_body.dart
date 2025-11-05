import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/core/widgets/custom_container_with_icon.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/restaurant_card_details.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/restaurant_trending_section.dart';
import '../../../../../../../../../core/utils/assets_manager.dart';
import 'food_item_list_view.dart';

class RestaurantViewBody extends StatefulWidget {
  const RestaurantViewBody({super.key});

  @override
  State<RestaurantViewBody> createState() => _RestaurantViewBodyState();
}

class _RestaurantViewBodyState extends State<RestaurantViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();


  final List<Map<String, dynamic>> sections = [
    {'title': 'Trending 🔥', 'widget': const RestaurantTrendingSection()},
    {'title': 'Offers', 'widget': const FoodItemListView(title: "Offers",)},
    {'title': 'Pizza', 'widget': const FoodItemListView(title: "Pizza",)},
    {'title': 'Burger', 'widget': const FoodItemListView(title: "Burger",)},
    {'title': 'Sushi', 'widget': const FoodItemListView(title: "Sushi",)},
    {'title': 'Dessert', 'widget': const FoodItemListView(title: "Dessert",)},
  ];

  late List<GlobalKey> sectionKeys;

  @override
  void initState() {
    super.initState();
    sectionKeys = List.generate(sections.length, (_) => GlobalKey());
    _tabController = TabController(length: sections.length, vsync: this);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onScroll() {
    for (int i = 0; i < sectionKeys.length; i++) {
      final keyContext = sectionKeys[i].currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;
        if (position < 150 && position > -box.size.height / 2) {
          if (_tabController.index != i) {
            _tabController.animateTo(i);
          }
          break;
        }
      }
    }
  }

  void scrollToSection(int index) {
    final keyContext = sectionKeys[index].currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sections.length,
      child: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // ====== COVER IMAGE + HEADER ======
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Container(
                      height: 220.h,
                      width: double.infinity,
                      child: Image.asset(
                        Assets.assetsImagesCoverImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 220.h,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 40,
                          ),
                          child: Row(
                            children: [
                              CustomContainerWithIcon(
                                icon: FontAwesomeIcons.arrowLeft,
                              ),
                              const Spacer(),
                              CustomContainerWithIcon(
                                icon: FontAwesomeIcons.arrowUpFromBracket,
                              ),
                              SizedBox(width: 8.w),
                              CustomContainerWithIcon(
                                icon: FontAwesomeIcons.magnifyingGlass,
                              ),
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
                                color: Colors.black.withOpacity(0.25),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: RestaurantCardDetails(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ====== TABBAR ======
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabBarDelegate(
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: ColorsManager.primary,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: ColorsManager.primary,
                    dividerHeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabAlignment: TabAlignment.center,
                    indicatorWeight: 2,
                    labelStyle: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                    onTap: scrollToSection,
                    tabs: sections
                        .map((s) => Tab(text: s['title'] as String))
                        .toList(),
                  ),
                ),
              ),

              // ====== SECTION LIST ======
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        for (int i = 0; i < sections.length; i++)
                          sectionWidget(sectionKeys[i], sections[i]['widget']),
                        SizedBox(height: 80.h),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),

          // ====== BOTTOM BASKET BAR ======
          Padding(
            padding: EdgeInsets.only(bottom: 34.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 343.w,
                height: 48.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFFCDB2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 3.0,
                            horizontal: 10.0,
                          ),
                          child: Text(
                            "0",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      const Text(
                        'View basket',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'AED 0.00',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionWidget(Key key, Widget child) {
    return Container(
      key: key,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: child,
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  _TabBarDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: _tabBar,
      ),
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height + 20.h;
  @override
  double get minExtent => _tabBar.preferredSize.height + 20.h;
  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) => false;
}
