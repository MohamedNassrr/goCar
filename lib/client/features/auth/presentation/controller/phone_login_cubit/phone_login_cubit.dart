import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/client/features/auth/presentation/controller/phone_login_cubit/phone_login_states.dart';
import 'package:go_car/core/failures/firebase_auth_failure.dart';

class PhoneLoginCubit extends Cubit<PhoneLoginStates> {
  PhoneLoginCubit() : super(PhoneInitialStates());

  final _auth = FirebaseAuth.instance;
   String verificationId = '';

  void phoneAuth({required String phoneNumber}) {
    emit(PhoneLoadingStates());
    _auth.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 30),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationField,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }


  void verificationCompleted (phoneAuthCredential) async {
    emit(PhoneVerifiedStates());
    await _auth.signInWithCredential(phoneAuthCredential);
  }
  void verificationField (e) {
    final failure = FirebaseAuthFailure.fromCode(e.code);
    emit(PhoneFailureStates(failure: failure.message));
    log(failure.message.toString());
  }
  void codeSent (verificationId, resendToken) async {
    debugPrint('code sent');
    this.verificationId = verificationId;
    emit(PhoneCodeSubmittedStates());
  }
  void codeAutoRetrievalTimeout (String verificationId){}

  Future<void> submitOtp(String otpCode) async{
    emit(PhoneLoadingStates());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: this.verificationId, smsCode: otpCode);
    try {
      await _auth.signInWithCredential(credential);
      emit(PhoneSuccessStates());
    } catch (e) {
     if(e is FirebaseAuthException){
       final failure = FirebaseAuthFailure.fromCode(e.code);
       emit(PhoneFailureStates(failure: failure.message));
       log(failure.message.toString());
     }
    }
  }

}
