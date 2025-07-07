abstract class PhoneLoginStates {}

class PhoneInitialStates extends PhoneLoginStates {}

class PhoneLoadingStates extends PhoneLoginStates {}

class PhoneSuccessStates extends PhoneLoginStates {}

class PhoneVerifiedStates extends PhoneLoginStates {}

class PhoneCodeSubmittedStates extends PhoneLoginStates {}

class PhoneVerificationFailedStates extends PhoneLoginStates {}

class PhoneFailureStates extends PhoneLoginStates {
  final String failure;

  PhoneFailureStates({required this.failure});
}