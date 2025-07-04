import 'package:flutter/material.dart';
import 'package:go_car/client/core/utils/client_app_router.dart';
import 'package:go_car/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: ClientAppRouter.router,
     debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkMode,
      theme: AppTheme.lightMode,
    );
  }
}
