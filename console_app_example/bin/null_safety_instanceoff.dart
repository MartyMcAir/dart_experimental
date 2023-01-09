void main(List<String> arguments) {
  // class DateTime https://www.youtube.com/watch?v=QxltJeUlzCk&list=PLyaYkfwvXhRLQSevXcKNIlz4JtPt2W7P_&index=9
  DateTime someDate = DateTime(2020, 9, 1);
  print(someDate); // 2020-09-01 00:00:00.000

  DateTime parseDate = DateTime.parse('2020-09-01 21:00:00.000');
  print(parseDate); // 2020-09-01 21:00:00.000
  print(parseDate.year); // 2020
  print(parseDate.month); // 9
  print(parseDate.day); // 1

  // сравнение дат _ compare
  print('someDate.isBefore(parseDate): ${someDate.isBefore(parseDate)}'); //true
  print('someDate.isAfter(parseDate): ${someDate.isAfter(parseDate)}'); //false
  print('someDate.isAfter(parseDate): ${someDate.isAfter(parseDate)}'); //true
  print('parseDate.compareTo(someDate): ${parseDate.compareTo(someDate)}'); //1
  print('someDate.compareTo(parseDate): ${someDate.compareTo(parseDate)}'); //-1

  // разница по времени в 21:00:00.000000
  print('parseDate.difference(someDate): ${parseDate.difference(someDate)}');
  DateTime newDate = someDate.add(Duration(hours: 21));
  // -1:00:00.000000
  print('parseDate.difference(newDate): ${parseDate.difference(newDate)}');
  DateTime newDate2 = someDate.add(Duration(hours: 22));
  print('parseDate.difference(newDate2): ${parseDate.difference(newDate2)}');

  // useNullSafetyAndInstanceOffExample();
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
