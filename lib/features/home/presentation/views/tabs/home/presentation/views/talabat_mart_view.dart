import 'package:flutter/material.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/talabat_mart_view_body.dart';

class TalabatMartView extends StatelessWidget {
  const TalabatMartView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
        title: const Text(
          'Talabat Mart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: TalabatMartViewBody(),
    );
  }
}