import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import 'package:talabat/core/utils/colors_manger.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(color: ColorsManager.secondary),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivering to',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'DM Sans',

                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Al Satwa, 81A Street',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.02,
                      ),
                    ),
                    SizedBox(width: 3),
                    Icon(Icons.arrow_drop_down, color: Colors.black),
                  ],
                ),

                SizedBox(height: 24),
                Text(
                  'Hey there!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.02,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Log in or create an account for a\nfaster ordering experience.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.01,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: 75,
                  height: 32,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFF6100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.01,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              height: 179,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  Assets.assetsImagesHeaderBanner,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
