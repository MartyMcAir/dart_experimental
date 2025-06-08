import 'package:flutter_test/flutter_test.dart';
import 'package:from_courses_sdk30_40/learn_flutter/les132_dart_testing/calculator.dart';

// module test / unit test
void main() {
  late final Calculator calculator;

  setUp(() {
    prints('Runs BEFORE EVERY any test is executed');
    calculator = Calculator();
  });
  setUpAll(() => prints('Runs BEFORE any test is executed'));

  tearDown(() => prints('Runs AFTER EVERY any test is executed'));
  tearDownAll(() => prints('Runs AFTER any test is executed'));

  group('add', () {
    test('the calculator return 5 when adding 1 and 4', () {
      // A A A
      // 1 Arrange (Setup) -> create the calculator object
      // final calculator = Calculator();

      // 2 Act (Action) -> collect the result you want to test
      final actualResult = calculator.add(1, 4);

      // 3 Assert (Result) -> complare the result against and expected value
      expect(actualResult, 5, reason: 'It should be exactly 5');
    });

    test('Calculator creates a non null obj', () {
      expect(Calculator(), isNotNull);
    });

    test('Calculator return an double number when adding 1 and 4', () {
      expect(calculator.add(1, 4), isA<double>());
    });
  });

  group('substract', () {
    test('the calculator return 5 when substracting 6 and 1', () {
      expect(calculator.substract(6, 1), 5, reason: 'It should be exactly 5');
    });
  });

  group('multiply', () {
    test('the calculator return 10 when multiplying 2 and 5', () {
      expect(calculator.multiply(2, 5), 10, reason: 'It should be exactly 10');
    });
  });

  group('divide', () {
    test('the calculator return 5 when dividing 10 and 2', () {
      expect(calculator.divide(10, 2), 5, reason: 'It should be exactly 5');
    });

    test('the calculator throws an ArgumentError when dividing by zero', () {
      expect(() => calculator.divide(10, 0), throwsArgumentError);
    });
  });

  group('powerOfTwo', () {
    test('the calculator return 16 when the input is 4', () async {
      expect(await calculator.powerOfTwo(4), 16);
    });
  });

  group('fibonacci sequence', () {
    test('the calculator return[0, 1, 1, 2, 3, 5, 8, 13, 21]', () {
      // emitsInOrder - сопостовляет возвращаемый результат в порядке очереди
      expect(calculator.fibonacciSequence(), emitsInOrder([0, 1, 1, 2, 3, 5, 8, 13, 21]));
    });
  });
}
