import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_car/apps/driver_app.dart';
import 'package:go_car/bloc_observer.dart';
import 'package:go_car/core/services/local_storage.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalStorage.init();
  Bloc.observer = MyBlocObserver();
  await dotenv.load(fileName: ".env");
  serviceLocator();
  runApp(const DriverApp());
}
