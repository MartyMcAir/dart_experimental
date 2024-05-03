import 'package:dart_application_1/utils/calc.dart';

void main(List<String> arguments) {
  useGenericTypesExample();
}

useGenericTypesExample() {
  print('10 : 2 = ${CalcGeneric.division(10, 2)}');
  print('3.14 : 2.18 = ${CalcGeneric.division(3.14, 2.18)}');

  CalcGeneric calc1 = CalcGeneric("secretKey");
  CalcGeneric calc2 = CalcGeneric(3.14);
  print('calc1 key: ${calc1.getSecretKey}');
  calc1.setSecretKey = 123;
  print('calc1 key: ${calc1.getSecretKey}');

  print('calc2 key: ${calc2.getSecretKey}');
}
