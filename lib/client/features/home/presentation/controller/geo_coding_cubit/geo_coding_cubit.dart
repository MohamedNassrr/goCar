import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:go_car/client/features/home/presentation/controller/geo_coding_cubit/geo_coding_state.dart';
import 'package:go_car/core/services/geo_coding_service.dart';
import 'package:go_car/core/services/location_service.dart';

class GeoCodingCubit extends Cubit<GeoCodingState> {
  GeoCodingCubit() : super(GeoCodingInitialStates());

  final geoCodingService = GeoCodingService();

  Future<void> convertToString() async {
    try {
      var locationData = await LocationService().getLocation();
      final address = await geoCodingService.getLocation(
        latitude: locationData.latitude!,
        longitude: locationData.longitude!,
      );

      emit(
        GeoCodingConvertedStates(
          address: address[0].formattedAddress.toString(),
        ),
      );
    } catch (e) {
      emit(GeoCodingConvertedFailureStates(failure: e.toString()));
      log('convertFailure: ${e.toString()}');
    }
  }
}
