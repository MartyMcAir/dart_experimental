class Person {
  int? id;
  // Static
  // https://www.youtube.com/watch?v=7OwXBisej48&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=20
  static final cachePersons = <Person>[Person(1), Person(2), Person(3)];

  Person(this.id);

  factory Person.factory(int id) {
    return cachePersons[id];
  }

  factory Person.factoryFromJava(int id) {
    Person personResult = cachePersons[id];
    // https://dart.dev/tools/diagnostic-messages?utm_source=dartdev&utm_medium=redir&utm_id=diagcode&utm_content=unnecessary_null_comparison#unnecessary_null_comparison
    // не понял почему подчеркивает
    if (personResult != null) {
      return personResult;
    } else {
      personResult = Person(id);
      cachePersons.add(personResult);
    }
    return personResult;
  }
}

/**
 * Documentation comments
 */
// void main() // it can be work too

var greeting = 'Hey';

/// first [greeting]
/// second [main]
/// third [arguments]
/// fourth [print]
void main(List<String> arguments) {
  // factory constructor: https://www.youtube.com/watch?v=8CipQBYnmfE&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=33
  // не понял почему в видео это работает а у меня нет!?
  // на https://dartpad.dev/? - результ ттакой же
  final Person rick = Person(1);
  final Person rick2 = Person(1);
  final Person morty = Person(2);
  print('rick.hashCode: ${rick.hashCode}');
  print(rick2.hashCode);
  print(morty.hashCode);
  // useAnonumus();

  // Using factory with example cache
  final a = PersonForFactory.cache(0);
  final b = PersonForFactory.cache(0);
  final c = PersonForFactory.cache(8); // it create new obj
  final d = PersonForFactory.cache(100); // it return Gentlemen
  print('a.hashCode: ${a.hashCode}'); // 869218102
  print(b.hashCode); // 869218102
  print(c.hashCode); // 527130879 - another hashCode
  print(d); // toString -> Gentlemen{}
}

class PersonForFactory {
  int id;

  static final cacheUsers = <PersonForFactory>[
    PersonForFactory(0),
    PersonForFactory(1),
    PersonForFactory(2),
  ];
  // standart constructor always create new Object
  PersonForFactory(this.id);
  // Factory constructor - NOT always create new Obj, &it allows works with conditions (like if/else/etc)
  factory PersonForFactory.cache(int id) {
    if (id == 0) {
      return cacheUsers[0];
    } else if (id == 1) {
      return cacheUsers[1];
    } else if (id == 100) {
      return Gentlemen(id);
    } else {
      return PersonForFactory(id);
    }
  }

  @override
  String toString() {
    return 'PersonForFactory{id=$id, cacheUsers=$cacheUsers}';
  }
}

class Gentlemen extends PersonForFactory {
  // Gentlemen(super.id);
  // equialent _ equals:
  Gentlemen(int id) : super(id);

  void somePrint() {
    print("it's Gentlemen!");
  }

  @override
  String toString() {
    return 'Gentlemen{}';
  }
}

useAnonumus() {
  // https://www.youtube.com/watch?v=Q0Qdy3JCpSk&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=32
  // Аноним функции
  var sumResult = universalFunc(3, 3, (a, b) => {a + b});
  var divisionResult = universalFunc(13, 3, (a, b) => {a / b});
  print(sumResult);
}

universalFunc(double a, double b, Function operation) {
  return operation(a, b);
}

getBookWithClosure(bookName) {
  // String namedFunction(bookName) {
  //   return bookName;
  // }

  // using ANoNiM function - No Name Function
  return (bookPublisher) {
    return 'bookName: $bookName, bookPublisher: $bookPublisher';
  };
}

// https://dart.dev/effective-dart/usage - Dart usage recommendation
int exampleFunctionInOneLine(int a, int b) => a + b;
// equalient
int exampleFunctionInOneLine2(int a, int b) {
  return a + b;
}
