import 'package:flutter/material.dart';
import 'package:go_car/client/features/onboarding/presentation/views/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: OnboardingView(),
    );
  }
}
