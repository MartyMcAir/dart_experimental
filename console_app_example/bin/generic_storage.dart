import 'dart:async';

import 'enum.dart';

void main() {
  // int
  LocalStorage<double> storageStr = LocalStorage("string", value: 3.15);
  var storageDouble =
      LocalStorage<double>("", value: 3.14, nullableValue: null);
  final storageInt = LocalStorage("", value: 5);

  int some = 2 + 2;
  print("runTimeType:");
  print('runTimeType: ${some.runtimeType}');
}

class LocalStorage<T> {
  String? nullableValue;
  late T value;
  String _some;

  LocalStorage(this._some, {required this.value, this.nullableValue});

  String get some => _some;
  set setSome(someNew) => this._some = someNew;

  // LocalStorage(this._value);

  // T get value => _value;
  // set value(T value) {
  //   _value = value;
  // }

  // like a CRUD

  T read() => value;
  void update(T value) {
    this.value = value;
  }
}
