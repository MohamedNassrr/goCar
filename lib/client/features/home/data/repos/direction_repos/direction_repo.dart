import 'package:dartz/dartz.dart';
import 'package:go_car/core/failures/api_failures.dart';
import 'package:go_car/core/models/direction_model/direction_model.dart';

abstract class DestinationRepo {
  Future<Either<ApisFailure, List<DirectionModel>>> fetchDirections({
    required String placeId,
    required double latitude,
    required double longitude,
  });
}
