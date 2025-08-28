import 'package:firebase_database/firebase_database.dart';
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
final ref = FirebaseDatabase.instance.ref();

class _DriverHomeViewBodyState extends State<DriverHomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackingUserCubit, TrackingUserState>(
      builder: (context, state) {
        var driverMapCubit = context.read<TrackingUserCubit>();
        return Stack(
          children: [
            GoogleMap(
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
            ),
            Positioned(
              bottom: 15,
              left: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  // default value is false
                  // press the btn change to true and change value
                  // in database to new value
                  // press btn again change to inverse of value
                  // and change the value to new one on database
                },
                child: Text(
                  'Start'.toUpperCase(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
