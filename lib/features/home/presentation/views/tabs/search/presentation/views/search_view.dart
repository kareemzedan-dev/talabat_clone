import 'package:flutter/material.dart';
import 'package:talabat/features/home/presentation/views/tabs/search/presentation/views/widgets/search_view_body.dart';

class SearchTabView extends StatelessWidget {
  const SearchTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body: SearchTabViewBody(),
    );
  }
}