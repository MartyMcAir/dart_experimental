import 'null_safety_req_datetime.dart';

void main() {
  // useNullSafetyAndInstanceOffExample();

  int a = 2;
  int b = 2;

// explicit typing
  double c = a.toDouble() + b.toDouble();
  print(c);
  print(c.runtimeType);

  // final can get from method
  final String someConst = getStr();

  // const can't get from method
  // const String someConst = getStr();
  const String rightConst = "Some Constant 3.14..Pi";

  int standardInt = 3;
  int nagetiveInt = -3;
  double standardDouble = 3.149999999999;
  String someDoubleStr = '8.888';

  print(standardInt.toDouble()); // double 3.0
  print(standardDouble.round()); // int 3
  print(standardDouble.toStringAsFixed(3)); // string '3.149'
  print(double.parse(someDoubleStr)); // double 8.888
  // print(int.parse(someDoubleStr)); // (!) EXCEPTION
  print(int.tryParse(someDoubleStr)); // with try Parse NO EXCEPTION = null
  print(someCalc(standardInt) ?? 1); // 9
  print(someCalc(0) ?? 1); // 1

  num? num9;
  num9 = someCalc(4);
  num9 ??= 1;
  num? num8;
  num8 ??= 1;
  print('num9 $num9'); //  6 (10-4=6)
  print('num8 $num8'); //  1 (=1 beacause num8 is null)

  // as is is! -------------------------------------------------------------
  num c2 = a + b as num;
  print((c2 as int).isEven); // 4 is Even = true
  // like instance of in Java
  print('c2 is double: ${c2 is double}'); // false
  print('c2 is double: ${c2 is! double}'); // true
}

num? someCalc(int number) {
  if (number == 0) return null;
  return 10 - number;
}

String getStr() {
  return "some";
}

double convertBoolToDouble(bool value) {
  if (value) return 1;
  return 0;
}

useNullSafetyAndInstanceOffExample() {
  // https://www.youtube.com/watch?v=EwZO5ibNKBE&list=PLyaYkfwvXhRLQSevXcKNIlz4JtPt2W7P_&index=8
  num? number;
  num number2 = 888;
  print('number?.isNegative: ${number?.isNegative}'); // null
  print('number ?? 3: ${number ?? 3}'); // 3

  // операторы: as _ is _ is!
  print('(number2 as int).isEven: ${(number2 as int).isEven}'); // true _ четное
  // type 'int' is not a subtype of type 'double' in type cast
  // print((number2 as double));

  // instanceOf в Dart это 'is'
  print(number is double); // false
  print(number is! double); // true

  double someDouble = 3.14;
  int someInt = 3;
  print('someDouble is num: ${someDouble is num}'); // true
  print('someInt is num: ${someInt is num}'); // true
}
