import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/core/services/local_storage.dart';
import 'package:go_car/core/features/auth/presentation/controller/phone_login_cubit/phone_login_cubit.dart';
import 'package:go_car/core/features/auth/presentation/views/login_view.dart';
import 'package:go_car/core/features/auth/presentation/views/otp_view.dart';
import 'package:go_car/client/features/home/presentation/views/home_view.dart';
import 'package:go_car/client/features/home/presentation/views/select_destination_view.dart';
import 'package:go_car/client/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

abstract class ClientAppRouter {
  static const rOnboarding = '/';
  static const rLogin = '/LoginView';
  static const rOtpScreen = '/OtpView';
  static const rEmailScreen = '/EmailView';
  static const rHomeScreen = '/HomeView';
  static const rDestinationScreen = '/SelectDestinationView';
  static const rTripRequestScreen = '/TripRequestView';

  static final router = GoRouter(
    initialLocation: initialScreen(),
    routes: [
      GoRoute(
        path: rOnboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: rLogin,
        builder:
            (context, state) => BlocProvider(
              create: (context) => PhoneLoginCubit(),
              child: const LoginView(),
            ),
      ),
      GoRoute(
        path: rOtpScreen,
        builder:
            (context, state) => BlocProvider.value(
              value: state.extra as PhoneLoginCubit,
              child: const OtpView(successRouting: rHomeScreen),
            ),
      ),
      GoRoute(path: rHomeScreen, builder: (context, state) =>  const HomeView()),
      GoRoute(
        path: rDestinationScreen,
        builder: (context, state) => const SelectDestinationView(),
      ),
   
    ],
  );
  static String initialScreen() {
    final onboarding = LocalStorage.getData(key: 'onboarding');
    User? user = FirebaseAuth.instance.currentUser;

    if (onboarding != null) {
      if (user != null) {
        return rHomeScreen;
      } else {
        return rLogin;
      }
    } else {
      return rOnboarding;
    }
  }
}
