import 'package:get_it/get_it.dart';
import 'package:go_car/core/services/facebook_service.dart';
import 'package:go_car/core/services/google_auth_service.dart';
import 'package:go_car/core/services/places_service.dart';
import 'package:go_car/client/features/home/data/repos/place_repos/place_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton<GoogleAuthService>(GoogleAuthService());
  getIt.registerSingleton<FacebookAuthService>(FacebookAuthService());

  getIt.registerSingleton<PlacesService>(PlacesService());
  getIt.registerSingleton<PlacesRepoImpl>(
    PlacesRepoImpl(getIt.get<PlacesService>()),
  );
}
