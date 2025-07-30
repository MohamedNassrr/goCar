import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PlacesService {
  final Dio _dio = Dio();
  final String baseUrl =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';

  Future<dynamic> getPredict({
    required String input,
    required String sessionToken,
  }) async {
    var response = await _dio.get(
      '$baseUrl?input=$input&types=geocode&key=${dotenv.env['GOOGLE_APIS_KEY']}&sessiontoken=$sessionToken',
    );

    return response.data;
  }
}
