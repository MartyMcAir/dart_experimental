import './people.dart';

class Boss extends People {
  Boss(super.name, super.age, super.veight);

  String _title = 'some';

  String get getTitle => _title;
  String get initialTitle => _title;

  set setTitle(String title) => _title = title;

  void someInit() {
    print('some init');
  }

  @override
  get getAddress => "Now she live in my room";

  @override
  String toString() {
    return super.toString();
  }
}
