import 'package:flutter/material.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/home_view_tab_body.dart';

class HomeViewTab extends StatelessWidget {
  const HomeViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body: HomeViewTabBody(),
    );
  }
}