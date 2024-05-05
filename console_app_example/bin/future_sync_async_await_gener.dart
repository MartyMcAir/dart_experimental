import 'dart:io';

void main(List<String> arguments) {
  useGeneratorsSyncOrAsync();
  // useAsyncAwaitInFuture();
}

useGeneratorsSyncOrAsync() {
  // Generators - https://www.youtube.com/watch?v=Y9aQLyv3qCg&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=27
  print(asyncRangeGenerator(13, 18).listen((event) {
    print(event); // almost like Futute wait some * seconds
  }));
  sleep(Duration(seconds: 5));
  print(syncRangeGenerator(3, 8));
  // (3, 4, 5, 6, 7, 8) -- syncRangeGenerator(..)
  // 13 - 14 - 15 - 16 - 17 - 18 -- asyncRangeGenerator(..)
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

// ------------------------------------------------------------------

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

  // 10
  // step 2 - from Future withOut wait
  // 30
  // step 4 - from Future witOut wait
  // 20 - future wait 3 seconds
  // 20 - future wait 6 seconds
  // 50
  // step 6 - from Future witOut wait
  // 20 - future wait 9 seconds
}

Future<int> getSomeFuture(int someSecond, [String? message]) {
  print(message);
  return Future.delayed(Duration(seconds: someSecond)).then((value) => 20);
}
