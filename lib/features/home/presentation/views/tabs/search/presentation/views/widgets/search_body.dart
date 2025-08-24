import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';

class SearchBody extends StatelessWidget {
    SearchBody({super.key, this.image, this.title, this.subtitle, this.onTap, this.buttonText});
  String ? image , title , subtitle  ,   buttonText ;
  VoidCallback ? onTap ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage( image!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 32),
        Text(
          title!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 16),
        Text(
          subtitle!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.50),
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 32),
        GestureDetector(
          onTap: onTap!,
          child: Container(
            width: 120,
            height: 32,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: const Color(0xFFFF6100)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                buttonText!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFFF6100),
                  fontSize: 12,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
