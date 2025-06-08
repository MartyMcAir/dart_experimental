import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:from_courses_sdk30_40/learn_flutter/les132_dart_testing/calculator.dart';
import 'package:from_courses_sdk30_40/learn_flutter/les132_dart_testing/mock/fib.dart';
import 'package:mocktail/mocktail.dart';

class MockCalculator extends Mock implements Calculator {}

void main() {
  late MockCalculator calculator;

  setUp(() {
    calculator = MockCalculator();
  });

  group('Fib', () {
    testWidgets('renders the result provided by the calculator', (tester) async {
      when(() => calculator.fibonacciSequence()).thenAnswer((realInvocation) => Stream.periodic(
            const Duration(milliseconds: 400),
            (eventIndex) {
              if (eventIndex == 0) return 0;
              if (eventIndex == 1) return 1;

              return 0;
            },
          ));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Fibonachi(
              calculator: calculator,
            ),
          ),
        ),
      );
      expect(find.text('Calculating...'), findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 400));
      expect(
        find.text('Fibonacci seq: 0'),
        findsOneWidget,
      );
      await tester.pumpAndSettle(const Duration(milliseconds: 400));
      expect(
        find.text('Fibonacci seq: 1'),
        findsOneWidget,
      );
    });
  });
}

class Fib {}
