import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/client/core/services/facebook_service.dart';
import 'package:go_car/client/features/auth/presentation/controller/facebook_cubit/facebook_auth_states.dart';

class FacebookAuthCubit extends Cubit<FacebookAuthState> {
  FacebookAuthCubit(this._facebookAuthService)
    : super(FacebookAuthInitialState());

  final FacebookAuthService _facebookAuthService;

  Future<void> facebookSignIn() async {
    emit(FacebookAuthLoadingState());
    try {
      await _facebookAuthService.facebookSignIn();
      emit(FacebookAuthSuccessState());
    } catch (e) {
      emit(FacebookAuthFailureState(failure: e.toString()));
      log(e.toString());
    }
  }

  Future<void> facebookSignOut() async {
    await _facebookAuthService.facebookSignOut();
    emit(FacebookAuthSignOutSuccessState());
  }
}
