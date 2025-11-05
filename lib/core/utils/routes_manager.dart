import 'package:flutter/material.dart';
import 'package:talabat/features/auth/presentation/views/login_with_email.dart';
import 'package:talabat/features/auth/presentation/views/register_view.dart';
import 'package:talabat/features/home/presentation/views/home_view.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/food_view.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/map_view.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/talabat_mart_view.dart';
import 'package:talabat/features/splash/presentation/views/splash_view.dart';
import 'package:talabat/features/welcome/presentation/views/welcome_view.dart';

import '../../features/home/presentation/views/tabs/home/presentation/views/food_details_view.dart';
import '../../features/home/presentation/views/tabs/home/presentation/views/restaurant_view.dart';
 

class RoutesManager {
  static const String splashRoute = '/';
  static const String welcome = "welcome";
  static const String register = "register";
  static const String home = "home";
  static const String food = "food";
  static const String talabatMart = "talabatMart";
  static const String loginWithEmail = "loginWithEmail";
  static const String mapView = "mapView";
  static const String restaurantView = "restaurantView";
  static const String foodDetailsView = "foodDetailsView";
 

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
        case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
        case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
        case food:
        return MaterialPageRoute(builder: (_) => const FoodView());
        case talabatMart:
        return MaterialPageRoute(builder: (_) => const TalabatMartView());
        case loginWithEmail :
        return MaterialPageRoute(builder: (_) => const LoginWithEmail());
        case register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
        case mapView:
        return MaterialPageRoute(builder: (_) => const MapView());
        case foodDetailsView:
        return MaterialPageRoute(builder: (_) => const FoodDetailsView());

        case restaurantView:
        return MaterialPageRoute(builder: (_) => const RestaurantView());
        default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
