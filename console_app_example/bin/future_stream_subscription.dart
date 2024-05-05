import 'dart:async';
import 'dart:io';

void main(List<String> arguments) {
// useStream2Example();
  useStream1Example();
// ---
// simpleFuture2Example();
// simpleFutureExample();
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
  Stream<int> konveerClockWatch = Stream.periodic(
      Duration(seconds: 1), (tick) => tick); // print every 1 second
  // подписка на конвеер listen-слушает тики 'tick'
  StreamSubscription podpiskaNaKonveer = konveerClockWatch.listen((eventTick) {
    if (eventTick == 3) {
      print('что-то делается на 4ой секунде');
    }
    print(eventTick);
  });

  // делает отписку через 7сек от события
  // _ например при полной подгрузке БД можно off
  Future.delayed(Duration(seconds: 7)).then((value) {
    print('all is done! gladly)');
    podpiskaNaKonveer.cancel();
  });
  // 0 - 1 - 2
  // 'что-то делается на 4ой секунде'
  // 3 - 4 - 5 - 6
  // 'all is done! gladly)' - after 7 seconds
}

// ----------------------------------------------------------------------

simpleFuture2Example() {
  // синхронный / асинхронный Future в Dart
  // https://www.youtube.com/watch?v=aDG0j6dItG4&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=24

  // Синхронны поток:
  // 1 шаг - выполнился первым
  // 2 шаг - выполнился вторым
  // 3 шаг - выполнился третьим и тд..

  // Асинхронный поток: (async it implement Future - for ordering)
  // 1 шаг - выполнился первым
  // 2 шаг (Future) - выполнить после того, как дойдет до конца
  // 3 шаг - выполнится вторым
  // 4 шаг - выполнится третьим и далее операций нет
  // Future выполнится четвертым // because it wait 6 seconds

  // Практика применения асинхронщины: (where need to wait)
  // загрузка файла из телефона
  // загрузка рекламы в app
  // загрузка Базы Данных перед её использованием и тд..

  print(0);
  Future.delayed(Duration(seconds: 6)).then((_) => print(1));
  print(2);
  sleep(Duration(seconds: 2));
  print(3);
  // 0
  // 2
  // wait 2 seconds
  // 3
  // 1 (after 6 seconds)
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
  futureB.then((value) => print(value)); // print after (5sec) c: value is 2
  print(c); // 3

  // 1
  // Instance of 'Future<int>'
  // 3
  // 2 (here right Future)
}
