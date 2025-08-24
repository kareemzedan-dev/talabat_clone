import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/core/utils/colors_manger.dart';

class RestaurantNameAndLoveRow extends StatelessWidget {
    RestaurantNameAndLoveRow({super.key,required this.rImage});
  String rImage ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                color: ColorsManager.card),
            child: Image.asset(rImage , fit: BoxFit.contain),
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.favorite_border_outlined,
              color: ColorsManager.black,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
