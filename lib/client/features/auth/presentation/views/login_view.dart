import 'package:flutter/material.dart';
import 'package:go_car/client/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: LoginViewBody()),
    );
  }
}
