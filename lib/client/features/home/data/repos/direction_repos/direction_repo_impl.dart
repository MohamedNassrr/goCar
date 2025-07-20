import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:go_car/client/features/home/data/repos/direction_repos/direction_repo.dart';
import 'package:go_car/core/failures/api_failures.dart';
import 'package:go_car/core/models/direction_model/direction_model.dart';
import 'package:go_car/core/services/direction_service.dart';

class DestinationRepoImpl implements DestinationRepo {
  final DirectionService directionService;

  DestinationRepoImpl({required this.directionService});

  @override
  Future<Either<ApisFailure, List<DirectionModel>>> fetchDirections({
    required String placeId,
    required double latitude,
    required double longitude,
  }) async {
    try {
      var data = await directionService.getDirection(
        placeId: placeId,
        latitude: latitude,
        longitude: longitude,
      );

      List<DirectionModel> directions = [];
      for (var item in data['routes']) {
        directions.add(DirectionModel.fromJson(item));
      }
      return right(directions);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }
}
