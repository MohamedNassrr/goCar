import 'package:go_car/client/features/home/data/models/places_model/places_model.dart';

sealed class SearchState {}

final class SearchInitialStates extends SearchState {}

final class SearchLoadingStates extends SearchState {}

final class SearchSuccessStates extends SearchState {
  final List<PlacesModel> places;

  SearchSuccessStates({required this.places});
}

final class SearchFailureStates extends SearchState {
  final String failure;

  SearchFailureStates({required this.failure});
}
