import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:talabat/core/utils/app_text_styles.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/features/home/presentation/views/tabs/home/presentation/views/widgets/search_text_field.dart';

class MapViewBody extends StatefulWidget {
  const MapViewBody({super.key});

  @override
  State<MapViewBody> createState() => _MapViewBodyState();
}

final LatLng _center = const LatLng(30.0444, 31.2357);

void _onMapCreated(GoogleMapController controller) {
  controller.animateCamera(CameraUpdate.newLatLng(_center));
}

class _MapViewBodyState extends State<MapViewBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 14.0),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        ),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: ColorsManager.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SearchTextField(context),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  } 
}
