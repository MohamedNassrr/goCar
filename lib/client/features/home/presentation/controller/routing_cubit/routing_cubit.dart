import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:go_car/client/features/home/presentation/controller/routing_cubit/routing_state.dart';
import 'package:go_car/core/models/routes_model/routes_model.dart';
import 'package:go_car/core/services/routes_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class RoutingCubit extends Cubit<RoutingState> {
  RoutingCubit() : super(RoutingInitialStates());

  Future<List<LatLng>> getRoutes(
    LocationData locationData,
    Map<String, dynamic>? result,
  ) async {
    emit(RoutingLoadingStates());
    try {
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
      emit(RoutingSuccessStates());
      return points;
    } catch (e) {
      emit(RoutingFailureStates(e.toString()));
      throw Exception('routingFailure:${e.toString()}');
    }
  }

  void displayRoutes(
    List<LatLng> point,
    Set<Polyline> polylines,
    GoogleMapController googleMapController,
  ) {
    emit(RoutingLoadingStates());
    try {
      Polyline routing = Polyline(
        color: Colors.blue,
        width: 4,
        polylineId: const PolylineId('routing'),
        points: point,
      );
      polylines.add(routing);
      LatLngBounds bounds = getLatLngBounds(point);
      googleMapController.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 16),
      );
      emit(RoutingDisplaySuccessStates());
    } catch (e) {
      emit(RoutingDisplayFailureStates(e.toString()));
      debugPrint('displayinFalure:${e.toString()}');
    }
  }

  LatLngBounds getLatLngBounds(List<LatLng> point) {
    var southWestLatitude = point.first.latitude;
    var southWestLongitude = point.first.longitude;
    var northEastLatitude = point.first.latitude;
    var northEastLongitude = point.first.longitude;

    for (var bound in point) {
      southWestLatitude = min(southWestLatitude, bound.latitude);
      southWestLongitude = min(southWestLongitude, bound.longitude);
      northEastLatitude = max(northEastLatitude, bound.latitude);
      northEastLongitude = max(northEastLongitude, bound.longitude);
    }
    return LatLngBounds(
      southwest: LatLng(southWestLatitude, southWestLongitude),
      northeast: LatLng(northEastLatitude, northEastLongitude),
    );
  }
}
