import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:go_car/client/core/widgets/custom_gps_marker.dart';
import 'package:go_car/client/features/home/presentation/controller/tracking_user_cubit/tracking_user_state.dart';
import 'package:go_car/core/services/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class TrackingUserCubit extends Cubit<TrackingUserState> {
  StreamSubscription<LocationData>? _locationSubscription;
  Set<Marker> markers = {};
  TrackingUserCubit() : super(TrackingUserInitialStates());

  void trackingUpdated(GoogleMapController googleMapController) async {
   var customMarker =  await MarkerGenerator.createGoogleMapsUserDot();
    emit(TrackingUserLoadingStates());
    try {
      _locationSubscription?.cancel();
      emit(TrackingUserLoadingStates());
      _locationSubscription = LocationService().location.onLocationChanged
          .listen((locationData) {
            final userLocation = LatLng(
              locationData.latitude!,
              locationData.longitude!,
            );
            var marker = Marker(
              markerId: const MarkerId('userMarker'),
              position: userLocation,

              icon:  customMarker,
            );
            markers.add(marker);
            emit(TrackingUserUpdatedStates());
            googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(target: userLocation, zoom: 17),
              ),
            );
          });
      emit(TrackingUserUpdatedStates());
    } on LocationServiceException catch (e) {
      emit(TrackingUserServerFailureStates(failure: e.toString()));
      log('error in server: ${e.toString()}');
    } on LocationPermissionException catch (e) {
      emit(TrackingUserPermissionFailureStates(failure: e.toString()));
      log('error in permissions: ${e.toString()}');
    } catch (e) {
      emit(TrackingUserFailureStates(failure: e.toString()));
      log(e.toString());
    }
  }

  selectedLocation({required String selectedLocation}) {
    emit(SelectedLocationStates(selectedLocation));
    return selectedLocation;
  }
}
