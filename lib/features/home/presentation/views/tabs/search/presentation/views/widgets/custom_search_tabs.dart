import 'package:flutter/material.dart';
import 'package:talabat/core/utils/colors_manger.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs({super.key, required this.tabs, this.onTap});

  final List<String> tabs;
  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Align(  
        alignment: Alignment.centerLeft,
        child: TabBar(
          isScrollable: true,
          labelColor: ColorsManager.primary,
          unselectedLabelColor: Colors.grey,
          indicatorColor: ColorsManager.primary,
          labelPadding: const EdgeInsets.only(right: 32),  
          onTap: (index) {
            if (onTap != null) {
              onTap!(tabs[index]);
            }
          },
          tabs: tabs
              .map(
                (tab) => Tab(
                  child: Text(
                    tab,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.01,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
