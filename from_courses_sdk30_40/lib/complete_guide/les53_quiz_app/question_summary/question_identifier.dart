import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final bool isCorrectAnswer;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    final color =
        isCorrectAnswer ? const Color.fromARGB(255, 150, 198, 241) : const Color.fromARGB(255, 249, 133, 241);

    return CircleAvatar(
      radius: 15,
      backgroundColor: color,
      child: Text(
        (questionIndex + 1).toString(), // отображаем номер вопроса с 1
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
