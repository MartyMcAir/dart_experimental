import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './data/questions.dart';
import 'question_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswers, required this.onRestart});

  final List<String> choosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    //..
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryDate = getSummaryData();
    final numTotalQuestions = questions.length;
// where - works like filter
    final numCorrectQuestions = summaryDate.where((currentItem) {
      return currentItem['user_answer'] == currentItem['correct_answer'];
    }).length;

    // final numCorrectQuestions2 = summaryDate
    //     .where((currentItem) => currentItem['user_answer'] == currentItem['correct_answer'])
    //     .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // QuestionsSummary(getSummaryData()),
            QuestionsSummary(summaryDate),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
