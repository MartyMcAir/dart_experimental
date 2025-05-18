// les237 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37214954#overview

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/places.dart';

final colorDarkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  surface: const Color.fromARGB(255, 56, 49, 66), // surface instead background
);

final themeDark = ThemeData(useMaterial3: false).copyWith(
  scaffoldBackgroundColor: colorDarkScheme.surface,
  colorScheme: colorDarkScheme,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
  ),
);

// NOTE: GoogleFonts throw Exception if internet off
void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: themeDark,
      home: const PlacesScreen(),
    );
  }
}

// flutter run -d emulator-5554 -t lib\complete_guide\les237_fovirite_place_app\main_237.dart
//
// flutter location - на Huawei не заработате тк нет Google Play Store
// W/GooglePlayServicesUtil( 5975): com.example.from_courses_sdk30_40 requires the Google Play Store, but it is missing.
// Альтернатива использовать geolocator / SDK (Huawei HMS Location API)
// flutter run -d 9KTUT21722007732 -t lib\complete_guide\les237_fovirite_place_app\main_237.dart
//
// Samsung
// flutter run -d RFCRC1DKX5R -t lib\complete_guide\les237_fovirite_place_app\main_237.dart
//
// r Hot reload.
// R — hot restart
// d Detach (terminate "flutter run" but leave application running).
// h List all available interactive commands.
// c Clear the screen
// q Quit (terminate the application on the device).

// ------------------------------------------------------------------------------
// lesson 250 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/42697812#overview
// when running the app on Android, you might get an error though (after adding that location package).
// If that should be the case, try editing your android/settings.gradle file and make sure the following line:
// id "org.jetbrains.kotlin.android" version "1.9.21" apply false
// reflects your current Kotlin version (you find that version in the build.gradle file).
// https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37130520#questions/21453790/

// ------------------------------------------------------------------------------
// lesson 253 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37266948#overview
// тут либо заносить кредитку в google maps или оставлять свои данные в yandex map
// и + надо хранить API ключи в Env Var и передавать их при билде на устройства спецефическим образом
// или использовать бесплатное комбо геокодер nominatim API + flutter_map package
//
// For location using Google Maps need credit card
// https://developers.google.com/maps?hl=ru
// https://mapsplatform.google.com/intl/ru/pricing/ - 10k free
// https://habr.com/ru/articles/110460/ - Картографический сервис на Google Map
//
// Альтернатива Yandex Map API - бесплатен при ряде условий
// https://yandex.ru/dev/commercial/doc/ru/?from=mapsapi
// https://yandex.ru/dev/commercial/doc/ru/concepts/jsapi-geocoder
// API Геокодера — HTTP API, который позволяет по запросу определять координаты объектов по их адресу (и наоборот)
// Геокодера Doc: https://yandex.ru/maps-api/docs/geocoder-api/index.html
