void main(List<String> arguments) {
  variableExample();
}

variableExample() {
  // https://www.youtube.com/watch?v=j3Babv4cHDU&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=2
  var nonTypeVar = 1;
  // String? - прощупать переменную на значение null
  // все равно что: String hereNull = null;
  String? hereNull;
  // String хранится в UTF16
  // https://www.youtube.com/watch?v=D-bNr_pvop8&list=PLyaYkfwvXhRLQSevXcKNIlz4JtPt2W7P_&index=4

  // 0xAARRGGBB - 16тиричное hex обозначение цвета
  // 0-9, A-F
  // https://www.youtube.com/watch?v=Su8V0tpwW9I&list=PLyaYkfwvXhRLQSevXcKNIlz4JtPt2W7P_&index=5
  var hexRedColor = 0xFFF0000;
  // тип констант можно упускать, как и возвращаемый тип методами/функциями
  // const строже чем final тк не может меняться в runtime
  // и память при запуск будет выделена сразу, даже если строчка кода в программе не будет задействована
  const hexColor2 = 0xFFF0000;
  // память на переменную будет выделенна по факту использования в runtime
  // после первого присвоения значения в runtime, его менять уже будет нельзя
  final hexColor3 = 0xFFF0000.abs();

  nonTypeVar = 3;
  dynamic typeCanChange = 4;
  typeCanChange = "some";
  num somNum = 13;
  final int cantChangeValue = 3;
  const double someConstant_cantChanged = 3.14;
  // late - обещание компилятору что позже значение занесем
  late String someLateMayBee;
  // print(someLateMayBee); // = Script error.
  bool flag = true;

  // ----------
  List d = ['How are you?', 'How is?'];
  String a = 'one', b = 'two', f = 'hi';
  print(a * 5); // oneoneoneoneone
  String e = '$f, people ${d[0]}'; // $f - называется интерполяция
  print(e); // hi, people How are you?

  // ternar operator
  bool flag2 = a.length >= 3; // true
  String strResult = flag2 ? 'value is true' : 'value is false';
  print(strResult);

  // -------------
  // Преобразование типов https://www.youtube.com/watch?v=O6Zl79xIndg&list=PLyaYkfwvXhRLQSevXcKNIlz4JtPt2W7P_&index=6
  int someInt = 777;
  double someDouble = someInt.toDouble();
  int againToInt = someDouble.round();
  String someStr = someInt.toString();
  double someDouble2 = 1.55555555;

  String someStrFromDouble = someDouble2.toString();
  String someStrFromDouble2 = someDouble2.toStringAsFixed(3);
  print('someStrFromDouble: $someStrFromDouble'); // 1.55555555
  print('someStrFromDouble2: $someStrFromDouble2'); // 1.556

  String piValue = '3.14444444';
  double someDoubleFromString = double.parse(piValue);
  // String someIntFromString = int.parse(piValue); // FormatException: Invalid radix-10 number
  int? someIntFromString = int.tryParse(piValue); // withOut exception
  print('someDoubleFromString: $someDoubleFromString'); // 3.14444444
  print('someIntFromString: $someIntFromString'); // null

  // арифметические операторы https://www.youtube.com/watch?v=Ryw7Ul4facU&list=PLyaYkfwvXhRLQSevXcKNIlz4JtPt2W7P_&index=7
  print('-3 = ${-3}'); // инверсия
  // 3 на 2 не делится по этому остаток 1
  print('3 % 2 = ${3 % 2}'); // деление по модулю _ = 1
  // деление, где результ будет всегда целое число _ = 1
  print('3 ~/ 2 = ${3 ~/ 2}');
  print('120 ~/ 11 = ${120 ~/ 11}'); // = 10 _ округляется в меньшую сторону

  int sumVar = 1;
  sumVar += 1; // like: sumVar = sumVar + 1;
  int postIncrementInt = 1;
  int postResult = postIncrementInt++; // postFix increment
  print(
      'postIncrementInt: $postIncrementInt, and postResult: $postResult'); // 2 and 1

  int preIncrementInt = 0;
  int preResult = ++preIncrementInt; // preFix increment
  print(
      'prefixIncrementInt: $preIncrementInt, and preResult: $preResult'); // 1 and 1

  // 5min https://www.youtube.com/watch?v=FdG2AeabFvw&list=PLyaYkfwvXhRLQSevXcKNIlz4JtPt2W7P_&index=11
  // исключающее или "XOR"
  print(true ^ false); // true потому что разные
  print(true ^ true); // false потому что равны

  String ternarExp = 3 < 2 ? 'here true' : 'else here false';

  switch (sumVar) {
    case 1:
      print('one');
      break;
    case 2:
      print('two');
      continue label1;
    case 3:
      print('three');
      break;
    label1:
    case 4:
      print('four');
      break;
    default:
      print('unknown');
  }
}
