abstract class Failures{
  final String errorMessage;

  const Failures(this.errorMessage);
}

class GoogleSignInFailure extends Failures{
  GoogleSignInFailure(super.errorMessage);
  factory GoogleSignInFailure.fromCode(String code) {
    switch (code) {
      case 'network_error':
        return  GoogleSignInFailure('Network error. Please check your internet connection.');
      case 'sign_in_canceled':
        return  GoogleSignInFailure('Sign-in was canceled by the user.');
      case 'popup_closed_by_user':
        return  GoogleSignInFailure('The sign-in popup was closed before completing.');
      case 'idpiframe_initialization_failed':
        return  GoogleSignInFailure('Browser configuration error.');
      case 'access_denied':
        return  GoogleSignInFailure('Access denied. Please grant permissions.');
      case 'user_disabled':
        return  GoogleSignInFailure('This user account has been disabled.');
      case 'email-already-exists':
        return  GoogleSignInFailure('Email address already exists, please try another one');
      default:
        return  GoogleSignInFailure('Unknown error, please try again later!');
    }
  }


}
