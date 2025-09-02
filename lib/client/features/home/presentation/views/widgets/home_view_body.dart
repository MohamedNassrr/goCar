import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/client/core/utils/client_app_router.dart';
import 'package:go_car/client/features/home/presentation/controller/routing_cubit/routing_cubit.dart';
import 'package:go_car/client/features/home/presentation/controller/routing_cubit/routing_state.dart';
import 'package:go_car/client/features/home/presentation/views/widgets/custom_maps_bottom_sheet.dart';
import 'package:go_car/client/features/home/presentation/views/widgets/select_car_bottom_sheet.dart';
import 'package:go_car/core/controllers/tracking_user_cubit/tracking_user_cubit.dart';
import 'package:go_car/core/controllers/tracking_user_cubit/tracking_user_state.dart';
import 'package:go_car/core/services/location_service.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  Set<Polyline> polylines = {};
  late GoogleMapController googleMapController;
  Map<String, dynamic>? result;

  @override
  Widget build(BuildContext context) {
    var mapsCubit = context.read<TrackingUserCubit>();
    return BlocBuilder<TrackingUserCubit, TrackingUserState>(
      builder: (context, state) {
        return Stack(
          children: [
            GoogleMap(
              polylines: polylines,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: const CameraPosition(
                target: LatLng(30.064921, 31.367242),
                zoom: 5.6,
              ),
              markers: mapsCubit.markers,
              onMapCreated: (controller) {
                googleMapController = controller;
                mapsCubit.trackingUpdated(googleMapController);
              },
            ),
            BlocBuilder<RoutingCubit, RoutingState>(
              builder: (context, state) {
                if (result != null) {
                  return const SelectCarBottomSheet();
                } else {
                  var routingCubit = context.read<RoutingCubit>();
                  return CustomMapsBottomSheet(
                    onSelect: () async {
                      final locationData =
                          await LocationService().getLocation();
                     
                        result = await GoRouter.of(
                          context,
                        ).push<Map<String, dynamic>>(
                          ClientAppRouter.rDestinationScreen,
                        );
                     

                      if (result != null && result!['placeId'] != null) {
                        mapsCubit.selectedLocation(
                          selectedLocation: result!['placeId'],
                        );
                      }
                      var point = await routingCubit.getRoutes(
                        locationData,
                        result,
                      );
                      routingCubit.displayRoutes(
                        point,
                        polylines,
                        googleMapController,
                      );
                    },
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
