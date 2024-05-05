import 'package:dart_application_1/utils/calc.dart';
import 'package:dart_application_1/utils/my_exception.dart';

void main(List<String> arguments) {
  useTryCatchBlockExample();
}

useTryCatchBlockExample() {
  // https://www.youtube.com/watch?v=PYqf9ej7hMM&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=22
  try {
    var divisionResult = CalcGeneric.divisionWithTilda(10, 0);
    print(divisionResult);
    // } on UnsupportedError catch (e) { // <- handle UnsupportedError ONLY
  } catch (e) {
    // throw Exception('some exception message');
    print('1) e $e'); // IntegerDivisionByZeroException
  } finally {
    print('program is done, and all resources is closed');
  }

  CalcGeneric someCalc = CalcGeneric("some");
  try {
    print(someCalc.getVariableCanContainsAnyThing);

//не понял как проверить на null, если при получении уже шлет ошибку!?
    if (someCalc.getVariableCanContainsAnyThing == null) {
      someCalc.setVariableCanContainsAnyThing = 'some variable not null';
      print(someCalc.getVariableCanContainsAnyThing);
    }
  } catch (e) {
    // LateInitializationError: Field 'variableCanContainsAnyThing' has not been initialized.
    print('2) e $e');
  }

  int a = 0;
  try {
    if (a == 0) {
      String message = 'division by / zero 0';
      throw MyException(Exception(message), message);
    }
  } catch (e) {
    print('3) some my exception: $e');
  }
  // (in video 11minute) OR:
  try {
    var someResult = CalcGeneric.divisionWithMyException(10, 0);
    print('someResult: $someResult');
    if (someCalc.getVariableCanContainsAnyThing == null) {
      print("getVariableCanContainsAnyThing is not null");
    }
  } on MyException catch (e) {
    print('4) another my exception: $e');
  } catch (e) {
    print('5) e: $e');
  }
}
