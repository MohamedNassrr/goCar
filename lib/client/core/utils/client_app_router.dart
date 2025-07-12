import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/client/features/auth/presentation/controller/phone_login_cubit/phone_login_cubit.dart';
import 'package:go_car/client/features/auth/presentation/views/login_view.dart';
import 'package:go_car/client/features/auth/presentation/views/otp_view.dart';
import 'package:go_car/client/features/auth/presentation/views/widgets/home.dart';
import 'package:go_car/client/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

abstract class ClientAppRouter {
  static const rOnboarding = '/';
  static const rLogin = '/LoginView';
  static const rOtpScreen = '/OtpView';
  static const rEmailScreen = '/EmailView';
  static const rHome = '/Home';

  static final router = GoRouter(
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
              child: const OtpView(),
            ),
      ),

      GoRoute(path: rHome, builder: (context, state) => const Home()),
    ],
  );
}
