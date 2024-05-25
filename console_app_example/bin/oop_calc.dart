// import 'dart:svg';

void main() {
  final calc = Calc();
  print(calc.sum(1, 2)); // int only
  print(calc.sumDuble(1.5, 2.7)); // double only
  print(calc.sumParamPolimorfizm(1.5, 2.7)); // int or double or etc

  print(calc.wrongSumDynamic("some", 13));
}

class Calc {
  int sum(int a, int b) {
    return a + b;
  }

  double sumDuble(double a, double b) {
    return a + b;
  }

  num sumParamPolimorfizm(num a, num b) {
    return a + b;
  }

  dynamic wrongSumDynamic(dynamic a, dynamic b) {
    return a + b;
  }
}
