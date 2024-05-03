// https://www.youtube.com/watch?v=Nf98aeZING4&list=PLtUuja72DaLLAo63Zsn1UsLONDafJKWrl&index=18

void main() {
  var elon =
      HumanWithPrivateField(name: 'Elon Musk', birthYear: 1971, growth: 1.88);
  // elon.name = "Dart Veider"; // final var catn't modif..

  // if you try to do the same for this field in another file = nothing will work
  // beacause it's private field
  elon._birthYear = 1989;
  print(elon._birthYear); // 1989

  // ---
  print(elon._cash); // 10 + 10
  print(elon._cash); // 20 + 20
  print('three: $elon._cash'); // three: man name: Elon Musk._cash
  elon.cash = 999;
  print(elon._cash);

  // --------------------------------------------------------
  var elon1 =
      HumanWithStaticCounter(name: 'Elon', birthYear: 1971, growth: 1.88);
  var elon2 =
      HumanWithStaticCounter(name: 'Elon', birthYear: 1971, growth: 1.88);
  print(HumanWithStaticCounter.humanCounter); // 2
}

class HumanWithStaticCounter {
  static int humanCounter = 0;

  HumanWithStaticCounter(
      {required this.name,
      required int birthYear,
      required this.growth,
      this.cash = 10}) {
    humanCounter += 1;
  }

  final String name; // unmodifable field (like in java)
  // not private in one file !?wtf!?
  int _birthYear = 10; // _private field whit "_*someField"
  double growth; // height

  int cash;
  get _cash => cash += cash;
  // set _cash(int value) => _cash = value;

  @override
  String toString() {
    return 'man name: $name';
  }
}

class HumanWithPrivateField {
  static int humanCounter = 1;

  HumanWithPrivateField(
      {required this.name,
      required int birthYear,
      required this.growth,
      this.cash = 10}) // cash field with default value
      : _birthYear = birthYear; // private field

  final String name; // unmodifable field (like in java)
  // not private in one file !?wtf!?
  int _birthYear; // _private field whit "_*someField"
  double growth; // height

  int cash;
  get _cash => cash += cash;
  // set _cash(int value) => _cash = value;

  @override
  String toString() {
    return 'man name: $name';
  }
}
