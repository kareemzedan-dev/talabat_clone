import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:talabat/features/home/presentation/views/model/category_card_model.dart';

class ShortcutsCard extends StatelessWidget {
  ShortcutsCard({super.key, required this.categoryCardModel});
  CategoryCardModel categoryCardModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
    width: 65,
  height: 65,
          decoration: ShapeDecoration(
            color: const Color(0XFFFFEEE6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Image.asset(categoryCardModel.cImage),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          categoryCardModel.cName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
            letterSpacing: 0.01,
          ),
        ),
      ],
    );
  }
}
