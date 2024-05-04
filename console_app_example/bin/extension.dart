void main() {
  final game = MinecrafGame();
  game.playerMove();
  game.playerBuil();
  game.playerDestroy();
  game.playerCraft();
  print(game.level);
}

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
