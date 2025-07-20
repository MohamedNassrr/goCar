sealed class TrackingUserState {}

final class TrackingUserInitialStates extends TrackingUserState {}

final class TrackingUserLoadingStates extends TrackingUserState {}

final class TrackingUserUpdatedStates extends TrackingUserState {}

final class TrackingUserFailureStates extends TrackingUserState {
  final String failure;

  TrackingUserFailureStates({required this.failure});
}

final class TrackingUserServerFailureStates extends TrackingUserState {
  final String failure;

  TrackingUserServerFailureStates({required this.failure});
}

final class TrackingUserPermissionFailureStates extends TrackingUserState {
  final String failure;

  TrackingUserPermissionFailureStates({required this.failure});
}
