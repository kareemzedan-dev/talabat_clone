import 'package:flutter/material.dart';
import 'package:talabat/core/utils/routes_manager.dart';

void main(){
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
      initialRoute: RoutesManager.home,
   
    );
  }
}