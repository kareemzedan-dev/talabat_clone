import 'package:flutter/material.dart';
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
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, RoutesManager.welcome);
    });
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: ColorsManager.primary,
      body: SplashViewBody(),
    );
  }
}