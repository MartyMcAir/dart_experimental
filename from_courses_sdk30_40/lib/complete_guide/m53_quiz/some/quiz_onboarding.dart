// https://api.flutter.dev/flutter/painting/LinearGradient-class.html

import 'package:flutter/material.dart';

class QuizOnboarding extends StatelessWidget {
  const QuizOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    // var topRight = Alignment.topRight;
    return Column(
      // для размешения по центру в вертикали колонки
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/compl_guide/img/quiz-logo.png',
          width: 200,
        ),
        // padding in TextButton or SizedBox
        const SizedBox(height: 20),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 20),
        OutlinedButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              // padding: const EdgeInsets.only(top: 20),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 28),
            ),
            // () { // ... },
            child: const Text('Start Quiz'))
      ],
    );
  }
}
