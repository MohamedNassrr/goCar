import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_car/client/core/utils/client_app_router.dart';
import 'package:go_car/core/theme/app_theme.dart';

class RiderApp extends StatelessWidget {
  const RiderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: ClientAppRouter.router,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          darkTheme: AppTheme.darkMode,
          theme: AppTheme.lightMode,
        );
      },
    );
  }
}
