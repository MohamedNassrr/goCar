import 'package:flutter/material.dart';
import 'package:go_car/core/theme/custom_theme/custom_text_theme.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    textTheme: CustomTextTheme.lightTextTheme,
  );
  static ThemeData darkMode = ThemeData(
   textTheme:  CustomTextTheme.darkTextTheme,
  );
}