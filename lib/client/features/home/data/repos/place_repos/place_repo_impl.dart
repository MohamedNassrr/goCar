import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:go_car/core/services/places_service.dart';
import 'package:go_car/client/features/home/data/models/places_model/places_model.dart';
import 'package:go_car/client/features/home/data/repos/place_repos/place_repo.dart';
import 'package:go_car/core/failures/api_failures.dart';

class PlacesRepoImpl implements PlaceRepo {
  final PlacesService placesService;

  PlacesRepoImpl(this.placesService);

  @override
  Future<Either<ApisFailure, List<PlacesModel>>> fetchPrediction({
    required String input,
    required String sessionToken,
  }) async {
    try {
      var data = await placesService.getPredict(
        input: input,
        sessionToken: sessionToken,
      );
      List<PlacesModel> places = [];
      for (var item in data['predictions']) {
        places.add(PlacesModel.fromJson(item));
      }
      return right(places);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }
}
