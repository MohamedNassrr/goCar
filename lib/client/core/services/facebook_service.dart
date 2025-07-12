import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  Future<User?> facebookSignIn() async {
    final LoginResult loginResult = await _facebookAuth.login(
      loginBehavior: LoginBehavior.webOnly,
    );
    final OAuthCredential credential = FacebookAuthProvider.credential(
      loginResult.accessToken!.token,
    );

    final UserCredential userCredential = await _auth.signInWithCredential(
        credential);

    return userCredential.user;
  }

  Future<void> facebookSignOut() async {
    await _facebookAuth.logOut();
    await _auth.signOut();
  }

}
