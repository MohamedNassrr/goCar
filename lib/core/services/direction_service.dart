import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DirectionService {
  final Dio _dio = Dio();
  final String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json';

  Future<dynamic> getDirection({
    required String placeId,
    required double latitude,
    required double longitude,
  }) async {
    var response = await _dio.get(
      '$_baseUrl?destination=place_id:$placeId&origin=$latitude,$longitude&key=${dotenv.env['GOOGLE_APIS_KEY']}&units=metric',
    );
    return response.data;
  }
}
