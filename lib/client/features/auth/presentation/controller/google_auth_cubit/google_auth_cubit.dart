import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:go_car/client/core/failures/client_failures.dart';
import 'package:go_car/client/core/services/google_auth_service.dart';
import 'package:go_car/client/features/auth/presentation/controller/google_auth_cubit/google_auth_states.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthStates> {
  GoogleAuthCubit(this._googleAuthService) : super(GoogleInitialStates());

  final GoogleAuthService _googleAuthService;

  Future<void> googleAuth() async {
    emit(GoogleLoadingStates());
    try {
      await _googleAuthService.googleSignIn();
      emit(GoogleSuccessStates());
    } catch (e) {
      emit(GoogleFailureStates(failure: e.toString()));
      log(e.toString());
      if (e is GoogleSignInFailure) {
         GoogleSignInFailure.fromCode(e.toString());
      }
       GoogleSignInFailure(e.toString());
    }
  }

  Future<void> signOut() async {
    await _googleAuthService.signOut();
    emit(GoogleSignOutSuccessStates());
  }
}
