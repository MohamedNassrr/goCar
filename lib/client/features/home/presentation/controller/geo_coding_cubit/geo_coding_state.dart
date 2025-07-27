sealed class GeoCodingState {}

final class GeoCodingInitialStates extends GeoCodingState {}

final class GeoCodingLoadingStates extends GeoCodingState {}

final class GeoCodingConvertedStates extends GeoCodingState {
  final String address;

  GeoCodingConvertedStates({required this.address});
}

final class GeoCodingConvertedFailureStates extends GeoCodingState {
  final String failure;

  GeoCodingConvertedFailureStates({required this.failure});
}
