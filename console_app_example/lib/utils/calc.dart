import 'package:dart_application_1/utils/my_exception.dart';

class CalcGeneric<T> {
  T secretKey;
  late Object variableCanContainsAnyThing;

  CalcGeneric(this.secretKey);

  // ~/ - означает целочисленное деление те при делении 5/2 будет не 2.5
  // будет = 2
  static divisionWithTilda<T extends num>(T a, T b) {
    return a ~/ b;
  }

  static division<T extends num>(T a, T b) {
    return a / b;
  }

  static divisionWithMyException<T extends num>(T a, T b) {
    if (b == 0) {
      throw MyException('original exception IntegerDivisionByZeroException',
          'division by zero!');
    }
    return a / b;
  }

  T get getSecretKey => this.secretKey;

  set setSecretKey(T secretKey) => this.secretKey = secretKey;

  get getVariableCanContainsAnyThing => this.variableCanContainsAnyThing;

  set setVariableCanContainsAnyThing(variableCanContainsAnyThing) =>
      this.variableCanContainsAnyThing = variableCanContainsAnyThing;
}
