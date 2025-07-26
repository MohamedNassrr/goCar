import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:go_car/client/core/utils/client_app_router.dart';
import 'package:go_car/client/features/home/presentation/controller/tracking_user_cubit/tracking_user_cubit.dart';
import 'package:go_car/client/features/home/presentation/controller/tracking_user_cubit/tracking_user_state.dart';
import 'package:go_car/client/features/home/presentation/views/widgets/custom_maps_bottom_sheet.dart';
import 'package:go_car/core/models/routes_model/routes_model.dart';
import 'package:go_car/core/services/location_service.dart';
import 'package:go_car/core/services/routes_service.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeViewBody extends StatefulWidget {
   const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  Set<Polyline> polylines = {};


  @override
  Widget build(BuildContext context) {


    return BlocConsumer<TrackingUserCubit, TrackingUserState>(
      listener: (context, state) {},
      builder: (context, state) {
        var mapsCubit = context.read<TrackingUserCubit>();
        return Stack(
          children: [
            GoogleMap(
              polylines: polylines,
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
            CustomMapsBottomSheet(
              onSelect: () async {
                final locationData = await LocationService().getLocation();
                final result = await GoRouter.of(
                  context,
                ).push<Map<String, dynamic>>(
                  ClientAppRouter.rDestinationScreen,
                );
                if (result != null && result['placeId'] != null) {
                  print('Selected placeId: ${result['placeId']}');
                  mapsCubit.selectedLocation(
                    selectedLocation: result['placeId'],
                  );
                }
                var point = await getRoutes(locationData, result);
                displayRoutes(point);
              },
            ),
          ],
        );
      },
    );
  }

  Future<List<LatLng>> getRoutes(
    LocationData locationData,
    Map<String, dynamic>? result,
  ) async {
    RoutesModel routes = await RoutesService().fetchRoutes(
      latitude: locationData.latitude!,
      longitude: locationData.longitude!,
      placeId: result!['placeId'],
    );
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> results = polylinePoints.decodePolyline(
      routes.routes!.first.polyline!.encodedPolyline!,
    );
    List<LatLng> points =
        results.map((e) => LatLng(e.latitude, e.longitude)).toList();
    return points;
  }

  void displayRoutes(List<LatLng> point) {
    var mapsCubit = context.read<TrackingUserCubit>();
    Polyline routing = Polyline(
      color: Colors.blue,
      width: 4,
      polylineId: const PolylineId('routing'),
      points: point,
    );
    polylines.add(routing);
    LatLngBounds bounds = getLatLngBounds(point);
    mapsCubit.googleMapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 16));
    setState(() {

    });
  }

  LatLngBounds getLatLngBounds(List<LatLng> point) {
    var southWestLatitude = point.first.latitude;
    var southWestLongitude = point.first.longitude;
    var northEastLatitude = point.first.latitude;
    var northEastLongitude= point.first.longitude;

    for(var bound in point){
      southWestLatitude = min(southWestLatitude, bound.latitude);
      southWestLongitude = min(southWestLongitude, bound.longitude);
      northEastLatitude = max(northEastLatitude, bound.latitude);
      northEastLongitude = max(northEastLongitude, bound.longitude);
    }
    return LatLngBounds(southwest: LatLng(southWestLatitude, southWestLongitude), northeast: LatLng(northEastLatitude, northEastLongitude));
  }
}
