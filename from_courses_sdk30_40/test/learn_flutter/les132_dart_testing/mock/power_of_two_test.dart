import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:from_courses_sdk30_40/learn_flutter/les132_dart_testing/calculator.dart';
import 'package:from_courses_sdk30_40/learn_flutter/les132_dart_testing/mock/power_of_two.dart';
import 'package:mocktail/mocktail.dart';

class MockCalculator extends Mock implements Calculator {}

void main() {
  late MockCalculator calculator;

  setUp(() {
    calculator = MockCalculator();
  });

  group('PowerOfTwo', () {
    testWidgets('renders the result provided by the calculator', (tester) async {
      when(() => calculator.powerOfTwo(5)).thenAnswer((realInvocation) => Future.value(25));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PowerOfTwo2(
              calculator: calculator,
            ),
          ),
        ),
      );
      await tester.enterText(find.byKey(const Key('textField_powerOfTwo')), '5');
      await tester.pumpAndSettle();
      expect(find.text('Result: 25.0'), findsOneWidget);
    });
  });
}

class PowerOfTwo {}
