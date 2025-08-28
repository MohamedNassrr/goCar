abstract class GoogleAuthStates {}

class GoogleInitialStates extends GoogleAuthStates {}

class GoogleLoadingStates extends GoogleAuthStates {}

class GoogleSuccessStates extends GoogleAuthStates {}

class GoogleSignOutSuccessStates extends GoogleAuthStates {}

class GoogleFailureStates extends GoogleAuthStates {
  final String failure;

  GoogleFailureStates({required this.failure});
}
