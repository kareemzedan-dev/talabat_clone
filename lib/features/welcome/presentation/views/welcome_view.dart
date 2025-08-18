import 'package:flutter/material.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/features/welcome/presentation/views/widgets/welcome_view_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: ColorsManager.white,
      body:WelcomeViewBody(),
    );
  }
}