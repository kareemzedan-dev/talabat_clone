import 'package:flutter/material.dart';
import 'package:talabat/core/utils/app_text_styles.dart';
import 'package:talabat/core/utils/colors_manger.dart';
 
 
 

class CustomBotton extends StatelessWidget {
  CustomBotton({super.key, required this.title, required this.ontap});
  String title;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  MediaQuery .of(context).size.width ,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed:   ontap,
        child: Text(title,   style: TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w500,
  ),),
      ),
    );
  }
}
