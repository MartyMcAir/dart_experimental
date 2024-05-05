void main() {
  final Animal someWolf = Wolf(weight: 150);
  final someTiger = Tiger();

  someWolf.makeSound();
  someTiger.makeSound();

  // -----------------------
  final duck = Duck();
  duck.makeSound();
}

// abstract interface class Animal {
// abstract final class Animal {
// abstract base class Animal { // sealed !?
abstract interface class Animal {
  double get weight;
  void makeSound();
}

class Wolf implements Animal {
  Wolf({required this.weight});
  @override
  void makeSound() {
    print("wolf yelling");
  }

  @override
  final double weight;
}

class Tiger implements Animal {
  // double weight = 150.0;
  @override
  void makeSound() {
    print("tiger yelling");
  }

  @override
  // double get weight => throw UnimplementedError();
  double get weight {
    return 300;
  }
}

// ---------------------------------

abstract class Bird implements Animal {
  // Static
  // https://www.youtube.com/watch?v=7OwXBisej48&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=20
  static const String name = "";
}

class Duck extends Bird {
  @override
  void makeSound() {
    print("duck crya crya");
  }

  @override
  double get weight => 3;
}

// ---------------------------------

// final class can bee extends from another final class

abstract class Furniture {
  double get cost;
  void makeSound();
}

final class Table extends Furniture {
  @override
  void makeSound() {
    // TODO: implement makeSound
  }

  @override
  // TODO: implement cost
  double get cost => throw UnimplementedError();
}

final class LiteTable extends Table {}
