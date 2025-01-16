import 'package:flutter/material.dart';
import 'features/calculator/calculator_screen.dart';
import 'core/constants/colors.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.backgroundLight,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.textLight),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.backgroundDark,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.textDark),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const CalculatorScreen(),
    );
  }
}