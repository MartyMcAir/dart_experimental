class Person {
  int? id;
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
  print(rick.hashCode);
  print(rick2.hashCode);
  print(morty.hashCode);

  // useAnonumus();
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
