void main() {
  // Extension
  // https://www.youtube.com/watch?v=cwIZfCw3Rv4&list=PL5hgLeGlfJX222dEJY-YWObfAewOIWbvD&index=18
  // https://www.youtube.com/watch?v=1jRNG6nMhjM&list=PLtUuja72DaLLAo63Zsn1UsLONDafJKWrl&index=29
  final game = MinecrafGame();
  game.playerMove();
  game.playerBuil();
  game.playerDestroy();
  game.playerCraft();
  print(game.level);

  // Mixin
  // https://www.youtube.com/watch?v=sSF99-GOvMY
  var lexLutor = Puser(name: 'Lex Lutor');
  var tonyStark = Karapuser(name: 'Tony Stark');
  // mixin don't have access to field in class, but can add function
  print(tonyStark.showThisName(tonyStark.name));
  print(lexLutor.showThisName(lexLutor.name)); // name: Lex Lutor and cash: null
  // mixin can contains field for every class
  lexLutor.cash = 999999;
  print(
      lexLutor.showThisName(lexLutor.name)); // ame: Lex Lutor and cash: 999999
  print(tonyStark
      .showThisName(tonyStark.name)); // name: Tony Stark and cash: null
}

// Mixin ----------------------------------------------------------------
mixin showName {
  int? cash;
  showThisName(String name) {
    return 'name: $name and cash: $cash';
  }
}

class Puser with showName {
  String name;
  Puser({required this.name});

  // showName() {
  //   return name;
  // }

  showNameWith(another) {
    return 'name and another: $another';
  }
}

class Karapuser with showName {
  String name;
  Karapuser({required this.name});

  // showName() {
  //   return name;
  // }
}

// Extension ------------------------------------------------------------
class MinecrafGame {
  int level = 0;
  void playerMove() {
    print("character move");
    level += 1;
  }

  void playerBuil() {
    print("character build something");
    level += 1;
  }
}

extension on MinecrafGame {
  void playerCraft() {
    print("player craft");
    level += 1;
  }
}

extension MinecraftGameDestroyExt on MinecrafGame {
  void playerDestroy() {
    print("some destroy");
    level += 1;
  }
}
