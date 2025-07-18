import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_car/bloc_observer.dart';
import 'package:go_car/client/core/services/local_storage.dart';
import 'package:go_car/client/core/utils/client_app_router.dart';
import 'package:go_car/core/theme/app_theme.dart';

import 'client/core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalStorage.init();
  Bloc.observer = MyBlocObserver();
  await dotenv.load(fileName: ".env");
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
