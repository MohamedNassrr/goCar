import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_car/core/theme/app_theme.dart';
import 'package:go_car/driver/core/utils/driver_app_router.dart';

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: DriverAppRouter.router,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          darkTheme: AppTheme.darkMode,
          theme: AppTheme.lightMode,
        );
      },
    );
  }
}
