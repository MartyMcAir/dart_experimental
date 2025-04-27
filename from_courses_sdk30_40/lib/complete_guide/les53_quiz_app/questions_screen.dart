import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './data/questions.dart';
import 'answer_button.dart';
import 'models/quiz_question.dart';
// https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37131338#overview
// lesson 67

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    // access to the widget from QuestionsScreen to onSelectAnswer field
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
// padding — внутри, как мягкая подкладка внутри коробки между стенками и содержимым
// padding - внутренние пустоты между Container и другими элементами
        padding: const EdgeInsets.only(bottom: 300),
// margin — снаружи, как пространство вокруг коробки
// margin - внешние пустоты между Container и другими элементами
        margin: const EdgeInsets.all(40),
        child: Column(
// MainAxisAlignment.spaceAround - распределяет все свободное пространство между children elements
// MainAxisAlignment.center - центрирует по вертикали (по главноей оси в Column)
          mainAxisAlignment: MainAxisAlignment.center,
// CrossAxisAlignment.stretch -  растягивает на всю горизонталь (по поперечной оси)
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Text(currentQuestion.text,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 153, 251),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
// SizedBox(height: 30) - отступ по вертикали вопроса от списка ответов
            const SizedBox(height: 30),
            //
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return Container(
// margin - фиксированные пустоты между элементами за границей Container'a для AnswerButton
                margin: const EdgeInsets.only(top: 5),
                // answerQuestion send to onTap as a value (withOut '()' )
                child: AnswerButton(
                  answerText: answer,
                  // onTap: answerQuestion, // if no parameters
                  onTap: () {
                    // if have parameters (..)
                    answerQuestion(answer);
                  },
                ),
              );
            }),
            // instead hardCode use ...currentQuestion.answers.map(*)
            // AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
            // const SizedBox(height: 20),
            // AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
          ],
        ),
      ),
    );
  }
}
