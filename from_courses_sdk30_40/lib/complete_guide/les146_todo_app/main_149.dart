import 'package:flutter/material.dart';

import './keys/keys.dart';

// https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37143880#overview
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo app with sorting'),
        ),
        body: const Keys(),
      ),
    );
  }
}
