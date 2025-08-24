import 'package:flutter/material.dart';
import 'package:talabat/core/helper/shared_preferences.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/core/utils/routes_manager.dart';
import 'package:talabat/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    final token = SharedPrefHelper.getString('token');
    final isFirstTime = SharedPrefHelper.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      await SharedPrefHelper.setBool('isFirstTime', false);
      Navigator.pushReplacementNamed(context, RoutesManager.welcome);
    } else {
      if (token != null) {
        Navigator.pushReplacementNamed(context, RoutesManager.home);
      } else {
        Navigator.pushReplacementNamed(context, RoutesManager.home);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: const SplashViewBody(),
    );
  }
}
