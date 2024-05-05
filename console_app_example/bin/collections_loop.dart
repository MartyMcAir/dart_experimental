import 'package:dart_application_1/model/boss.dart';

void main(List<String> arguments) {
  // examples simpler
  var exampleList = <double>[];
  var exampleMap = <String, int>{};
  var exampleSet = <int>{};

  // for understanding what Type (of data) 'do' we use
  List<double> exampleList2 = <double>[];
  // Map<String, int> exampleMap2 = Map<String, int>();
  Map<String, int> exampleMap3 = <String, int>{};
  // Set<int> exampleSet2 = Set<int>();
  Set<int> exampleSet2 = <int>{};
  exampleMap3.clear();

  exampleSet2.addAll(exampleSet);
  // equalient addAll(*).addAll(*);
  List someList = [...exampleList, ...exampleList2];

  // cascade notation
  someList
    ..add(1)
    ..add(2)
    ..add(3);
  // equalient
  // someList.add(1);
  // someList.add(2);
  // someList.add(3);

  collectionFunctionExample();
}

collectionFunctionExample() {
  // https://dart.dev/guides/language/language-tour#built-in-types
  List someList = [], listTwo = [6, 2, 3, 7, 8, 9];
  List<int> intList = [1, 2, 3, 3, 2];
  Set<num> numList = {1, 2, 3};
  Map<String, int> myMap = {"one": 1, "two": 2};
  // https://www.youtube.com/watch?v=-oHF3HIT0F8&list=PLtUuja72DaLLAo63Zsn1UsLONDafJKWrl&index=15
  final finalMap = <String, double>{"one": 1, "two": 2};
  final dynamicMap = <dynamic, dynamic>{5.5: "some string", "some string": 5.5};
  finalMap["Alex"] = 5.0; // add to map
  finalMap.remove("Alex");
  print(finalMap);
  dynamicMap.addAll(finalMap);
  print(finalMap.keys);
  print('finalMap list: $finalMap.keys.toList()');
  print('finalMap contains key "one"?: $finalMap.containsKey("one")');

  // https://www.youtube.com/watch?v=PkyLGWkzEr0&list=PLtUuja72DaLLAo63Zsn1UsLONDafJKWrl&index=11
  final finalList = ["one", "two"];
  for (var i = 0; i < finalList.length; i++) {
    print(finalList[i]);
  }
  // forEach example
  for (final item in finalList) {
    print(item);
  }

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
