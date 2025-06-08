import 'package:flutter/material.dart';

import '../calculator.dart';

// les136 https://www.udemy.com/course/learn_flutter/learn/lecture/33644494#overview

class Fibonachi extends StatelessWidget {
  final Calculator calculator;

  Fibonachi({super.key, required this.calculator});

  String _result = '';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: calculator.fibonacciSequence(),
      initialData: null,
      builder: ((context, snapshot) {
        if (snapshot.data != null) {
          _result = snapshot.data.toString();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _result.isNotEmpty ? 'Fibonacci seq: $_result' : 'Calculating...',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        );
      }),
    );
  }
}
