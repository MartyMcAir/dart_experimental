import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:from_courses_sdk30_40/learn_flutter/les132_dart_testing/calculator.dart';
import 'package:from_courses_sdk30_40/learn_flutter/les132_dart_testing/les132_main.dart';
import 'package:from_courses_sdk30_40/learn_flutter/les132_dart_testing/operation.dart';
import 'package:from_courses_sdk30_40/learn_flutter/les132_dart_testing/operation_widget.dart';

// widget test
// https://docs.flutter.dev/release/breaking-changes/flutter-driver-migration
// flutter-driver - устаревший способ интеграционного тестирования
// тест виджетов и итнтеграционный теперь реализуется только через WidgetTester
void main() {
  late Calculator calculator;

  setUp(() {
    calculator = Calculator();
  });
  group('CalculatorApp', () {
    testWidgets('Render 4 widgets of Type ListTile', (WidgetTester tester) async {
      // Create the widget - CalculatorApp()
      await tester.pumpWidget(const CalculatorApp());

      // Create the Finders
      // https://api.flutter.dev/flutter/flutter_test/CommonFinders-class.html
      final listTileFinder = find.byType(ListTile);

      // Comparing finder with matcher
      expect(listTileFinder, findsNWidgets(4));
    });
  });

  group('add', () {
    testWidgets('show result when gives two numbers', (tester) async {
      await tester.pumpWidget(const CalculatorApp());

      final topTextFieldFinder = find.byKey(const Key('textField_top_Adding'));
      final bottomTextFieldFinder = find.byKey(const Key('textField_bottom_Adding'));

      await tester.enterText(topTextFieldFinder, '3');
      await tester.enterText(bottomTextFieldFinder, '7');

      final textResultFinder = find.text('Result: 10.0');
      // await tester.pump(); // обновляет '1 кадр'
      // 'setState' для тестов, обновит на актуальное состояние виджета = тест pass
      await tester.pumpAndSettle(); // для анимации
      expect(textResultFinder, findsOneWidget);
    });
  });

  group('Operation Widget', () {
    testWidgets('render 10 when 3 and 7 added', (tester) async {
      // когда при запуске теста flutter не знает как отобразить тестируемый виджет
      // тогда оборачиваем в MaterialApp -> Scaffold -> OperationWidget
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: OperationWidget(operation: Operation.add, calculator: calculator),
        ),
      ));

      await tester.enterText(find.byKey(const Key('textField_top_Adding')), '3');
      await tester.enterText(find.byKey(const Key('textField_bottom_Adding')), '7');

      await tester.pumpAndSettle();

      expect(find.text('Result: 10.0'), findsOneWidget);
    });
  });
}
