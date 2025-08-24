
  import 'package:flutter/material.dart';

Text buildPrivacyPolicy() {

    
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'By creating an account you agree to the ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'privacy policy',
            style: TextStyle(
              color: const Color(0xFFFF6100),
              fontSize: 13,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: ' and\nto the ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: ' terms of use',
            style: TextStyle(
              color: const Color(0xFFFF6100),
              fontSize: 13,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }