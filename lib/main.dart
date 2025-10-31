import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabat/core/di/di.dart';
import 'package:talabat/core/helper/my_bloc_observer.dart';
import 'package:talabat/core/helper/shared_preferences.dart';
import 'package:talabat/core/utils/routes_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefHelper.init();
  configureDependencies();
  Bloc.observer = MyBlocObserver();

  runApp(const Talabat());
}

class Talabat extends StatelessWidget {
  const Talabat({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(fontFamily: "Cairo"),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.onGenerateRoute,
          initialRoute: RoutesManager.restaurantView,
          builder: (context, widget) {
            ScreenUtil.init(context);
            return widget!;
          },
        );
      },
    );
  }
}
