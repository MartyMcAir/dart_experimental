import 'package:flutter/material.dart';

import 'widgets/grocery_list.dart';

// les208 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37213736#overview
//  - forms: building & using & submission & resetting
//  - showing on-screen validation errors

var kDarkColorScheme =
    ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: const Color.fromARGB(255, 50, 58, 60));
// Color.fromARGB(255, 5, 99, 125));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 147, 229, 250),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 42, 51, 59),
        ),
      ),
      // ThemeData.dark().copyWith(scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60)),
      darkTheme: ThemeData.from(colorScheme: kDarkColorScheme).copyWith(
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        )),
      ),
      home: const GroceryList(),
    );
  }
}
