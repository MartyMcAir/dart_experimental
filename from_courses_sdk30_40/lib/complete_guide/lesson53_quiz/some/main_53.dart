// https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37131054#overview
// https://docs.flutter.dev/ui/widgets

import 'package:flutter/material.dart';

import 'gradient_container.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      // backgroundColor: Color.fromARGB(255, 63, 5, 120),
      body: GradientContainer(
        Color.fromARGB(255, 75, 41, 169),
        Color.fromARGB(255, 61, 27, 120),
      ),
      // body: GradientContainer.purple(),
    ),
  ));
}
