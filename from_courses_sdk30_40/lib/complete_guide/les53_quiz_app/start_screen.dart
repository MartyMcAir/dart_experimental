import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  // using functions as value / param (lesson 60)
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
// mainAxisSize используется для центрирования по вертикали для колонок
// для Row же надо отдельно по горизонтали
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/compl_guide/img/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        // Opacity - плох для производительности
        // Opacity( opacity: 0.6,
        //   child: Image.asset('assets/images/quiz-logo.png',
        //     width: 300), ),
        const SizedBox(height: 80),
        Text(
          'Learn Flutter the fun way!',
// leson76 https://docs.flutter.dev/cookbook/design/fonts
// https://pub.dev/packages/google_fonts
// https://fonts.google.com/
          style: GoogleFonts.lato(color: Colors.white70, fontSize: 24),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          // icon: const Icon(Icons.quiz_rounded),
          icon: const Icon(Icons.arrow_right_alt),
          // onPressed: () { startQuiz(); },
          onPressed: startQuiz,
          // style: ButtonStyle(),
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white70),
          label: const Text('Start Quiz'),
        )
      ],
    ));
  }
}
