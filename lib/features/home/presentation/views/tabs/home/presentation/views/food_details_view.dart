import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/food_details_view_body.dart';

class  FoodDetailsView extends StatelessWidget {
  const  FoodDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.white,
      body: FoodDetailsViewBody(),
    );
  }
}
