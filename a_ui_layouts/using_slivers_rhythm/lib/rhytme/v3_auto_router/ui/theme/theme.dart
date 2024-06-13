import 'package:flutter/material.dart';

// https://www.youtube.com/watch?v=OVjvhsnhEoY&list=PLtUuja72DaLIywRDTLSSM5kMJLrbrUvbT&index=13
const primaryColor = Color(0xFFF82B10);
final themeData = ThemeData(
  dividerTheme: DividerThemeData(color: Colors.grey.withOpacity(0.1)),
  primaryColor: primaryColor,
  // scaffoldBackgroundColor: const Color(0xFFEFF1F3),
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor, brightness: Brightness.dark),
  useMaterial3: true,
  textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      )),
);
