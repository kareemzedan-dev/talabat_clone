import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/food_view_body.dart';

class FoodView extends StatelessWidget {
  const FoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivering to ',
              style: TextStyle(
                color: Colors.black.withValues(alpha: 0.50),
                fontSize: 10,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4),
            const Text(
              'Al satwa',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(Assets.assetsImagesCarbonSearch),
          ),
        ],
      ),

      backgroundColor: Colors.white,

      body: FoodViewBody(),
    );
  }
}
