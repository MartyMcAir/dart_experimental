import 'package:flutter/material.dart';

import 'widgets/expenses.dart';
// https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37143054#questions

// var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 68, 41, 143));
var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme =
    ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: const Color.fromARGB(255, 5, 99, 125));
// без Brightness.dark - в темной теме будет не правильное отображаение теней и тд

void main() {
  // lesson 137 - adaptive
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp, // locking Device Orientation
  // ]).then((fn) {
  // ---------------------------------
  runApp(MaterialApp(
    // variant 1
    // theme: ThemeData(useMaterial3: true), // Appbar - white by default
    // theme: ThemeData(useMaterial3: false), // Appbar - blue by default
    //
    // variant 2
    // theme: ThemeData(useMaterial3: false, shadowColor: Colors.black),
    //
    // variant 3
    // theme: ThemeData.from(colorScheme: const ColorScheme.dark()),
    // theme: ThemeData.from(
    //     colorScheme: const ColorScheme.light(
    //   primary: Color.fromARGB(255, 68, 41, 143), // color for text btn
    //   onSecondary: Colors.black, // text for calendar date
    //   surface: Color.fromARGB(255, 231, 238, 241), // background for text
    //   onSurface: Colors.black, // text
    // )),
    //
    // variant 4 ------------------------------------------------------
    // lesson #129
    // ThemeMode - управляет источник от куда брать инфо об выбранной теме
    // themeMode: ThemeMode.system, // это по default
    // когда в одной из тем мы переопределяем что-то и далее явно
    //в др месте проги подтягиваем указывая что это точно не null Theme.of(context).cardTheme.margin!.horizontal
    // тогда в той теме где этого нет = приложение будет падать попадая на экран где это требуется
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
    // lesson #125 ------------------------------------------------------
    theme: ThemeData.from(colorScheme: kColorScheme).copyWith(
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer, // text color in app bar
        ),
        // for Card class - item (element) in Expense Tracker
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer,
        )),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
// lesson 126 - 7minute
                // color: Colors.red,
// Colors.red - не поменяет цвет у appBarTheme, потому что
// because I have that separate foreground color in appBarTheme foregroundColor: kColorScheme.primaryContainer,
// поменяет во всех др местах где явано не указано обратное
                color: kColorScheme.onSecondaryContainer,
              ),
            )),
    // -----------------------------------------------
    home: const Expenses(),
  ));
  // ------------------------------------
  // }); // setPreferredOrientations
}
