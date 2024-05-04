void main() {
  final Man alex = Man(name: "Alex", age: 13, height: 88);
  final Man djek = alex.copyWith(name: "Djek");

  print(alex.age);
  // alex.grewUp(1);
  print(alex.age);

  print(alex.nameAndAge);
  print(djek.nameAndAge);
}

class Man {
  final String name;
  final int age;
  final double height;

  // 'required this.name' - that's mean Non-nullable types
  Man({required this.name, required this.age, required this.height});

  String get nameAndAge => "$name:$age";

  // int get age => _age;
  // const Man({required this.name, required int age, required this.height}) : _age = age;
  // final int _age;
  // void grewUp(int years) {  _age += years; }

  // String? - that's mean not required, and it can be null
  // 'String? name' - nullable types
  Man copyWith({String? name, int? age, double? height}) {
    return Man(
        // ?? if have null -> it's ok this.name _ like ternary operator
        name: name ?? this.name,
        age: age ?? this.age,
        height: height ?? this.height);
  }
}
