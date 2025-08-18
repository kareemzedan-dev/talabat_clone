import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(Assets.assetsImagesTalabat));
  }
}
