// import 'package:dart_application_1/some_function_without_class.dart';


// как работать с breakpoints: https://code.visualstudio.com/docs/editor/debugging#_breakpoints

// https://github.com/dart-archive/dart-tutorials-samples
// +++ https://www.jpryan.me/dartbyexample/

import '../lib/model/athlete.dart';
import '../lib/model/boss.dart';
import '../lib/model/people.dart';
import '../lib/model/user.dart';
import '../lib/model/user_pro.dart';
import '../lib/some_function_without_class.dart';
import '../lib/utils/calc.dart';
import '../lib/utils/enum_colors.dart';

void main(List<String> arguments) {
  // variableExample();
  // collectionFunctionExample();
  useFunctionExample();
// useOopExample();
// useImplementsWithMixinExample();
// useGenericTypesExample();
// useEnumExample();
//------------------------------------------------------
}

useEnumExample() {
  // ENUM перечисление - https://www.youtube.com/watch?v=_bPS1hPE0bs&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=28
  MyColors someColor = MyColors.green;
  int someColorIndex = MyColors.green.index;
  print('some color: $someColor, and index: $someColorIndex');
  List<MyColors> colorsList = MyColors.values;
  print('enumListSize: ${colorsList.length}');
  // for (int i = 0; i < colorsList.length; i++) {
  //   print('name: ${colorsList[i].name}, and opacity: ${colorsList[i].opacity}'); }

  // for (var element in colorsList) {
  //   print('name: ${element.name}, and opacity: ${element.opacity}'); }

  colorsList.forEach((element) {
    print('name: ${element?.name}, and opacity: ${element?.opacity}');
  });
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

useImplementsWithMixinExample() {
  // https://www.youtube.com/watch?v=TxGrtDxT2rE&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=16
  User isabella = User(999, 'Isabella');
  // print(User.staticAroundConst);
  // print(User.languageArray);
  print('main language: ${User.languageArray[2]}');
  print(''); // new line

  // Миксины (примеси) - Mixin
  // по сути просто выборочное добавление функции/метода из миксина _ 'with mixinNameIs..'
  // https://www.youtube.com/watch?v=sSF99-GOvMY&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=17
  print(isabella);
  isabella.showThisLastName("Bella");

  UserPro phines = UserPro("Phines");
  print(phines);
  phines.showThisLastName("Andreu");

  // Abstract class
  // https://www.youtube.com/watch?v=cYGCqla8irk&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=18
  Athlete greecMan = Athlete("muscle", "speed", "fat man");
  print(greecMan);

  // extension Athlete
  // https://www.youtube.com/watch?v=cwIZfCw3Rv4&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=19
  print('mainSkill: ${greecMan.getMainSkill()}');
  int a = 12;
  print(a.plusOne()); // 13
}

useOopExample() {
  People djo = People("Djo", 13, 3.15);
  print(djo);
  // print(djo.name);
  // print(djo.getName);
  // print(djo.getName2());
  // print(djo._age); // can't get it because _age - is private field
  // djo.age = 888; // can't set it because _age - is private field
  // djo.setAge = 888; // setter work for private field
  // djo.setAge2 = 888; // setter #2 work for private field
  print("djo age is: ${djo.getAge}");

  djo.address = "another address";
  djo.setSurname = "somesurName";
  djo.name = "Bob";
  print(djo);
  djo.setName = "Stuart";
  print(djo);

  People mike = People.one(13, 3.13, "Mike", "Honoloola");
  print(mike);

  Boss selena = Boss("Selena", 13, 36);
  selena.surname = "Gomez";
  print(selena);
  print('where Selena live?: ${selena.getAddress}');
}

useFunctionExample() {
  print('Hello world: ${calculate()}!');
  // var because can be return int or double
  var multiplyResult = multiply(1, 3, d: 8);
  print(multiplyResult);

  // 8min https://www.youtube.com/watch?v=_k9Xu61XlVE&list=PLyaYkfwvXhRLQSevXcKNIlz4JtPt2W7P_&index=13
  // сcallback функция обратного вызова, функция которая внутри себя вызывает другую функцию
  someFunction(int a, int b) {
    return (a + b) * 3;
  }

  int sum2(int a, int b) {
    return a + b + b;
  }

  // doWork(() => {1, 2}); // Closure call with mismatched arguments
  doWork((a, b) => {3, 4}); // {3, 4}
  doWork1((a, b) => a + b); // 1+2= {3}
  doWork1((a, b) => {a + b + a}); // 1+2+1= {4}
  doWork1(sum2); // 1+2+2= 5
  doWork2(someFunction); // (1+2)*3= 9
  // doWork2(sum(1, 2)); // Null check operator used on a null value
}

void doWork2(int Function(int, int) callback) {
  var result = callback(1, 2);
  print('doWork2: $result');
}

void doWork1(Function(int, int) callback) {
  var result = callback(1, 2);
  print('doWork1: $result');
}

void doWork(Function callback) {
  var result = callback(1, 2);
  print('doWork: $result');
}

// это функция _ в дарте методы это функции ?
// Или всё же методы раз уж есть классы!? - и по логике у классов методы а не функц
// нуу анонимные функции лямда выражения и прочее точно функционалищина
// https://www.youtube.com/watch?v=CW9mf7Y635g&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=7
sum(int a, num b, [double? c, int? d]) {
  // [..] - квадратные скобки говорят, что значения отправлять не обязательно
  // обязательным параметр в скобках '[]' обязательным сделать нельзя
  return a + b + c! + (d ?? 8);
  // с! - мы говорим компилятору что знаем, что делаем
  // (d ?? 0) - говорим, что если int есть ничего те если бы это была строка и она null
  // тогда бери значение что справа от '??' те '8'
}

multiply(int a, num b, {double? c, required int? d}) {
  // {..} - фигурные скобки говорят, что значения отправлять можно любым порядком
  // но необходимо указывать явным образом какому параметру - какое значение
  // параметр 'd' является обязательным остальное в скобках '{}' явл необязат
  return a * b * d! * (c ?? 8);
  // с! - мы говорим компилятору что знаем, что делаем
  // (d ?? 0) - говорим, что если int есть ничего те если бы это была строка и она null
  // тогда бери значение что справа от '??' те '8'
}

//------------------------------------------------------------------------

collectionFunctionExample() {
  // https://dart.dev/guides/language/language-tour#built-in-types
  List someList = [], listTwo = [6, 2, 3, 7, 8, 9];
  List<int> intList = [1, 2, 3, 3, 2];
  Set<num> numList = {1, 2, 3};
  Map<String, int> myMap = {"one": 1, "two": 2};

  String someString = "some";
  // for (int element in intList) {    print(element);  }
  // for (int i = 0; i < intList.length; i++) {
  //   print('число из списка: ${intList[i]}' + ' someString: $someString');
  // }

  int i = 0;
  // do {
  //   i++;
  //   print(intList[i]);
  // } while (i < intList.length);

  // while (i < intList.length) {
  // print(intList[i]);
  // }

  // https://www.youtube.com/watch?v=3friibeMMB4&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=31
  // Хорошо
  var points = <double>[];
  var address2 = <String, int>{};
  var counts2 = <int>{};

  // НЕ хорошо
  var addressMap = Map<String, int>();
  var countsSet = Set<int>();

  // вложить один список в другой через "..."
  // https://www.youtube.com/watch?v=eOsoucMMAqA&list=PLyaYkfwvXhRLQSevXcKNIlz4JtPt2W7P_&index=10
  List newList = [999, ...intList, if (numList.length > 2) ...numList];
  newList.addAll(intList);
  newList
    ..addAll(intList)
    ..addAll(numList);

  // каскадная нотация
  newList
    ..add(3)
    ..add(3)
    ..add(6);
  // тоже что и: newList.add(3); newList.add(6);
  List<int> magicList = [for (int i = 0; i < 10; i++) i];
  print('magicList: $magicList'); // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  List<int> forInListMagic = [for (int i in newList) i * i];
  print(forInListMagic);

  // каскадная нотация https://www.youtube.com/watch?v=HJ090EowqI0&list=PLyaYkfwvXhRLQSevXcKNIlz4JtPt2W7P_&index=15
  Boss donald = Boss('Donald', 999, 80);
  donald.name = 'Arnold';
  donald.address = 'New Yourk';
  donald.someInit();
  // каскадом = меньше кода
  Boss amigo = Boss('Donald', 999, 80)
    ..name = 'Amigo'
    ..address = 'Los Angeles'
    ..someInit();
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
