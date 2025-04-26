import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          // icon: const Icon(Icons.quiz_rounded),
          icon: const Icon(Icons.arrow_right_alt),
          onPressed: () {},
          // style: ButtonStyle(),
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white70),
          label: const Text('Start Quiz'),
        )
      ],
    ));
  }
}
