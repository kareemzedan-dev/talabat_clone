import 'package:flutter/material.dart';
 

class bannerContainer extends StatelessWidget {
    bannerContainer({super.key,required this.image});
  String image ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
     height: 119,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
              image,
                 
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
