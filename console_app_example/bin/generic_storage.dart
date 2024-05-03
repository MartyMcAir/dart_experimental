import 'enum.dart';

void main() {
  // int
  final storageInt = LocalStorage(5);
  final storageStr = LocalStorage("string");
  final storageDouble = LocalStorage<double>(3.14);

  int some = 2 + 2;
  print("runTimeType:");
  print('runTimeType: ${some.runtimeType}');
}

class LocalStorage<T> {
  late T _value;

  LocalStorage(this._value);

  // T get value => _value;
  // set value(T value) {
  //   _value = value;
  // }

  // like a CRUD

  T read() => _value;
  void update(T value) {
    this._value = value;
  }
}
