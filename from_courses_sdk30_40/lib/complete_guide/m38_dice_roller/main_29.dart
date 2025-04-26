// https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37130450#overview
// https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37130508#announcements
// https://github.com/academind/flutter-complete-guide-course-resources/blob/main/Code%20Snapshots/02%20Flutter%20%26%20Dart%20Basics%20I/01%20Starting%20Setup/lib/main.dart
import 'package:flutter/material.dart';

import './gradient_container.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      // backgroundColor: Color.fromARGB(255, 63, 5, 120),
      body: GradientContainer(
        Color.fromARGB(255, 33, 5, 109),
        Color.fromARGB(255, 68, 21, 149),
      ),
      // body: GradientContainer.purple(),
    ),
  ));
}
