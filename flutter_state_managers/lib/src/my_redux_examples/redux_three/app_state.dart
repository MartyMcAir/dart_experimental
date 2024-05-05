// Глобальное состояние, содержащее остальные стейты

class AppState {
  final int counter; // поля для состояния счетчика
  final String text; // поля для состояния текста

  AppState({required this.counter, required this.text});
}
