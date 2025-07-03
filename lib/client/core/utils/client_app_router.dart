import 'package:go_car/client/features/auth/presentation/views/login_view.dart';
import 'package:go_car/client/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

abstract class ClientAppRouter{
  static const rOnboarding = '/';
  static const rLogin = '/LoginView';

  static final router = GoRouter(
      routes: [
        GoRoute(
            path: rOnboarding,
          builder: (context, state) => const OnboardingView(),
        ),
        GoRoute(
            path: rLogin,
          builder: (context, state) => const LoginView(),
        ),
      ]
  );
}