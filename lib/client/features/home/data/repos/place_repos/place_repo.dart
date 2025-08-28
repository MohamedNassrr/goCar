import 'package:dartz/dartz.dart';
import 'package:go_car/client/features/home/data/models/places_model/places_model.dart';
import 'package:go_car/core/failures/api_failures.dart';

abstract class PlaceRepo {
  Future<Either<ApisFailure, List<PlacesModel>>> fetchPrediction({
    required String input,
    required String sessionToken,
  });
}
