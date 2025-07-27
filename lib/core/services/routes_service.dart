import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_car/core/models/routes_model/routes_model.dart';

class RoutesService {
  final Dio _dio = Dio();

  final String _baseUrl =
      'https://routes.googleapis.com/directions/v2:computeRoutes';

  Future<RoutesModel> fetchRoutes({
    required double latitude,
    required double longitude,
    required String placeId,
  }) async {
    var response = await _dio.post(
      _baseUrl,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-Goog-Api-Key': '${dotenv.env['GOOGLE_APIS_KEY']}',
          'X-Goog-FieldMask':
              'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline',
        },
      ),
      data: {
        "origin": {
          "location": {
            "latLng": {"latitude": latitude, "longitude": longitude},
          },
        },
        "destination": {
          "placeId": placeId,
        },
        "travelMode": "DRIVE",
        "routingPreference": "TRAFFIC_AWARE_OPTIMAL",
        "computeAlternativeRoutes": false,
        "routeModifiers": {
          "avoidTolls": false,
          "avoidHighways": false,
          "avoidFerries": false,
        },
        "languageCode": "en-US",
        "units": "METRIC",
      },
    );

    if (response.statusCode == 200) {
      return RoutesModel.fromJson(response.data);

    } else {
      throw Exception('Error: ${response.data}');
    }
  }
}
