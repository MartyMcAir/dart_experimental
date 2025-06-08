import 'package:flutter/material.dart';

import 'calculator.dart';
import 'operation.dart';
import 'operation_widget.dart';

// les132 https://www.udemy.com/course/learn_flutter/learn/lecture/33487742#overview
// https://docs.flutter.dev/testing
// https://api.flutter.dev/flutter/package-matcher_matcher/
//
// Требования к коду для его тестируемости
// SOLID
// слабая связанность
// отсутствие статических зависимостей
// конструкторы не должны содержать логику
// Не создавать объекты внутри методов с логикой
// В идеале код писать соблюдая TDD подход, сначала тесты а потом функционал
//
// Pyramid
// Integration Test - оч много зависимостей (высокая уверенность)
// Widget Test - много зависимостей
// Unit Test - немного зависимостей (низкая уверенность)
//
//
// les137 TDD https://www.udemy.com/course/learn_flutter/learn/lecture/33749772#overview
// - https://reqres.in/
void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final calculator = Calculator();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                OperationWidget(
                  calculator: calculator,
                  operation: Operation.add,
                ),
                const Divider(),
                OperationWidget(
                  calculator: calculator,
                  operation: Operation.substract,
                ),
                const Divider(),
                OperationWidget(
                  calculator: calculator,
                  operation: Operation.multiply,
                ),
                const Divider(),
                OperationWidget(
                  calculator: calculator,
                  operation: Operation.divide,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
