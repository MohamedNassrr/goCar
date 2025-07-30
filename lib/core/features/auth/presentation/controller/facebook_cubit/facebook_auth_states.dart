abstract class FacebookAuthState {}

class FacebookAuthInitialState extends FacebookAuthState {}

class FacebookAuthLoadingState extends FacebookAuthState {}

class FacebookAuthSuccessState extends FacebookAuthState {}

class FacebookAuthSignOutSuccessState extends FacebookAuthState {}

class FacebookAuthFailureState extends FacebookAuthState {
  final String failure;

  FacebookAuthFailureState({required this.failure});
}
