import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talabat/core/di/di.dart';
import 'package:talabat/core/helper/my_bloc_observer.dart';
import 'package:talabat/core/utils/routes_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  configureDependencies();
   Bloc.observer = MyBlocObserver();

  runApp(talabat());
}

class talabat extends StatelessWidget {
  const talabat({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: ThemeData(fontFamily: "Cairo"),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => RoutesManager.onGenerateRoute(settings),
      initialRoute: RoutesManager.splashRoute,
   
    );
  }
}