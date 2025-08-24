import 'package:flutter/material.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/features/home/presentation/views/model/category_card_model.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    super.key,
    required this.categoryCardModel,
    required this.ontap,
  });
  CategoryCardModel categoryCardModel;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            width: 100,

            decoration: ShapeDecoration(
              color: ColorsManager.primary.withOpacity(.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // الصورة الأصلية
                Transform.rotate(
                  angle: -0.20,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Image.asset(
                      categoryCardModel.cImage,
                      width: 57,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // الانعكاس
                ClipRect(
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationX(3.1416),
                    child: Opacity(
                      opacity: 0.3,
                      child: ShaderMask(
                        shaderCallback:
                            (bounds) => LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.4),
                                Colors.transparent,
                              ],
                            ).createShader(bounds),
                        blendMode: BlendMode.dstIn,
                        child: SizedBox(
                          height: 20, // جزء صغير للانعكاس
                          child: Image.asset(
                            categoryCardModel.cImage,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
