import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/client/features/home/presentation/controller/tracking_user_cubit/tracking_user_cubit.dart';
import 'package:go_car/client/features/home/presentation/controller/tracking_user_cubit/tracking_user_state.dart';
import 'package:go_car/client/features/home/presentation/views/widgets/custom_maps_bottom_sheet.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackingUserCubit, TrackingUserState>(
      builder: (context, state) {
        var mapsCubit = context.read<TrackingUserCubit>();
        return Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              initialCameraPosition: const CameraPosition(
                target: LatLng(30.064921, 31.367242),
                zoom: 5.6,
              ),
              markers: mapsCubit.markers,
              onMapCreated: (controller) {
                mapsCubit.googleMapController = controller;
                mapsCubit.trackingUpdated();
              },
            ),
            const CustomMapsBottomSheet(),
          ],
        );
      },
    );
  }
}
