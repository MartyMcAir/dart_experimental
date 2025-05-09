// https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37130450#overview
// https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37130508#announcements
// https://github.com/academind/flutter-complete-guide-course-resources/blob/main/Code%20Snapshots/02%20Flutter%20%26%20Dart%20Basics%20I/01%20Starting%20Setup/lib/main.dart
// https://api.flutter.dev/flutter/painting/LinearGradient-class.html

import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  // field / property
  // однажды занесенный текст в obj Text меняться не планируется, а значит можно final
  final String text;

  // static const _somePrivateField = 'someText';

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white70, fontSize: 28),
    );
  }
}
