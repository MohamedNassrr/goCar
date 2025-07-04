import 'package:flutter/material.dart';
import 'package:go_car/core/theme/custom_theme/custom_text_theme.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    textTheme: CustomTextTheme.lightTextTheme,
  );
  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff28C76F),
    scaffoldBackgroundColor: const Color(0xff0D0D0D),
    textTheme:  CustomTextTheme.darkTextTheme,
  );
}