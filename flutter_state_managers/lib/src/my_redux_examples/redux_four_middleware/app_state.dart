// Глобальное состояние, содержащее остальные стейты

import 'package:flutter/material.dart';

class AppState {
  final int counter; // поля для состояния счетчика
  final String text; // поля для состояния текста
  final Widget widget; // поле для состояния widget

  AppState({required this.counter, required this.text, required this.widget});
}
