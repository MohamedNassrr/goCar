sealed class RoutingState {}

final class RoutingInitialStates extends RoutingState {}

final class RoutingLoadingStates extends RoutingState {}

final class RoutingSuccessStates extends RoutingState {}

final class RoutingFailureStates extends RoutingState {
  final String failure;

  RoutingFailureStates(this.failure);
}

final class RoutingDisplayLoadingStates extends RoutingState {}

final class RoutingDisplaySuccessStates extends RoutingState {}

final class RoutingDisplayFailureStates extends RoutingState {
  final String failure;

  RoutingDisplayFailureStates(this.failure);
}

