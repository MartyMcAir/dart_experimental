class People {
  // nullsafety
  // https://www.youtube.com/watch?v=45__JhK5ZQo&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=6
  String name; // like: String name = null;

  // тут "name / address / _age" - это не поля как в Java
  // это называется "Свойства": https://www.youtube.com/watch?v=TpSCIc-cPGY&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=11
  String address = "default address";
  String? surname; // как занести значение по умолчанию иснтрументами языка!?
  // _age - private field _ В Dart всё по умолчанию public,
  // а private для всех что начинается на "_***"
  int _age;
  double veight;

  // нельзя перегружать конструктор, НО можно создавать "КакБыПодКонструктор"
  // https://dart.dev/tools/diagnostic-messages?utm_source=dartdev&utm_medium=redir&utm_id=diagcode&utm_content=duplicate_constructor#duplicate_constructor
  // https://www.youtube.com/watch?v=hCT-XXSbIWA&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=13
  People.one(this._age, this.veight, this.name, this.address);
  People.two(this._age, {required this.name, required this.veight}) {
    print("hello $name");
  }

  People(this.name, this._age, this.veight);

  @override
  toString() {
    return 'name: $name, address: $address, surname: $surname, _age: $_age, veight: $veight';
  }

  myToString() {
    return "name:" +
        name +
        ", address: " +
        address +
        ", surname: " +
        (surname ?? "some_surname_NotNull") +
        // ", _age: " +
        // (_age ?? 9999) + // не понял как занести в строку int
        ", veight: ";
  }

  get getName => this.name;

  String getName2() {
    return this.name;
  }

  set setName(name) => this.name = name;

  get getAddress => this.address;

  // set setAddress(address) => this.address = address;

  get getSurname => this.surname;

  set setSurname(surname) => this.surname = surname;

  get getAge => this._age;

// setter using lyambda expression
  set setAge(value) => this._age = value;

// same like "setAge(value)"
  set setAge2(value) {
    this._age = value;
  }

  get getVeight => this.veight;

  set setVeight(veight) => this.veight = veight;
}
