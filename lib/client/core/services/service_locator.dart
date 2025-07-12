import 'package:get_it/get_it.dart';
import 'package:go_car/client/core/services/facebook_service.dart';
import 'package:go_car/client/core/services/google_auth_service.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator(){
  getIt.registerSingleton<GoogleAuthService>(GoogleAuthService());
  getIt.registerSingleton<FacebookAuthService>(FacebookAuthService());
}