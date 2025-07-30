import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/core/features/auth/presentation/controller/phone_login_cubit/phone_login_cubit.dart';
import 'package:go_car/core/features/auth/presentation/views/login_view.dart';
import 'package:go_car/core/features/auth/presentation/views/otp_view.dart';
import 'package:go_car/driver/features/driver_home/presentation/views/driver_home_view.dart';
import 'package:go_router/go_router.dart';

abstract class DriverAppRouter {
  static const rLogin = '/';
  static const rOtpScreen = '/OtpView';
  static const rDriverHomeView = '/DriverHomeView';

  static final router = GoRouter(
    initialLocation: initialScreen(),
    routes: [
      GoRoute(
        path: rOtpScreen,
        builder:
            (context, state) => BlocProvider.value(
              value: state.extra as PhoneLoginCubit,
              child: const OtpView(successRouting: rDriverHomeView),
            ),
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
        path: rDriverHomeView,
        builder: (context, state) => const DriverHomeView(),
      ),
    ],
  );
  static String initialScreen() {
    User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return rDriverHomeView;
      } else {
        return rLogin;
      }
  
  }
}
