// https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37213700#overview
// https://docs.flutter.dev/ui/widgets
// https://github.com/flutter/flutter/blob/f699eb0be0a0cfcf34e2b6c0e402a18d76a96f2e/packages/flutter/lib/src/widgets/binding.dart#L1078
//
// Course:
// https://github.com/academind/flutter-complete-guide-course-resources/blob/main/Code%20Snapshots/01%20Getting%20Started/01%20First%20App/lib/main.dart
//
//  free access to our “Academind Community” on Discord: https://academind.com/community/
// pdf slides https://github.com/academind/flutter-complete-guide-course-resources/blob/main/Slides/course-slides.pdf
// https://github.com/academind/flutter-complete-guide-course-resources
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// With Flutter, you create user interfaces by combining "widgets"
// You'll learn all about them (and much more) throughout this course!
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Every custom widget must have a build() method
  // It tells Flutter, which widgets make up your custom widget
  // Again: You'll learn all about that throughout the course!
  @override
  Widget build(BuildContext context) {
    // Below, a bunch of built-in widgets are used (provided by Flutter)
    // They will be explained in the next sections
    // In this course, you will, of course, not just use them a lot but
    // also learn about many other widgets!
    return MaterialApp(
      title: 'Flutter First App',
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Flutter - The Complete Guide',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Learn Flutter step-by-step, from the ground up.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
