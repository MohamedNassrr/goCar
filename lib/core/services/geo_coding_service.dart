import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_car/client/features/home/data/models/geo_coding_model/geo_coding_model.dart';

class GeoCodingService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://maps.googleapis.com/maps/api/geocode/json';

  Future<List<GeoCodingModel>> getLocation({
    required double latitude,
    required double longitude,
  }) async {
    var response = await _dio.get(
      '$baseUrl?latlng=$latitude,$longitude&key=${dotenv.env['GOOGLE_APIS_KEY']}',
    );

    if (response.statusCode == 200) {
      var result = response.data;
      List<GeoCodingModel> geoModel = [];
      for (var data in result['results']) {
        geoModel.add(GeoCodingModel.fromJson(data));
      }
      return geoModel;
    }
    throw Exception();
  }
}
