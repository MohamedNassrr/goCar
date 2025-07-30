import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/core/controllers/tracking_user_cubit/tracking_user_cubit.dart';
import 'package:go_car/core/controllers/tracking_user_cubit/tracking_user_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverHomeViewBody extends StatefulWidget {
  const DriverHomeViewBody({super.key});

  @override
  State<DriverHomeViewBody> createState() => _DriverHomeViewBodyState();
}

late GoogleMapController googleMapController;

class _DriverHomeViewBodyState extends State<DriverHomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackingUserCubit, TrackingUserState>(
      builder: (context, state) {
        var driverMapCubit = context.read<TrackingUserCubit>();
        return GoogleMap(
          zoomControlsEnabled: false,
          markers: driverMapCubit.markers,
          initialCameraPosition: const CameraPosition(
            target: LatLng(30.064921, 31.367242),
            zoom: 5.6,
          ),
          onMapCreated: (controller) {
            googleMapController = controller;
            driverMapCubit.trackingUpdated(googleMapController);
          },
        );
      },
    );
  }
}
