import 'package:flutter/material.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/map_view_body.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: Colors.white,
      body: MapViewBody(),
    );
  }
}