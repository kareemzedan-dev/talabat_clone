import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/home_view_tab.dart';
import 'package:talabat/features/home/presentation/views/tabs/search/presentation/views/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

int currentIndex = 0;
List<Widget> screens = [
  HomeViewTab(),
  SearchTabView(),
  Container(color: Colors.green),
];

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      bottomNavigationBar: CustomBottomNavigationBar(),

      backgroundColor: Colors.white,
      body: screens[currentIndex],
    );
  }

  BottomNavigationBar CustomBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.transparent,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.transparent,
      ),
      selectedItemColor: ColorsManager.primary,
      unselectedItemColor: Colors.black.withOpacity(0.5),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            Assets.assetsImagesHomeIc,
            color: Colors.black.withOpacity(0.5),
          ),
          activeIcon: Image.asset(
            Assets.assetsImagesHomeIc,
            color: ColorsManager.primary,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Assets.assetsImagesCarbonSearch,
            color: Colors.black.withOpacity(0.5),
          ),
          activeIcon: Image.asset(
            Assets.assetsImagesCarbonSearch,
            color: ColorsManager.primary,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Assets.assetsImagesPerson,
            color: Colors.black.withOpacity(0.5),
          ),
          activeIcon: Image.asset(
            Assets.assetsImagesPerson,
            color: ColorsManager.primary,
          ),
          label: 'Account',
        ),
      ],
    );
  }
}
