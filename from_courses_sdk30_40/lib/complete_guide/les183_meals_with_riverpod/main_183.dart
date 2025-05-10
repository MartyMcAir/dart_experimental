import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/tabs.dart';

// https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37144808#overview
// There’s a bunch of old, commented-out code here — kind of like “code trash” from the earlier version.
// It’s left here on purpose, so you can see how much extra code was needed before,
// and how much cleaner things look now with Riverpod.

final theme = ThemeData(
  useMaterial3: true,
  colorScheme:
      ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: const Color.fromARGB(255, 131, 57, 0)),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  // runApp(const App());
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const TabsScreen());
  }
}
