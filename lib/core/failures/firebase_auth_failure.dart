class FirebaseAuthFailure {
  final String message;

  FirebaseAuthFailure({required this.message});

  factory FirebaseAuthFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-phone-number':
        return FirebaseAuthFailure(message: 'The phone number is not valid.');
      case 'too-many-requests':
        return FirebaseAuthFailure(
          message: 'Too many requests. Try again later.',
        );
      case 'network-request-failed':
        return FirebaseAuthFailure(
          message: 'Network error. Please check your connection.',
        );
      case 'session-expired':
        return FirebaseAuthFailure(
          message: 'The SMS code has expired. Please request a new code.',
        );
      case 'invalid-verification-code':
        return FirebaseAuthFailure(
          message: 'The SMS verification code is invalid.',
        );
      case 'user-disabled':
        return FirebaseAuthFailure(
          message: 'This user account has been disabled.',
        );
      case 'quota-exceeded':
        return FirebaseAuthFailure(message: 'Quota exceeded. Try again later.');
      default:
        return FirebaseAuthFailure(
          message: 'An unknown error occurred. Code: $code',
        );
    }
  }
}
