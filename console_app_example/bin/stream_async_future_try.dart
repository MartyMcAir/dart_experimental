import 'dart:async';
import 'dart:io';

import '../lib/utils/calc.dart';
import '../lib/utils/my_exception.dart';

void main(List<String> arguments) {
// useGeneratorsSyncOrAsync();
// ---
// useStream2Example();
// useStream1Example();
// ---
// useAsyncAwaitInFuture();
// simpleFuture2Example();
// simpleFutureExample();
// useTryCatchBlockExample();
//------------------------------------------------------
}

useGeneratorsSyncOrAsync() {
  // Generators - https://www.youtube.com/watch?v=Y9aQLyv3qCg&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=27
  print(asyncRangeGenerator(13, 18).listen((event) {
    print(event);
  }));
  sleep(Duration(seconds: 5));
  print(syncRangeGenerator(3, 8));
}

Stream<int> asyncRangeGenerator(int start, int finish) async* {
  for (int i = start; i <= finish; i++) {
    yield i;
  }
}

Iterable<int> syncRangeGenerator(int start, int finish) sync* {
  for (int i = start; i <= finish; i++) {
    yield i;
  }
}

useStream2Example() {
  StreamController eventController = StreamController();
  eventController.add("first");
  eventController.add("second");
  eventController.stream.listen((event) {
    if (event == "second") {
      print('some second _ may bee');
    }
    print(event);
  });
  eventController.add("third");
  // eventController.stream.listen((event) {
  //   print(event);
  // });
}

useStream1Example() {
  // https://www.youtube.com/watch?v=eI7fxyzjGzc&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=26
  // Stream - конвеер событий
  // StreamSubscription - подписка на конвеер событий
  // StreamController - создаем конвеер, в который сможем докидывать данные и который не заключен во временные события

// задаем конвеер который будет, что-то выполнять с определенной периодиченостью
// в данном случае каждую 1 секунду
  Stream<int> konveerClockWatch =
      Stream.periodic(Duration(seconds: 1), (tick) => tick);
  // подписка на конвеер listen-слушает тики 'tick'
  StreamSubscription podpiskaNaKonveer = konveerClockWatch.listen((tick) {
    if (tick == 3) {
      print('что-то делается на 4ой секунде');
    }
    print(tick);
  });

  // делает отписку через 7сек от события
  // _ например при полной подгрузке БД можно off
  Future.delayed(Duration(seconds: 7)).then((value) {
    print('all is done! gladly) ');
    podpiskaNaKonveer.cancel();
  });
}

// ----------------------------------------------------------------------
useAsyncAwaitInFuture() async {
  // youtube.com/watch?v=vd2NTINR4ic&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=25
  print(10);
  // step 2 and 4 - выполнятся одновременно и это будет видно в консоли
  getSomeFuture(3, "step 2").then((value) => print(value));
  print(30);
  // await - ждем что-то нужное например подгрузку БД/рекламы и только потом грузим остальное далее по коду
  await getSomeFuture(6, 'step 4').then((value) => print(value));
  print(50);
  getSomeFuture(9, "step 6").then((value) => print(value));
  // print(60);
}

Future<int> getSomeFuture(int someSecond, [String? message]) {
  print(message);
  Future<int> result =
      Future.delayed(Duration(seconds: someSecond)).then((value) => 20);
  return result;
}

simpleFuture2Example() {
  // синхронный / асинхронный Future в Dart
  // https://www.youtube.com/watch?v=aDG0j6dItG4&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=24

  // Синхронны поток:
  // 1 шаг - выполнился первым
  // 2 шаг - выполнился вторым
  // 3 шаг - выполнился третьим и тд..

  // Асинхронный поток:
  // 1 шаг - выполнился первым
  // 2 шаг (Future) - выполнить после того, как дойдет до конца
  // 3 шаг - выполнится вторым
  // 4 шаг - выполнится третьим и далее операций нет
  // Future выполнится четвертым

  // Практика применения асинхронщины:
  // загрузка файла из телефона
  // загрузка рекламы в app
  // загрузка Базы Данных перед её использованием и тд..

  print(0);
  Future.delayed(Duration(seconds: 6)).then((_) => print(1));
  print(2);
  sleep(Duration(seconds: 2));
  print(3);
}

simpleFutureExample() {
  // простой пример Future in Dart
  // https://www.youtube.com/watch?v=t-NdiWIJhyU&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=23
  Future<int> futureZero =
      Future.delayed(Duration(seconds: 5)).then((value) => 0);

  int a = 1;
  // ждем 5 сек и берем value те '2'
  Future<int> futureB = Future.delayed(Duration(seconds: 5)).then((value) => 2);
  int c = 3;

  futureZero.then((value) => print(value)); //выведет в конс '0' черз 5сек
  print(a); // 1
  print(futureB); // Instance of 'Future<int>'
  print(c); // 3
}

// ----------------------------------------------------------------------

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
