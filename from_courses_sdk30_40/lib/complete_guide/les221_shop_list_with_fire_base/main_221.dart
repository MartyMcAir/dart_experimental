import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'widgets/grocery_list_try_catch.dart';

// import 'package:http/http.dart' as http;
// les 224 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37215156#overview
// FireBase https://support.google.com/appsheet/answer/10104995?hl=en
// go to console -> get started.. -> prj name: flutter-prep
// => https://console.firebase.google.com/project/ * /overview?hl=ru
// -> real time data base
//
// CREATE test data base -> https://console.firebase.google.com/project/ * /database/ * /data?hl=ru
// DOCS REST https://firebase.google.com/docs/reference/rest/database?hl=ru
//
// https://pub.dev/packages/http/install -> flutter pub add http
//

var kDarkColorScheme =
    ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: const Color.fromARGB(255, 50, 58, 60));

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
