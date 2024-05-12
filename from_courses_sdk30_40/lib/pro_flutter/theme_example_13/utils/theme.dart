import 'package:flutter/material.dart';
import './constants.dart';

ThemeData basicTheme() {
  const themeColor = Brightness.dark; // light dark

  return ThemeData(
    brightness: themeColor,
    primaryColor: kPrimaryColor,
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        fontFamily: fontNameTitle,
        fontSize: mediumTextSize,
        color: Colors.purple,
      ),
      // https://api.flutter.dev/flutter/material/TextTheme-class.html
      headlineMedium: TextStyle(
        fontFamily: fontNameDefault,
        fontSize: mediumTextSize,
        fontWeight: FontWeight.w800,
        color: kSecondaryColor,
      ),
      bodyLarge: const TextStyle(
        fontFamily: fontNameDefault,
        fontSize: bodyTextSize,
        color: Colors.green,
      ),
    ),
    iconTheme: const IconThemeData(
      // color: Colors.red,
      size: 25.0,
      color: Colors.blue,
    ),
    // настройка кнопки "+" - что по середине
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.red,
      foregroundColor: Colors.purple,
    ),
    buttonTheme: const ButtonThemeData(
      height: 80,
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.accent,
    ),
    // тут задают тему
    // colorScheme: ColorScheme.fromSwatch()
    //     .copyWith(secondary: Colors.blue, brightness: Brightness.dark)
    // colorScheme: ColorScheme.fromSwatch()
    //     .copyWith(secondary: Colors.blue, brightness: Brightness.light)

    // toggleableActiveColor: Colors.blue, // DEPRECATED
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(secondary: Colors.blueAccent, brightness: themeColor),

    // bottomAppBarColor: Colors.deepPurple,
    // cardColor: Colors.orange.shade100,
    // scaffoldBackgroundColor: Colors.yellow,
  );
}
