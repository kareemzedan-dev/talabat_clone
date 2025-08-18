import 'package:flutter/material.dart';
import 'package:talabat/features/home/presentation/views/home_view.dart';
import 'package:talabat/features/splash/presentation/views/splash_view.dart';
import 'package:talabat/features/welcome/presentation/views/welcome_view.dart';
 

class RoutesManager {
  static const String splashRoute = '/';
  static const String welcome = "welcome";
  static const String login = "login";
  static const String register = "register";
  static const String home = "home";
  static const String orderDetails = "orderDetails";

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
        case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
        case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
