// import 'package:dart_application_1/some_function_without_class.dart';

// как работать с breakpoints: https://code.visualstudio.com/docs/editor/debugging#_breakpoints

// https://github.com/dart-archive/dart-tutorials-samples
// +++ https://www.jpryan.me/dartbyexample/

import '../lib/model/athlete.dart';
import '../lib/model/boss.dart';
import '../lib/model/people.dart';
import '../lib/model/user.dart';
import '../lib/model/user_pro.dart';

void main(List<String> arguments) {
  useFunctionExample();
// useOopExample();
// useImplementsWithMixinExample();
}

useImplementsWithMixinExample() {
  // https://www.youtube.com/watch?v=TxGrtDxT2rE&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=16
  User isabella = User(999, 'Isabella');
  // print(User.staticAroundConst);
  // print(User.languageArray);
  // $ - interpolation (like in java concatenation)
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
  print('Hello world: ${calculate(1, 2, (a, b) => a + b)}!');
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

// https://www.youtube.com/watch?v=6ELyOsdrWRo&list=PLtUuja72DaLLAo63Zsn1UsLONDafJKWrl&index=14
Function sum2 = (a, b) {
  return a + b;
};

// sumEquals equivalent sum2
Function sumEquals = (a, b) => a + b;

// callback - is a function that we pass as argument and call from another function
void main2(List<String> arguments) {
  makeTask(doSomething); // doSomething - function in another makeTask function

  // Function funSum = (num a, num b) => a + b;
  // var varSum = (num a, num b) => a + b;
  sum(num a, num b) => a + b;
  print(calculate(1, 2, sum));
}

void makeTask(Function task) {
  print('run task');
  task();
  print('task is complete');
}

void doSomething() {
  print('hello dart');
}

num calculate(num a, num b, num Function(num a, num b) action) {
  // => action (a, b);
  return action(a, b);
}

// wtf?
// ignore: prefer_function_declarations_over_variables
final pov = (num a, num b) {
  final number = a;
  for (var i = 1; i < b; i++) {
    a = a * number;
  }
  return a;
};
