import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todo_list_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => SomeNotifier(),
      child: const NotifierApp()));
}

class NotifierApp extends StatelessWidget {
  const NotifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NotifierPage());
  }
}

class NotifierPage extends StatelessWidget {
  const NotifierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: NotifierScreen());
  }
}

class SomeNotifier extends ChangeNotifier {
  final List<TaskDto> _tasks = [
    TaskDto(title: 'Learn Flutter', isCompleted: false)
  ];

  List<TaskDto> get tasks => _tasks;

  void checkTask(int index) {
    tasks[index].isDone();
    notifyListeners();
  }
}

class TaskDto {
  final String title;
  bool isCompleted;

  TaskDto({required this.title, required this.isCompleted});

  void isDone() {
    isCompleted = !isCompleted;
  }
}
