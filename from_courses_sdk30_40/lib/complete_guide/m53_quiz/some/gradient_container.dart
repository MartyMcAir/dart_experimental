// https://api.flutter.dev/flutter/painting/LinearGradient-class.html

import 'package:flutter/material.dart';

import 'quiz_onboarding.dart';

// Alignment topLeft = Alignment.topLeft;
const Alignment topLeft = Alignment.topLeft;
const topRight = Alignment.topRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  // naming constructor
  const GradientContainer.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;

  @override
  Widget build(BuildContext context) {
    // var topRight = Alignment.topRight;
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [color1, color2],
          begin: topLeft,
          end: topRight,
        )),
        child: const Center(
          // child: StyledText('Hello world!'),
          // child: Image(image: image),
          child: QuizOnboarding(),
        ));
  }
}
